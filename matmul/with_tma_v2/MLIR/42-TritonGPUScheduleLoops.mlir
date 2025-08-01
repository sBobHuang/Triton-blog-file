// Next run Pass --tritongpu-pipeline
// IR Dump After TritonGPUScheduleLoops ('builtin.module' operation)
// Current Run Pass --tritongpu-schedule-loops

#blocked = #ttg.blocked<{sizePerThread = [1, 64], threadsPerWarp = [32, 1], warpsPerCTA = [4, 1], order = [0, 1]}>
#blocked1 = #ttg.blocked<{sizePerThread = [1, 1], threadsPerWarp = [1, 32], warpsPerCTA = [2, 2], order = [1, 0]}>
#loc = loc("/home/ubuntu/triton/matmul.py":6:0)
#shared = #ttg.nvmma_shared<{swizzlingByteWidth = 128, transposed = false, elementBitWidth = 32}>
#shared1 = #ttg.nvmma_shared<{swizzlingByteWidth = 128, transposed = true, elementBitWidth = 32}>
#smem = #ttg.shared_memory
#tmem = #ttng.tensor_memory_encoding<blockM = 128, blockN = 64, unpacked = true>
module attributes {"ttg.num-ctas" = 1 : i32, "ttg.num-warps" = 4 : i32, ttg.target = "cuda:100", "ttg.threads-per-warp" = 32 : i32} {
  tt.func public @matmul_kernel_make_tensor_desciptor(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg3: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg4: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg5: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0)) attributes {noinline = false} {
    %cst = arith.constant dense<0.000000e+00> : tensor<128x64xf32, #blocked> loc(#loc1)
    %c63_i32 = arith.constant 63 : i32 loc(#loc1)
    %c1_i32 = arith.constant 1 : i32 loc(#loc1)
    %c0_i32 = arith.constant 0 : i32 loc(#loc1)
    %c64_i32 = arith.constant 64 : i32 loc(#loc1)
    %c128_i32 = arith.constant 128 : i32 loc(#loc1)
    %c1_i64 = arith.constant 1 : i64 loc(#loc1)
    %true = arith.constant true loc(#loc1)
    %false = arith.constant false loc(#loc1)
    %0 = tt.get_program_id x : i32 loc(#loc2)
    %1 = tt.get_program_id y : i32 loc(#loc3)
    %2 = arith.extsi %arg4 : i32 to i64 loc(#loc4)
    %3 = tt.make_tensor_descriptor %arg0, [%arg3, %arg4], [%2, %c1_i64] : <f32>, <tensor<128x64xf32, #shared>> loc(#loc4)
    %4 = arith.extsi %arg5 : i32 to i64 loc(#loc5)
    %5 = tt.make_tensor_descriptor %arg1, [%arg4, %arg5], [%4, %c1_i64] : <f32>, <tensor<64x64xf32, #shared>> loc(#loc5)
    %6 = tt.make_tensor_descriptor %arg2, [%arg3, %arg5], [%4, %c1_i64] : <f32>, <tensor<128x64xf32, #shared>> loc(#loc6)
    %7 = arith.addi %arg4, %c63_i32 : i32 loc(#loc20)
    %8 = arith.divsi %7, %c64_i32 : i32 loc(#loc21)
    %9 = arith.muli %0, %c128_i32 : i32 loc(#loc10)
    %10 = arith.muli %1, %c64_i32 : i32 loc(#loc11)
    %result, %token = ttng.tmem_alloc : () -> (!ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable>, !ttg.async.token) loc(#loc12)
    %11 = ttng.tmem_store %cst, %result[%token], %true : tensor<128x64xf32, #blocked> -> !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> loc(#loc12)
    %12:2 = scf.for %arg6 = %c0_i32 to %8 step %c1_i32 iter_args(%arg7 = %false, %arg8 = %11) -> (i1, !ttg.async.token)  : i32 {
      %14 = arith.muli %arg6, %c64_i32 {loop.cluster = 2 : i32, loop.stage = 0 : i32} : i32 loc(#loc14)
      %15 = tt.descriptor_load %3[%9, %14] {loop.cluster = 2 : i32, loop.stage = 0 : i32} : !tt.tensordesc<tensor<128x64xf32, #shared>> -> tensor<128x64xf32, #blocked1> loc(#loc15)
      %16 = ttg.local_alloc %15 {loop.cluster = 0 : i32, loop.stage = 2 : i32} : (tensor<128x64xf32, #blocked1>) -> !ttg.memdesc<128x64xf32, #shared, #smem> loc(#loc15)
      %17 = tt.descriptor_load %5[%14, %10] {loop.cluster = 2 : i32, loop.stage = 0 : i32} : !tt.tensordesc<tensor<64x64xf32, #shared>> -> tensor<64x64xf32, #blocked1> loc(#loc16)
      %18 = ttg.local_alloc %17 {loop.cluster = 0 : i32, loop.stage = 2 : i32} : (tensor<64x64xf32, #blocked1>) -> !ttg.memdesc<64x64xf32, #shared1, #smem> loc(#loc16)
      %19 = ttng.tc_gen5_mma %16, %18, %result[%arg8], %arg7, %true {loop.cluster = 0 : i32, loop.stage = 2 : i32, tt.self_latency = 1 : i32} : !ttg.memdesc<128x64xf32, #shared, #smem>, !ttg.memdesc<64x64xf32, #shared1, #smem>, !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> loc(#loc12)
      scf.yield %true, %19 : i1, !ttg.async.token loc(#loc17)
    } {tt.scheduled_max_stage = 2 : i32} loc(#loc13)
    %result_0, %token_1 = ttng.tmem_load %result[%12#1] : !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> -> tensor<128x64xf32, #blocked> loc(#loc12)
    %13 = ttg.convert_layout %result_0 : tensor<128x64xf32, #blocked> -> tensor<128x64xf32, #blocked1> loc(#loc13)
    tt.descriptor_store %6[%9, %10], %13 : !tt.tensordesc<tensor<128x64xf32, #shared>>, tensor<128x64xf32, #blocked1> loc(#loc18)
    tt.return loc(#loc19)
  } loc(#loc)
} loc(#loc)
#loc1 = loc(unknown)
#loc2 = loc("/home/ubuntu/triton/matmul.py":14:26)
#loc3 = loc("/home/ubuntu/triton/matmul.py":15:26)
#loc4 = loc("/home/ubuntu/triton/matmul.py":18:8)
#loc5 = loc("/home/ubuntu/triton/matmul.py":24:8)
#loc6 = loc("/home/ubuntu/triton/matmul.py":30:8)
#loc7 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:22)
#loc8 = loc("/home/ubuntu/triton/matmul.py":37:30)
#loc9 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:28)
#loc10 = loc("/home/ubuntu/triton/matmul.py":38:33)
#loc11 = loc("/home/ubuntu/triton/matmul.py":39:51)
#loc12 = loc("/home/ubuntu/triton/matmul.py":40:32)
#loc13 = loc("/home/ubuntu/triton/matmul.py":37:19)
#loc14 = loc("/home/ubuntu/triton/matmul.py":38:51)
#loc15 = loc("/home/ubuntu/triton/matmul.py":38:24)
#loc16 = loc("/home/ubuntu/triton/matmul.py":39:24)
#loc17 = loc("/home/ubuntu/triton/matmul.py":40:8)
#loc18 = loc("/home/ubuntu/triton/matmul.py":43:63)
#loc19 = loc("/home/ubuntu/triton/matmul.py":43:4)
#loc20 = loc(callsite(#loc7 at #loc8))
#loc21 = loc(callsite(#loc9 at #loc8))
