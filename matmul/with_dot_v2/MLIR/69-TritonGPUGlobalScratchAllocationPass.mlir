// Next run Pass --triton-nvidia-gpu-proxy-fence-insertion
// IR Dump After TritonGPUGlobalScratchAllocationPass ('builtin.module' operation)
// Current Run Pass --tritongpu-global-scratch-memory-allocation

#blocked = #ttg.blocked<{sizePerThread = [1, 4], threadsPerWarp = [2, 16], warpsPerCTA = [4, 1], order = [1, 0]}>
#blocked1 = #ttg.blocked<{sizePerThread = [1, 64], threadsPerWarp = [32, 1], warpsPerCTA = [4, 1], order = [0, 1]}>
#loc = loc("/home/ubuntu/triton/matmul.py":6:0)
#loc1 = loc(unknown)
#loc24 = loc("/home/ubuntu/triton/matmul.py":32:22)
#loc25 = loc("/home/ubuntu/triton/matmul.py":35:20)
#loc26 = loc("/home/ubuntu/triton/matmul.py":36:20)
#shared = #ttg.swizzled_shared<{vec = 1, perPhase = 1, maxPhase = 1, order = [0]}>
#shared1 = #ttg.nvmma_shared<{swizzlingByteWidth = 128, transposed = false, elementBitWidth = 32}>
#shared2 = #ttg.nvmma_shared<{swizzlingByteWidth = 128, transposed = true, elementBitWidth = 32}>
#smem = #ttg.shared_memory
#tmem = #ttng.tensor_memory_encoding<blockM = 128, blockN = 64, unpacked = true>
module attributes {ttg.global_scratch_memory_alignment = 1 : i32, ttg.global_scratch_memory_size = 0 : i32, "ttg.num-ctas" = 1 : i32, "ttg.num-warps" = 4 : i32, ttg.shared = 147472 : i32, ttg.target = "cuda:100", ttg.tensor_memory_size = 64 : i32, "ttg.threads-per-warp" = 32 : i32, "ttg.total-num-warps" = 4 : i32} {
  tt.func public @matrix_multiplication_kernel(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg3: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg4: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg5: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg6: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg7: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg8: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0)) attributes {noinline = false, ttg.global_scratch_memory_alignment = 1 : i32, ttg.global_scratch_memory_size = 0 : i32} {
    %false = arith.constant false loc(#loc1)
    %true = arith.constant true loc(#loc1)
    %cst = arith.constant dense<0.000000e+00> : tensor<64x64xf32, #blocked> loc(#loc1)
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<128x64xf32, #blocked> loc(#loc1)
    %c128_i32 = arith.constant 128 : i32 loc(#loc1)
    %c64_i32 = arith.constant 64 : i32 loc(#loc1)
    %c63_i32 = arith.constant 63 : i32 loc(#loc1)
    %c1_i32 = arith.constant 1 : i32 loc(#loc1)
    %c0_i32 = arith.constant 0 : i32 loc(#loc1)
    %cst_1 = arith.constant dense<0.000000e+00> : tensor<128x64xf32, #blocked1> loc(#loc1)
    %c3_i32 = arith.constant 3 : i32 loc(#loc1)
    %c2_i32 = arith.constant 2 : i32 loc(#loc1)
    %cst_2 = arith.constant dense<64> : tensor<128x64xi32, #blocked> loc(#loc1)
    %cst_3 = arith.constant dense<128> : tensor<128x64xi32, #blocked> loc(#loc1)
    %0 = tt.get_program_id x : i32 loc(#loc2)
    %1 = tt.get_program_id y : i32 loc(#loc3)
    %2 = arith.muli %1, %c128_i32 : i32 loc(#loc4)
    %3 = tt.make_range {end = 128 : i32, start = 0 : i32} : tensor<128xi32, #ttg.slice<{dim = 1, parent = #blocked}>> loc(#loc5)
    %4 = tt.splat %2 : i32 -> tensor<128xi32, #ttg.slice<{dim = 1, parent = #blocked}>> loc(#loc6)
    %5 = arith.addi %4, %3 : tensor<128xi32, #ttg.slice<{dim = 1, parent = #blocked}>> loc(#loc6)
    %6 = arith.muli %0, %c64_i32 : i32 loc(#loc7)
    %7 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32, #ttg.slice<{dim = 0, parent = #blocked}>> loc(#loc8)
    %8 = tt.splat %6 : i32 -> tensor<64xi32, #ttg.slice<{dim = 0, parent = #blocked}>> loc(#loc9)
    %9 = arith.addi %8, %7 : tensor<64xi32, #ttg.slice<{dim = 0, parent = #blocked}>> loc(#loc9)
    %10 = tt.expand_dims %5 {axis = 1 : i32} : tensor<128xi32, #ttg.slice<{dim = 1, parent = #blocked}>> -> tensor<128x1xi32, #blocked> loc(#loc10)
    %11 = tt.splat %arg6 : i32 -> tensor<128x1xi32, #blocked> loc(#loc11)
    %12 = arith.muli %10, %11 : tensor<128x1xi32, #blocked> loc(#loc11)
    %13 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>, #blocked> loc(#loc12)
    %14 = tt.addptr %13, %12 : tensor<128x1x!tt.ptr<f32>, #blocked>, tensor<128x1xi32, #blocked> loc(#loc12)
    %15 = tt.expand_dims %7 {axis = 0 : i32} : tensor<64xi32, #ttg.slice<{dim = 0, parent = #blocked}>> -> tensor<1x64xi32, #blocked> loc(#loc13)
    %16 = tt.broadcast %14 : tensor<128x1x!tt.ptr<f32>, #blocked> -> tensor<128x64x!tt.ptr<f32>, #blocked> loc(#loc14)
    %17 = tt.broadcast %15 : tensor<1x64xi32, #blocked> -> tensor<128x64xi32, #blocked> loc(#loc14)
    %18 = tt.addptr %16, %17 : tensor<128x64x!tt.ptr<f32>, #blocked>, tensor<128x64xi32, #blocked> loc(#loc14)
    %19 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32, #ttg.slice<{dim = 1, parent = #blocked}>> loc(#loc15)
    %20 = tt.expand_dims %19 {axis = 1 : i32} : tensor<64xi32, #ttg.slice<{dim = 1, parent = #blocked}>> -> tensor<64x1xi32, #blocked> loc(#loc15)
    %21 = tt.splat %arg7 : i32 -> tensor<64x1xi32, #blocked> loc(#loc16)
    %22 = arith.muli %20, %21 : tensor<64x1xi32, #blocked> loc(#loc16)
    %23 = tt.splat %arg1 : !tt.ptr<f32> -> tensor<64x1x!tt.ptr<f32>, #blocked> loc(#loc17)
    %24 = tt.addptr %23, %22 : tensor<64x1x!tt.ptr<f32>, #blocked>, tensor<64x1xi32, #blocked> loc(#loc17)
    %25 = tt.expand_dims %9 {axis = 0 : i32} : tensor<64xi32, #ttg.slice<{dim = 0, parent = #blocked}>> -> tensor<1x64xi32, #blocked> loc(#loc18)
    %26 = tt.broadcast %24 : tensor<64x1x!tt.ptr<f32>, #blocked> -> tensor<64x64x!tt.ptr<f32>, #blocked> loc(#loc19)
    %27 = tt.broadcast %25 : tensor<1x64xi32, #blocked> -> tensor<64x64xi32, #blocked> loc(#loc19)
    %28 = tt.addptr %26, %27 : tensor<64x64x!tt.ptr<f32>, #blocked>, tensor<64x64xi32, #blocked> loc(#loc19)
    %29 = arith.addi %arg4, %c63_i32 : i32 loc(#loc42)
    %30 = arith.divsi %29, %c64_i32 : i32 loc(#loc43)
    %result = ttng.tmem_alloc {tensor_memory_col_offset = 0 : i32, tensor_memory_row_offset = 0 : i32} : () -> !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> loc(#loc23)
    ttng.tmem_store %cst_1, %result, %true : tensor<128x64xf32, #blocked1> -> !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> loc(#loc23)
    %31 = ttg.local_alloc {allocation.offset = 147456 : i32} : () -> !ttg.memdesc<2xi64, #shared, #smem, mutable> loc(#loc24)
    %32 = ttg.memdesc_subview %31[%c0_i32] : !ttg.memdesc<2xi64, #shared, #smem, mutable> -> !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    ttng.init_barrier %32, 1 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    %33 = ttg.memdesc_subview %31[%c1_i32] : !ttg.memdesc<2xi64, #shared, #smem, mutable> -> !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    ttng.init_barrier %33, 1 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    %34 = ttg.local_alloc {allocation.offset = 0 : i32} : () -> !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> loc(#loc25)
    %35 = ttg.local_alloc {allocation.offset = 98304 : i32} : () -> !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> loc(#loc26)
    %36 = arith.cmpi sgt, %30, %c0_i32 : i32 loc(#loc24)
    %37 = tt.splat %arg4 : i32 -> tensor<1x64xi32, #blocked> loc(#loc27)
    %38 = arith.cmpi slt, %15, %37 : tensor<1x64xi32, #blocked> loc(#loc27)
    %39 = tt.broadcast %38 : tensor<1x64xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc25)
    %40 = ttg.memdesc_subview %34[%c0_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> -> !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %41 = tt.splat %36 : i1 -> tensor<128x64xi1, #blocked> loc(#loc24)
    %42 = arith.andi %41, %39 : tensor<128x64xi1, #blocked> loc(#loc24)
    %43 = ttg.async_copy_global_to_local %18, %40 mask %42 other %cst_0 : tensor<128x64x!tt.ptr<f32>, #blocked> -> <128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %44 = ttg.async_commit_group %43 loc(#loc25)
    %45 = tt.splat %arg4 : i32 -> tensor<64x1xi32, #blocked> loc(#loc28)
    %46 = arith.cmpi slt, %20, %45 : tensor<64x1xi32, #blocked> loc(#loc28)
    %47 = tt.broadcast %46 : tensor<64x1xi1, #blocked> -> tensor<64x64xi1, #blocked> loc(#loc26)
    %48 = ttg.memdesc_subview %35[%c0_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> -> !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %49 = tt.splat %36 : i1 -> tensor<64x64xi1, #blocked> loc(#loc24)
    %50 = arith.andi %49, %47 : tensor<64x64xi1, #blocked> loc(#loc24)
    %51 = ttg.async_copy_global_to_local %28, %48 mask %50 other %cst : tensor<64x64x!tt.ptr<f32>, #blocked> -> <64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %52 = ttg.async_commit_group %51 loc(#loc26)
    %53 = arith.cmpi sgt, %30, %c1_i32 : i32 loc(#loc24)
    %54 = arith.subi %arg4, %c64_i32 : i32 loc(#loc29)
    %55 = tt.splat %54 : i32 -> tensor<1x64xi32, #blocked> loc(#loc27)
    %56 = arith.cmpi slt, %15, %55 : tensor<1x64xi32, #blocked> loc(#loc27)
    %57 = tt.addptr %18, %cst_2 : tensor<128x64x!tt.ptr<f32>, #blocked>, tensor<128x64xi32, #blocked> loc(#loc30)
    %58 = tt.broadcast %56 : tensor<1x64xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc25)
    %59 = ttg.memdesc_subview %34[%c1_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> -> !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %60 = tt.splat %53 : i1 -> tensor<128x64xi1, #blocked> loc(#loc24)
    %61 = arith.andi %60, %58 : tensor<128x64xi1, #blocked> loc(#loc24)
    %62 = ttg.async_copy_global_to_local %57, %59 mask %61 other %cst_0 : tensor<128x64x!tt.ptr<f32>, #blocked> -> <128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %63 = ttg.async_commit_group %62 loc(#loc25)
    %64 = tt.splat %54 : i32 -> tensor<64x1xi32, #blocked> loc(#loc28)
    %65 = arith.cmpi slt, %20, %64 : tensor<64x1xi32, #blocked> loc(#loc28)
    %66 = arith.muli %arg7, %c64_i32 : i32 loc(#loc31)
    %67 = tt.splat %66 : i32 -> tensor<64x64xi32, #blocked> loc(#loc32)
    %68 = tt.addptr %28, %67 : tensor<64x64x!tt.ptr<f32>, #blocked>, tensor<64x64xi32, #blocked> loc(#loc32)
    %69 = tt.broadcast %65 : tensor<64x1xi1, #blocked> -> tensor<64x64xi1, #blocked> loc(#loc26)
    %70 = ttg.memdesc_subview %35[%c1_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> -> !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %71 = tt.splat %53 : i1 -> tensor<64x64xi1, #blocked> loc(#loc24)
    %72 = arith.andi %71, %69 : tensor<64x64xi1, #blocked> loc(#loc24)
    %73 = ttg.async_copy_global_to_local %68, %70 mask %72 other %cst : tensor<64x64x!tt.ptr<f32>, #blocked> -> <64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %74 = ttg.async_commit_group %73 loc(#loc26)
    %75 = arith.cmpi sgt, %30, %c2_i32 : i32 loc(#loc24)
    %76 = ttg.async_wait %44, %52 {num = 2 : i32} loc(#loc25)
    ttng.tc_gen5_mma %40, %48, %result, %false, %36, %32[%true] : !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64>, !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable>, !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc23)
    %77 = arith.subi %arg4, %c128_i32 : i32 loc(#loc29)
    %78 = tt.splat %77 : i32 -> tensor<1x64xi32, #blocked> loc(#loc27)
    %79 = arith.cmpi slt, %15, %78 : tensor<1x64xi32, #blocked> loc(#loc27)
    %80 = tt.addptr %18, %cst_3 : tensor<128x64x!tt.ptr<f32>, #blocked>, tensor<128x64xi32, #blocked> loc(#loc30)
    %81 = tt.broadcast %79 : tensor<1x64xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc25)
    %82 = ttg.memdesc_subview %34[%c2_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> -> !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %83 = tt.splat %75 : i1 -> tensor<128x64xi1, #blocked> loc(#loc24)
    %84 = arith.andi %83, %81 : tensor<128x64xi1, #blocked> loc(#loc24)
    %85 = ttg.async_copy_global_to_local %80, %82 mask %84 other %cst_0 : tensor<128x64x!tt.ptr<f32>, #blocked> -> <128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %86 = ttg.async_commit_group %85 loc(#loc25)
    %87 = tt.splat %77 : i32 -> tensor<64x1xi32, #blocked> loc(#loc28)
    %88 = arith.cmpi slt, %20, %87 : tensor<64x1xi32, #blocked> loc(#loc28)
    %89 = arith.muli %arg7, %c128_i32 : i32 loc(#loc31)
    %90 = tt.splat %89 : i32 -> tensor<64x64xi32, #blocked> loc(#loc32)
    %91 = tt.addptr %28, %90 : tensor<64x64x!tt.ptr<f32>, #blocked>, tensor<64x64xi32, #blocked> loc(#loc32)
    %92 = tt.broadcast %88 : tensor<64x1xi1, #blocked> -> tensor<64x64xi1, #blocked> loc(#loc26)
    %93 = ttg.memdesc_subview %35[%c2_i32, %c0_i32, %c0_i32] : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> -> !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %94 = tt.splat %75 : i1 -> tensor<64x64xi1, #blocked> loc(#loc24)
    %95 = arith.andi %94, %92 : tensor<64x64xi1, #blocked> loc(#loc24)
    %96 = ttg.async_copy_global_to_local %91, %93 mask %95 other %cst : tensor<64x64x!tt.ptr<f32>, #blocked> -> <64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %97 = ttg.async_commit_group %96 loc(#loc26)
    %98 = arith.subi %30, %c1_i32 : i32 loc(#loc24)
    cf.br ^bb1(%c0_i32, %c0_i32, %c1_i32, %c2_i32, %c0_i32, %63, %86, %74, %97, %32, %c0_i32, %40, %48 : i32, i32, i32, i32, i32, !ttg.async.token, !ttg.async.token, !ttg.async.token, !ttg.async.token, !ttg.memdesc<1xi64, #shared, #smem, mutable, 2>, i32, !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64>) loc(#loc24)
  ^bb1(%99: i32 loc("/home/ubuntu/triton/matmul.py":32:22), %100: i32 loc(unknown), %101: i32 loc(unknown), %102: i32 loc(unknown), %103: i32 loc(unknown), %104: !ttg.async.token loc("/home/ubuntu/triton/matmul.py":35:20), %105: !ttg.async.token loc("/home/ubuntu/triton/matmul.py":35:20), %106: !ttg.async.token loc("/home/ubuntu/triton/matmul.py":36:20), %107: !ttg.async.token loc("/home/ubuntu/triton/matmul.py":36:20), %108: !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc("/home/ubuntu/triton/matmul.py":32:22), %109: i32 loc(unknown), %110: !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc("/home/ubuntu/triton/matmul.py":35:20), %111: !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc("/home/ubuntu/triton/matmul.py":36:20)):  // 2 preds: ^bb0, ^bb2
    %112 = arith.cmpi slt, %99, %98 : i32 loc(#loc24)
    cf.cond_br %112, ^bb2, ^bb3 loc(#loc24)
  ^bb2:  // pred: ^bb1
    %113 = arith.subi %30, %c3_i32 : i32 loc(#loc24)
    %114 = arith.cmpi slt, %99, %113 : i32 loc(#loc24)
    %115 = arith.addi %103, %c1_i32 : i32 loc(#loc24)
    %116 = arith.cmpi sge, %115, %c3_i32 : i32 loc(#loc24)
    %117 = arith.select %116, %c0_i32, %115 : i32 loc(#loc24)
    %118 = ttg.async_wait %104, %106 {num = 2 : i32} loc(#loc25)
    %119 = ttg.memdesc_subview %34[%117, %c0_i32, %c0_i32] : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> -> !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %120 = ttg.memdesc_subview %35[%117, %c0_i32, %c0_i32] : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> -> !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %121 = ttg.memdesc_subview %31[%101] : !ttg.memdesc<2xi64, #shared, #smem, mutable> -> !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    ttng.tc_gen5_mma %119, %120, %result, %true, %true, %121[%true] : !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64>, !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable>, !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc23)
    ttng.wait_barrier %108, %109 deps %110, %111 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2>, !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc23)
    %122 = arith.xori %100, %c1_i32 : i32 loc(#loc23)
    %123 = arith.addi %101, %c1_i32 : i32 loc(#loc23)
    %124 = arith.cmpi sge, %123, %c2_i32 : i32 loc(#loc23)
    %125 = arith.select %124, %c0_i32, %123 : i32 loc(#loc23)
    %126 = arith.select %124, %122, %100 : i32 loc(#loc23)
    %127 = arith.addi %102, %c1_i32 : i32 loc(#loc24)
    %128 = arith.cmpi sge, %127, %c3_i32 : i32 loc(#loc24)
    %129 = arith.select %128, %c0_i32, %127 : i32 loc(#loc24)
    %130 = arith.addi %99, %c3_i32 : i32 loc(#loc24)
    %131 = arith.muli %130, %c64_i32 : i32 loc(#loc33)
    %132 = arith.subi %arg4, %131 : i32 loc(#loc29)
    %133 = tt.splat %132 : i32 -> tensor<1x64xi32, #blocked> loc(#loc27)
    %134 = arith.cmpi slt, %15, %133 : tensor<1x64xi32, #blocked> loc(#loc27)
    %135 = tt.splat %131 : i32 -> tensor<128x64xi32, #blocked> loc(#loc30)
    %136 = tt.addptr %18, %135 : tensor<128x64x!tt.ptr<f32>, #blocked>, tensor<128x64xi32, #blocked> loc(#loc30)
    %137 = tt.broadcast %134 : tensor<1x64xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc25)
    %138 = ttg.memdesc_subview %34[%129, %c0_i32, %c0_i32] : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> -> !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %139 = tt.splat %114 : i1 -> tensor<128x64xi1, #blocked> loc(#loc24)
    %140 = arith.andi %139, %137 : tensor<128x64xi1, #blocked> loc(#loc24)
    %141 = ttg.async_copy_global_to_local %136, %138 mask %140 other %cst_0 : tensor<128x64x!tt.ptr<f32>, #blocked> -> <128x64xf32, #shared1, #smem, mutable, 3x128x64> loc(#loc25)
    %142 = ttg.async_commit_group %141 loc(#loc25)
    %143 = tt.splat %132 : i32 -> tensor<64x1xi32, #blocked> loc(#loc28)
    %144 = arith.cmpi slt, %20, %143 : tensor<64x1xi32, #blocked> loc(#loc28)
    %145 = arith.muli %131, %arg7 : i32 loc(#loc31)
    %146 = tt.splat %145 : i32 -> tensor<64x64xi32, #blocked> loc(#loc32)
    %147 = tt.addptr %28, %146 : tensor<64x64x!tt.ptr<f32>, #blocked>, tensor<64x64xi32, #blocked> loc(#loc32)
    %148 = tt.broadcast %144 : tensor<64x1xi1, #blocked> -> tensor<64x64xi1, #blocked> loc(#loc26)
    %149 = ttg.memdesc_subview %35[%129, %c0_i32, %c0_i32] : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> -> !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %150 = tt.splat %114 : i1 -> tensor<64x64xi1, #blocked> loc(#loc24)
    %151 = arith.andi %150, %148 : tensor<64x64xi1, #blocked> loc(#loc24)
    %152 = ttg.async_copy_global_to_local %147, %149 mask %151 other %cst : tensor<64x64x!tt.ptr<f32>, #blocked> -> <64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc26)
    %153 = ttg.async_commit_group %152 loc(#loc26)
    %154 = arith.addi %99, %c1_i32 : i32 loc(#loc24)
    cf.br ^bb1(%154, %126, %125, %129, %117, %105, %142, %107, %153, %121, %100, %119, %120 : i32, i32, i32, i32, i32, !ttg.async.token, !ttg.async.token, !ttg.async.token, !ttg.async.token, !ttg.memdesc<1xi64, #shared, #smem, mutable, 2>, i32, !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64>) loc(#loc24)
  ^bb3:  // pred: ^bb1
    cf.cond_br %36, ^bb4, ^bb5 loc(#loc24)
  ^bb4:  // pred: ^bb3
    ttng.wait_barrier %108, %109 deps %110, %111 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2>, !ttg.memdesc<128x64xf32, #shared1, #smem, mutable, 3x128x64>, !ttg.memdesc<64x64xf32, #shared2, #smem, mutable, 3x64x64> loc(#loc23)
    cf.br ^bb5 loc(#loc24)
  ^bb5:  // 2 preds: ^bb3, ^bb4
    %155 = ttg.async_wait  {num = 0 : i32} loc(#loc24)
    ttg.local_dealloc %35 : !ttg.memdesc<3x64x64xf32, #shared2, #smem, mutable> loc(#loc24)
    ttg.local_dealloc %34 : !ttg.memdesc<3x128x64xf32, #shared1, #smem, mutable> loc(#loc24)
    ttng.inval_barrier %32 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    ttng.inval_barrier %33 : !ttg.memdesc<1xi64, #shared, #smem, mutable, 2> loc(#loc24)
    ttg.local_dealloc %31 : !ttg.memdesc<2xi64, #shared, #smem, mutable> loc(#loc24)
    %156 = tt.splat %arg8 : i32 -> tensor<128x1xi32, #blocked> loc(#loc34)
    %157 = arith.muli %10, %156 : tensor<128x1xi32, #blocked> loc(#loc34)
    %158 = tt.splat %arg2 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>, #blocked> loc(#loc35)
    %159 = tt.addptr %158, %157 : tensor<128x1x!tt.ptr<f32>, #blocked>, tensor<128x1xi32, #blocked> loc(#loc35)
    %160 = tt.broadcast %159 : tensor<128x1x!tt.ptr<f32>, #blocked> -> tensor<128x64x!tt.ptr<f32>, #blocked> loc(#loc36)
    %161 = tt.broadcast %25 : tensor<1x64xi32, #blocked> -> tensor<128x64xi32, #blocked> loc(#loc36)
    %162 = tt.addptr %160, %161 : tensor<128x64x!tt.ptr<f32>, #blocked>, tensor<128x64xi32, #blocked> loc(#loc36)
    %163 = tt.splat %arg3 : i32 -> tensor<128x1xi32, #blocked> loc(#loc37)
    %164 = arith.cmpi slt, %10, %163 : tensor<128x1xi32, #blocked> loc(#loc37)
    %165 = tt.splat %arg5 : i32 -> tensor<1x64xi32, #blocked> loc(#loc38)
    %166 = arith.cmpi slt, %25, %165 : tensor<1x64xi32, #blocked> loc(#loc38)
    %167 = tt.broadcast %164 : tensor<128x1xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc39)
    %168 = tt.broadcast %166 : tensor<1x64xi1, #blocked> -> tensor<128x64xi1, #blocked> loc(#loc39)
    %169 = arith.andi %167, %168 : tensor<128x64xi1, #blocked> loc(#loc39)
    %result_4 = ttng.tmem_load %result : !ttg.memdesc<128x64xf32, #tmem, #ttng.tensor_memory, mutable> -> tensor<128x64xf32, #blocked1> loc(#loc23)
    %170 = ttg.convert_layout %result_4 {allocation.offset = 0 : i32} : tensor<128x64xf32, #blocked1> -> tensor<128x64xf32, #blocked> loc(#loc40)
    tt.store %162, %170, %169 : tensor<128x64x!tt.ptr<f32>, #blocked> loc(#loc40)
    tt.return loc(#loc41)
  } loc(#loc)
} loc(#loc)
#loc2 = loc("/home/ubuntu/triton/matmul.py":18:26)
#loc3 = loc("/home/ubuntu/triton/matmul.py":19:26)
#loc4 = loc("/home/ubuntu/triton/matmul.py":21:21)
#loc5 = loc("/home/ubuntu/triton/matmul.py":21:49)
#loc6 = loc("/home/ubuntu/triton/matmul.py":21:36)
#loc7 = loc("/home/ubuntu/triton/matmul.py":22:21)
#loc8 = loc("/home/ubuntu/triton/matmul.py":22:49)
#loc9 = loc("/home/ubuntu/triton/matmul.py":22:36)
#loc10 = loc("/home/ubuntu/triton/matmul.py":26:28)
#loc11 = loc("/home/ubuntu/triton/matmul.py":26:39)
#loc12 = loc("/home/ubuntu/triton/matmul.py":26:21)
#loc13 = loc("/home/ubuntu/triton/matmul.py":26:58)
#loc14 = loc("/home/ubuntu/triton/matmul.py":26:51)
#loc15 = loc("/home/ubuntu/triton/matmul.py":27:28)
#loc16 = loc("/home/ubuntu/triton/matmul.py":27:39)
#loc17 = loc("/home/ubuntu/triton/matmul.py":27:21)
#loc18 = loc("/home/ubuntu/triton/matmul.py":27:58)
#loc19 = loc("/home/ubuntu/triton/matmul.py":27:51)
#loc20 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:22)
#loc21 = loc("/home/ubuntu/triton/matmul.py":32:33)
#loc22 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:28)
#loc23 = loc("/home/ubuntu/triton/matmul.py":38:33)
#loc27 = loc("/home/ubuntu/triton/matmul.py":35:82)
#loc28 = loc("/home/ubuntu/triton/matmul.py":36:82)
#loc29 = loc("/home/ubuntu/triton/matmul.py":33:22)
#loc30 = loc("/home/ubuntu/triton/matmul.py":35:29)
#loc31 = loc("/home/ubuntu/triton/matmul.py":36:48)
#loc32 = loc("/home/ubuntu/triton/matmul.py":36:29)
#loc33 = loc("/home/ubuntu/triton/matmul.py":33:26)
#loc34 = loc("/home/ubuntu/triton/matmul.py":41:39)
#loc35 = loc("/home/ubuntu/triton/matmul.py":41:21)
#loc36 = loc("/home/ubuntu/triton/matmul.py":41:51)
#loc37 = loc("/home/ubuntu/triton/matmul.py":44:33)
#loc38 = loc("/home/ubuntu/triton/matmul.py":44:58)
#loc39 = loc("/home/ubuntu/triton/matmul.py":44:39)
#loc40 = loc("/home/ubuntu/triton/matmul.py":45:21)
#loc41 = loc("/home/ubuntu/triton/matmul.py":45:4)
#loc42 = loc(callsite(#loc20 at #loc21))
#loc43 = loc(callsite(#loc22 at #loc21))
