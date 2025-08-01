// Next run Pass --cse
// IR Dump After TritonReorderBroadcast ('builtin.module' operation)
// Current Run Pass --triton-reorder-broadcast

#loc = loc("/home/ubuntu/triton/matmul.py":6:0)
module {
  tt.func public @matmul_kernel_make_tensor_desciptor(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg3: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg4: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg5: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0)) attributes {noinline = false} {
    %c63_i32 = arith.constant 63 : i32 loc(#loc1)
    %cst = arith.constant dense<0.000000e+00> : tensor<128x64xf32> loc(#loc1)
    %c1_i32 = arith.constant 1 : i32 loc(#loc1)
    %c0_i32 = arith.constant 0 : i32 loc(#loc1)
    %c64_i32 = arith.constant 64 : i32 loc(#loc1)
    %c128_i32 = arith.constant 128 : i32 loc(#loc1)
    %c1_i64 = arith.constant 1 : i64 loc(#loc1)
    %0 = tt.get_program_id x : i32 loc(#loc2)
    %1 = tt.get_program_id y : i32 loc(#loc3)
    %2 = arith.extsi %arg4 : i32 to i64 loc(#loc4)
    %3 = tt.make_tensor_descriptor %arg0, [%arg3, %arg4], [%2, %c1_i64] : <f32>, <tensor<128x64xf32>> loc(#loc4)
    %4 = arith.extsi %arg5 : i32 to i64 loc(#loc5)
    %5 = tt.make_tensor_descriptor %arg1, [%arg4, %arg5], [%4, %c1_i64] : <f32>, <tensor<64x64xf32>> loc(#loc5)
    %6 = arith.extsi %arg5 : i32 to i64 loc(#loc6)
    %7 = tt.make_tensor_descriptor %arg2, [%arg3, %arg5], [%6, %c1_i64] : <f32>, <tensor<128x64xf32>> loc(#loc6)
    %8 = arith.addi %arg4, %c63_i32 : i32 loc(#loc23)
    %9 = arith.divsi %8, %c64_i32 : i32 loc(#loc24)
    %10 = scf.for %arg6 = %c0_i32 to %9 step %c1_i32 iter_args(%arg7 = %cst) -> (tensor<128x64xf32>)  : i32 {
      %13 = arith.muli %0, %c128_i32 : i32 loc(#loc11)
      %14 = arith.muli %arg6, %c64_i32 : i32 loc(#loc12)
      %15 = tt.descriptor_load %3[%13, %14] : !tt.tensordesc<tensor<128x64xf32>> -> tensor<128x64xf32> loc(#loc13)
      %16 = arith.muli %arg6, %c64_i32 : i32 loc(#loc14)
      %17 = arith.muli %1, %c64_i32 : i32 loc(#loc15)
      %18 = tt.descriptor_load %5[%16, %17] : !tt.tensordesc<tensor<64x64xf32>> -> tensor<64x64xf32> loc(#loc16)
      %19 = tt.dot %15, %18, %arg7, inputPrecision = tf32 : tensor<128x64xf32> * tensor<64x64xf32> -> tensor<128x64xf32> loc(#loc17)
      scf.yield %19 : tensor<128x64xf32> loc(#loc18)
    } loc(#loc10)
    %11 = arith.muli %0, %c128_i32 : i32 loc(#loc19)
    %12 = arith.muli %1, %c64_i32 : i32 loc(#loc20)
    tt.descriptor_store %7[%11, %12], %10 : !tt.tensordesc<tensor<128x64xf32>>, tensor<128x64xf32> loc(#loc21)
    tt.return loc(#loc22)
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
#loc10 = loc("/home/ubuntu/triton/matmul.py":37:19)
#loc11 = loc("/home/ubuntu/triton/matmul.py":38:33)
#loc12 = loc("/home/ubuntu/triton/matmul.py":38:51)
#loc13 = loc("/home/ubuntu/triton/matmul.py":38:24)
#loc14 = loc("/home/ubuntu/triton/matmul.py":39:29)
#loc15 = loc("/home/ubuntu/triton/matmul.py":39:51)
#loc16 = loc("/home/ubuntu/triton/matmul.py":39:24)
#loc17 = loc("/home/ubuntu/triton/matmul.py":40:32)
#loc18 = loc("/home/ubuntu/triton/matmul.py":40:8)
#loc19 = loc("/home/ubuntu/triton/matmul.py":43:26)
#loc20 = loc("/home/ubuntu/triton/matmul.py":43:48)
#loc21 = loc("/home/ubuntu/triton/matmul.py":43:63)
#loc22 = loc("/home/ubuntu/triton/matmul.py":43:4)
#loc23 = loc(callsite(#loc7 at #loc8))
#loc24 = loc(callsite(#loc9 at #loc8))
