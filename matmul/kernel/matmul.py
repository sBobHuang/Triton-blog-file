# The use of PyTorch in Triton programs is not allowed for the purposes of fair benchmarking.
import triton
import triton.language as tl

@triton.jit
def matrix_multiplication_kernel(
    a_ptr, b_ptr, c_ptr,
    M, N, K,
    stride_am, stride_an,
    stride_bn, stride_bk,
    stride_cm, stride_ck,
    BLOCK_SIZE_M: tl.constexpr, BLOCK_SIZE_K: tl.constexpr
):
    a_ptr = a_ptr.to(tl.pointer_type(tl.float32))
    b_ptr = b_ptr.to(tl.pointer_type(tl.float32))
    c_ptr = c_ptr.to(tl.pointer_type(tl.float32))
    pid_k = tl.program_id(axis=0)
    pid_m = tl.program_id(axis=1)

    offs_m = pid_m * BLOCK_SIZE_M + tl.arange(0, BLOCK_SIZE_M)
    offs_k = pid_k * BLOCK_SIZE_K + tl.arange(0, BLOCK_SIZE_K)

    # 初始化A和B的指针
    a_ptrs = a_ptr + offs_m[:, None] * stride_am
    b_ptrs = b_ptr + offs_k[None, :] * stride_bk

    accumulator = tl.zeros((BLOCK_SIZE_M, BLOCK_SIZE_K), dtype=tl.float32)

    # 沿N维度依次累加
    for n in range(N):
        # 加载A和B的当前值
        a = tl.load(a_ptrs + n * stride_an)
        b = tl.load(b_ptrs + n * stride_bn)
        accumulator += a * b

    # 将结果写回C
    c_ptrs = c_ptr + offs_m[:, None] * stride_cm + offs_k[None, :] * stride_ck
    offs_cm = pid_m * BLOCK_SIZE_M + tl.arange(0, BLOCK_SIZE_M)
    offs_ck = pid_k * BLOCK_SIZE_K + tl.arange(0, BLOCK_SIZE_K)
    c_mask = (offs_cm[:, None] < M) & (offs_ck[None, :] < K)
    tl.store(c_ptrs, accumulator, mask=c_mask)

# a_ptr, b_ptr, c_ptr are raw device pointers
def solve(a_ptr: int, b_ptr: int, c_ptr: int, M: int, N: int, K: int):
    stride_am, stride_an = N, 1
    stride_bn, stride_bk = K, 1
    stride_cm, stride_ck = K, 1

    grid = lambda META: (triton.cdiv(K, META['BLOCK_SIZE_K']), triton.cdiv(M, META['BLOCK_SIZE_M']), )
    matrix_multiplication_kernel[grid](
        a_ptr, b_ptr, c_ptr,
        M, N, K,
        stride_am, stride_an,
        stride_bn, stride_bk,
        stride_cm, stride_ck,
        BLOCK_SIZE_M=128,
        BLOCK_SIZE_K=64,
    )


M, N, K = 8192, 6144, 4096

import torch
device = torch.cuda.current_device()

A = torch.randn(M, N, device=device)
B = torch.randn(N, K, device=device)
C = torch.randn(M, K, device=device)
solve(A[None], B[None], C[None], M, N, K)
torch_output = torch.matmul(A, B)

if torch.allclose(C, torch_output, atol=0.125, rtol=0):
    print("✅ Triton and Torch match")
else:
    print("❌ Triton and Torch differ")
