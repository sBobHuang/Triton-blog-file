// Next run Pass --canonicalize
// IR Dump After TritonRewriteTensorPointer ('builtin.module' operation)
// Current Run Pass --triton-rewrite-tensor-pointer

#loc = loc("/home/ubuntu/triton/matmul.py":6:0)
module {
  tt.func public @matrix_multiplication_kernel(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg3: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg4: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg5: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg6: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg7: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg8: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0)) attributes {noinline = false} {
    %cst = arith.constant dense<0.000000e+00> : tensor<128x64xf32> loc(#loc1)
    %c1_i32 = arith.constant 1 : i32 loc(#loc1)
    %c0_i32 = arith.constant 0 : i32 loc(#loc1)
    %c64_i32 = arith.constant 64 : i32 loc(#loc1)
    %c128_i32 = arith.constant 128 : i32 loc(#loc1)
    %0 = tt.get_program_id x : i32 loc(#loc2)
    %1 = tt.get_program_id y : i32 loc(#loc3)
    %2 = arith.muli %1, %c128_i32 : i32 loc(#loc4)
    %3 = tt.make_range {end = 128 : i32, start = 0 : i32} : tensor<128xi32> loc(#loc5)
    %4 = tt.splat %2 : i32 -> tensor<128xi32> loc(#loc6)
    %5 = arith.addi %4, %3 : tensor<128xi32> loc(#loc6)
    %6 = arith.muli %0, %c64_i32 : i32 loc(#loc7)
    %7 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32> loc(#loc8)
    %8 = tt.splat %6 : i32 -> tensor<64xi32> loc(#loc9)
    %9 = arith.addi %8, %7 : tensor<64xi32> loc(#loc9)
    %10 = tt.expand_dims %5 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc10)
    %11 = tt.splat %arg6 : i32 -> tensor<128x1xi32> loc(#loc11)
    %12 = arith.muli %10, %11 : tensor<128x1xi32> loc(#loc11)
    %13 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>> loc(#loc12)
    %14 = tt.addptr %13, %12 : tensor<128x1x!tt.ptr<f32>>, tensor<128x1xi32> loc(#loc12)
    %15 = tt.expand_dims %9 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc13)
    %16 = tt.splat %arg1 : !tt.ptr<f32> -> tensor<1x64x!tt.ptr<f32>> loc(#loc14)
    %17 = tt.addptr %16, %15 : tensor<1x64x!tt.ptr<f32>>, tensor<1x64xi32> loc(#loc14)
    %18 = scf.for %arg9 = %c0_i32 to %arg4 step %c1_i32 iter_args(%arg10 = %cst) -> (tensor<128x64xf32>)  : i32 {
      %45 = tt.splat %arg9 : i32 -> tensor<128x1xi32> loc(#loc16)
      %46 = tt.addptr %14, %45 : tensor<128x1x!tt.ptr<f32>>, tensor<128x1xi32> loc(#loc16)
      %47 = tt.load %46 : tensor<128x1x!tt.ptr<f32>> loc(#loc17)
      %48 = arith.muli %arg9, %arg7 : i32 loc(#loc18)
      %49 = tt.splat %48 : i32 -> tensor<1x64xi32> loc(#loc19)
      %50 = tt.addptr %17, %49 : tensor<1x64x!tt.ptr<f32>>, tensor<1x64xi32> loc(#loc19)
      %51 = tt.load %50 : tensor<1x64x!tt.ptr<f32>> loc(#loc20)
      %52 = tt.broadcast %47 : tensor<128x1xf32> -> tensor<128x64xf32> loc(#loc21)
      %53 = tt.broadcast %51 : tensor<1x64xf32> -> tensor<128x64xf32> loc(#loc21)
      %54 = arith.mulf %52, %53 : tensor<128x64xf32> loc(#loc21)
      %55 = arith.addf %arg10, %54 : tensor<128x64xf32> loc(#loc22)
      scf.yield %55 : tensor<128x64xf32> loc(#loc23)
    } loc(#loc15)
    %19 = tt.expand_dims %5 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc24)
    %20 = tt.splat %arg8 : i32 -> tensor<128x1xi32> loc(#loc25)
    %21 = arith.muli %19, %20 : tensor<128x1xi32> loc(#loc25)
    %22 = tt.splat %arg2 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>> loc(#loc26)
    %23 = tt.addptr %22, %21 : tensor<128x1x!tt.ptr<f32>>, tensor<128x1xi32> loc(#loc26)
    %24 = tt.expand_dims %9 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc27)
    %25 = tt.broadcast %23 : tensor<128x1x!tt.ptr<f32>> -> tensor<128x64x!tt.ptr<f32>> loc(#loc28)
    %26 = tt.broadcast %24 : tensor<1x64xi32> -> tensor<128x64xi32> loc(#loc28)
    %27 = tt.addptr %25, %26 : tensor<128x64x!tt.ptr<f32>>, tensor<128x64xi32> loc(#loc28)
    %28 = arith.muli %1, %c128_i32 : i32 loc(#loc29)
    %29 = tt.make_range {end = 128 : i32, start = 0 : i32} : tensor<128xi32> loc(#loc30)
    %30 = tt.splat %28 : i32 -> tensor<128xi32> loc(#loc31)
    %31 = arith.addi %30, %29 : tensor<128xi32> loc(#loc31)
    %32 = arith.muli %0, %c64_i32 : i32 loc(#loc32)
    %33 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32> loc(#loc33)
    %34 = tt.splat %32 : i32 -> tensor<64xi32> loc(#loc34)
    %35 = arith.addi %34, %33 : tensor<64xi32> loc(#loc34)
    %36 = tt.expand_dims %31 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc35)
    %37 = tt.splat %arg3 : i32 -> tensor<128x1xi32> loc(#loc36)
    %38 = arith.cmpi slt, %36, %37 : tensor<128x1xi32> loc(#loc36)
    %39 = tt.expand_dims %35 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc37)
    %40 = tt.splat %arg5 : i32 -> tensor<1x64xi32> loc(#loc38)
    %41 = arith.cmpi slt, %39, %40 : tensor<1x64xi32> loc(#loc38)
    %42 = tt.broadcast %38 : tensor<128x1xi1> -> tensor<128x64xi1> loc(#loc39)
    %43 = tt.broadcast %41 : tensor<1x64xi1> -> tensor<128x64xi1> loc(#loc39)
    %44 = arith.andi %42, %43 : tensor<128x64xi1> loc(#loc39)
    tt.store %27, %18, %44 : tensor<128x64x!tt.ptr<f32>> loc(#loc40)
    tt.return loc(#loc41)
  } loc(#loc)
} loc(#loc)
#loc1 = loc(unknown)
#loc2 = loc("/home/ubuntu/triton/matmul.py":17:26)
#loc3 = loc("/home/ubuntu/triton/matmul.py":18:26)
#loc4 = loc("/home/ubuntu/triton/matmul.py":20:21)
#loc5 = loc("/home/ubuntu/triton/matmul.py":20:49)
#loc6 = loc("/home/ubuntu/triton/matmul.py":20:36)
#loc7 = loc("/home/ubuntu/triton/matmul.py":21:21)
#loc8 = loc("/home/ubuntu/triton/matmul.py":21:49)
#loc9 = loc("/home/ubuntu/triton/matmul.py":21:36)
#loc10 = loc("/home/ubuntu/triton/matmul.py":24:28)
#loc11 = loc("/home/ubuntu/triton/matmul.py":24:39)
#loc12 = loc("/home/ubuntu/triton/matmul.py":24:21)
#loc13 = loc("/home/ubuntu/triton/matmul.py":25:28)
#loc14 = loc("/home/ubuntu/triton/matmul.py":25:21)
#loc15 = loc("/home/ubuntu/triton/matmul.py":30:19)
#loc16 = loc("/home/ubuntu/triton/matmul.py":32:29)
#loc17 = loc("/home/ubuntu/triton/matmul.py":32:20)
#loc18 = loc("/home/ubuntu/triton/matmul.py":33:33)
#loc19 = loc("/home/ubuntu/triton/matmul.py":33:29)
#loc20 = loc("/home/ubuntu/triton/matmul.py":33:20)
#loc21 = loc("/home/ubuntu/triton/matmul.py":34:27)
#loc22 = loc("/home/ubuntu/triton/matmul.py":34:23)
#loc23 = loc("/home/ubuntu/triton/matmul.py":34:8)
#loc24 = loc("/home/ubuntu/triton/matmul.py":37:28)
#loc25 = loc("/home/ubuntu/triton/matmul.py":37:39)
#loc26 = loc("/home/ubuntu/triton/matmul.py":37:21)
#loc27 = loc("/home/ubuntu/triton/matmul.py":37:58)
#loc28 = loc("/home/ubuntu/triton/matmul.py":37:51)
#loc29 = loc("/home/ubuntu/triton/matmul.py":38:22)
#loc30 = loc("/home/ubuntu/triton/matmul.py":38:50)
#loc31 = loc("/home/ubuntu/triton/matmul.py":38:37)
#loc32 = loc("/home/ubuntu/triton/matmul.py":39:22)
#loc33 = loc("/home/ubuntu/triton/matmul.py":39:50)
#loc34 = loc("/home/ubuntu/triton/matmul.py":39:37)
#loc35 = loc("/home/ubuntu/triton/matmul.py":40:22)
#loc36 = loc("/home/ubuntu/triton/matmul.py":40:33)
#loc37 = loc("/home/ubuntu/triton/matmul.py":40:47)
#loc38 = loc("/home/ubuntu/triton/matmul.py":40:58)
#loc39 = loc("/home/ubuntu/triton/matmul.py":40:39)
#loc40 = loc("/home/ubuntu/triton/matmul.py":41:21)
#loc41 = loc("/home/ubuntu/triton/matmul.py":41:4)
