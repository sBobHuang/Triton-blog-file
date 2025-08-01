// Next run Pass --inline
// IR Dump After Python ast_to_ttir

#loc = loc("/home/ubuntu/triton/matmul.py":6:0)
#loc65 = loc("/home/ubuntu/triton/python/triton/language/standard.py":31:0)
module {
  tt.func public @matrix_multiplication_kernel(%arg0: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg1: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg2: !tt.ptr<f32> {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg3: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg4: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg5: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg6: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg7: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0), %arg8: i32 {tt.divisibility = 16 : i32} loc("/home/ubuntu/triton/matmul.py":6:0)) attributes {noinline = false} {
    %0 = tt.get_program_id x : i32 loc(#loc1)
    %1 = tt.get_program_id y : i32 loc(#loc2)
    %c128_i32 = arith.constant 128 : i32 loc(#loc3)
    %c128_i32_0 = arith.constant 128 : i32 loc(#loc3)
    %2 = arith.extsi %1 : i32 to i64 loc(#loc3)
    %3 = arith.extsi %c128_i32_0 : i32 to i64 loc(#loc3)
    %4 = arith.muli %2, %3 : i64 loc(#loc3)
    %c2147483647_i64 = arith.constant 2147483647 : i64 loc(#loc3)
    %c-2147483648_i64 = arith.constant -2147483648 : i64 loc(#loc3)
    %5 = arith.cmpi sle, %4, %c2147483647_i64 : i64 loc(#loc3)
    %6 = arith.cmpi sge, %4, %c-2147483648_i64 : i64 loc(#loc3)
    %7 = arith.andi %5, %6 : i1 loc(#loc3)
    %8 = arith.muli %1, %c128_i32_0 : i32 loc(#loc3)
    %9 = tt.make_range {end = 128 : i32, start = 0 : i32} : tensor<128xi32> loc(#loc4)
    %10 = tt.splat %8 : i32 -> tensor<128xi32> loc(#loc5)
    %11 = arith.extsi %10 : tensor<128xi32> to tensor<128xi64> loc(#loc5)
    %12 = arith.extsi %9 : tensor<128xi32> to tensor<128xi64> loc(#loc5)
    %13 = arith.addi %11, %12 : tensor<128xi64> loc(#loc5)
    %c2147483647_i64_1 = arith.constant 2147483647 : i64 loc(#loc5)
    %c-2147483648_i64_2 = arith.constant -2147483648 : i64 loc(#loc5)
    %cst = arith.constant dense<2147483647> : tensor<128xi64> loc(#loc5)
    %14 = arith.cmpi sle, %13, %cst : tensor<128xi64> loc(#loc5)
    %cst_3 = arith.constant dense<-2147483648> : tensor<128xi64> loc(#loc5)
    %15 = arith.cmpi sge, %13, %cst_3 : tensor<128xi64> loc(#loc5)
    %16 = arith.andi %14, %15 : tensor<128xi1> loc(#loc5)
    %17 = arith.addi %10, %9 : tensor<128xi32> loc(#loc5)
    %c64_i32 = arith.constant 64 : i32 loc(#loc6)
    %c64_i32_4 = arith.constant 64 : i32 loc(#loc6)
    %18 = arith.extsi %0 : i32 to i64 loc(#loc6)
    %19 = arith.extsi %c64_i32_4 : i32 to i64 loc(#loc6)
    %20 = arith.muli %18, %19 : i64 loc(#loc6)
    %c2147483647_i64_5 = arith.constant 2147483647 : i64 loc(#loc6)
    %c-2147483648_i64_6 = arith.constant -2147483648 : i64 loc(#loc6)
    %21 = arith.cmpi sle, %20, %c2147483647_i64_5 : i64 loc(#loc6)
    %22 = arith.cmpi sge, %20, %c-2147483648_i64_6 : i64 loc(#loc6)
    %23 = arith.andi %21, %22 : i1 loc(#loc6)
    %24 = arith.muli %0, %c64_i32_4 : i32 loc(#loc6)
    %25 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32> loc(#loc7)
    %26 = tt.splat %24 : i32 -> tensor<64xi32> loc(#loc8)
    %27 = arith.extsi %26 : tensor<64xi32> to tensor<64xi64> loc(#loc8)
    %28 = arith.extsi %25 : tensor<64xi32> to tensor<64xi64> loc(#loc8)
    %29 = arith.addi %27, %28 : tensor<64xi64> loc(#loc8)
    %c2147483647_i64_7 = arith.constant 2147483647 : i64 loc(#loc8)
    %c-2147483648_i64_8 = arith.constant -2147483648 : i64 loc(#loc8)
    %cst_9 = arith.constant dense<2147483647> : tensor<64xi64> loc(#loc8)
    %30 = arith.cmpi sle, %29, %cst_9 : tensor<64xi64> loc(#loc8)
    %cst_10 = arith.constant dense<-2147483648> : tensor<64xi64> loc(#loc8)
    %31 = arith.cmpi sge, %29, %cst_10 : tensor<64xi64> loc(#loc8)
    %32 = arith.andi %30, %31 : tensor<64xi1> loc(#loc8)
    %33 = arith.addi %26, %25 : tensor<64xi32> loc(#loc8)
    %34 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32> loc(#loc9)
    %35 = tt.expand_dims %17 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc10)
    %36 = tt.splat %arg6 : i32 -> tensor<128x1xi32> loc(#loc11)
    %37 = arith.extsi %35 : tensor<128x1xi32> to tensor<128x1xi64> loc(#loc11)
    %38 = arith.extsi %36 : tensor<128x1xi32> to tensor<128x1xi64> loc(#loc11)
    %39 = arith.muli %37, %38 : tensor<128x1xi64> loc(#loc11)
    %c2147483647_i64_11 = arith.constant 2147483647 : i64 loc(#loc11)
    %c-2147483648_i64_12 = arith.constant -2147483648 : i64 loc(#loc11)
    %cst_13 = arith.constant dense<2147483647> : tensor<128x1xi64> loc(#loc11)
    %40 = arith.cmpi sle, %39, %cst_13 : tensor<128x1xi64> loc(#loc11)
    %cst_14 = arith.constant dense<-2147483648> : tensor<128x1xi64> loc(#loc11)
    %41 = arith.cmpi sge, %39, %cst_14 : tensor<128x1xi64> loc(#loc11)
    %42 = arith.andi %40, %41 : tensor<128x1xi1> loc(#loc11)
    %43 = arith.muli %35, %36 : tensor<128x1xi32> loc(#loc11)
    %44 = tt.splat %arg0 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>> loc(#loc12)
    %45 = tt.addptr %44, %43 : tensor<128x1x!tt.ptr<f32>>, tensor<128x1xi32> loc(#loc12)
    %46 = tt.expand_dims %34 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc13)
    %c1_i32 = arith.constant 1 : i32 loc(#loc14)
    %c1_i32_15 = arith.constant 1 : i32 loc(#loc14)
    %cst_16 = arith.constant dense<1> : tensor<1x64xi32> loc(#loc14)
    %47 = arith.extsi %46 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc14)
    %48 = arith.extsi %cst_16 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc14)
    %49 = arith.muli %47, %48 : tensor<1x64xi64> loc(#loc14)
    %c2147483647_i64_17 = arith.constant 2147483647 : i64 loc(#loc14)
    %c-2147483648_i64_18 = arith.constant -2147483648 : i64 loc(#loc14)
    %cst_19 = arith.constant dense<2147483647> : tensor<1x64xi64> loc(#loc14)
    %50 = arith.cmpi sle, %49, %cst_19 : tensor<1x64xi64> loc(#loc14)
    %cst_20 = arith.constant dense<-2147483648> : tensor<1x64xi64> loc(#loc14)
    %51 = arith.cmpi sge, %49, %cst_20 : tensor<1x64xi64> loc(#loc14)
    %52 = arith.andi %50, %51 : tensor<1x64xi1> loc(#loc14)
    %53 = arith.muli %46, %cst_16 : tensor<1x64xi32> loc(#loc14)
    %54 = tt.broadcast %45 : tensor<128x1x!tt.ptr<f32>> -> tensor<128x64x!tt.ptr<f32>> loc(#loc15)
    %55 = tt.broadcast %53 : tensor<1x64xi32> -> tensor<128x64xi32> loc(#loc15)
    %56 = tt.addptr %54, %55 : tensor<128x64x!tt.ptr<f32>>, tensor<128x64xi32> loc(#loc15)
    %57 = tt.expand_dims %34 {axis = 1 : i32} : tensor<64xi32> -> tensor<64x1xi32> loc(#loc16)
    %58 = tt.splat %arg7 : i32 -> tensor<64x1xi32> loc(#loc17)
    %59 = arith.extsi %57 : tensor<64x1xi32> to tensor<64x1xi64> loc(#loc17)
    %60 = arith.extsi %58 : tensor<64x1xi32> to tensor<64x1xi64> loc(#loc17)
    %61 = arith.muli %59, %60 : tensor<64x1xi64> loc(#loc17)
    %c2147483647_i64_21 = arith.constant 2147483647 : i64 loc(#loc17)
    %c-2147483648_i64_22 = arith.constant -2147483648 : i64 loc(#loc17)
    %cst_23 = arith.constant dense<2147483647> : tensor<64x1xi64> loc(#loc17)
    %62 = arith.cmpi sle, %61, %cst_23 : tensor<64x1xi64> loc(#loc17)
    %cst_24 = arith.constant dense<-2147483648> : tensor<64x1xi64> loc(#loc17)
    %63 = arith.cmpi sge, %61, %cst_24 : tensor<64x1xi64> loc(#loc17)
    %64 = arith.andi %62, %63 : tensor<64x1xi1> loc(#loc17)
    %65 = arith.muli %57, %58 : tensor<64x1xi32> loc(#loc17)
    %66 = tt.splat %arg1 : !tt.ptr<f32> -> tensor<64x1x!tt.ptr<f32>> loc(#loc18)
    %67 = tt.addptr %66, %65 : tensor<64x1x!tt.ptr<f32>>, tensor<64x1xi32> loc(#loc18)
    %68 = tt.expand_dims %33 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc19)
    %c1_i32_25 = arith.constant 1 : i32 loc(#loc20)
    %c1_i32_26 = arith.constant 1 : i32 loc(#loc20)
    %cst_27 = arith.constant dense<1> : tensor<1x64xi32> loc(#loc20)
    %69 = arith.extsi %68 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc20)
    %70 = arith.extsi %cst_27 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc20)
    %71 = arith.muli %69, %70 : tensor<1x64xi64> loc(#loc20)
    %c2147483647_i64_28 = arith.constant 2147483647 : i64 loc(#loc20)
    %c-2147483648_i64_29 = arith.constant -2147483648 : i64 loc(#loc20)
    %cst_30 = arith.constant dense<2147483647> : tensor<1x64xi64> loc(#loc20)
    %72 = arith.cmpi sle, %71, %cst_30 : tensor<1x64xi64> loc(#loc20)
    %cst_31 = arith.constant dense<-2147483648> : tensor<1x64xi64> loc(#loc20)
    %73 = arith.cmpi sge, %71, %cst_31 : tensor<1x64xi64> loc(#loc20)
    %74 = arith.andi %72, %73 : tensor<1x64xi1> loc(#loc20)
    %75 = arith.muli %68, %cst_27 : tensor<1x64xi32> loc(#loc20)
    %76 = tt.broadcast %67 : tensor<64x1x!tt.ptr<f32>> -> tensor<64x64x!tt.ptr<f32>> loc(#loc21)
    %77 = tt.broadcast %75 : tensor<1x64xi32> -> tensor<64x64xi32> loc(#loc21)
    %78 = tt.addptr %76, %77 : tensor<64x64x!tt.ptr<f32>>, tensor<64x64xi32> loc(#loc21)
    %79 = tt.call @"triton.language.standard.zeros____(0, 0)cconstexpr_128__(0, 1)cconstexpr_64__(1,)cconstexpr_fp32_"() : () -> tensor<128x64xf32> loc(#loc22)
    %80 = tt.call @"triton.language.standard.cdiv__i32__(1,)cconstexpr_64_"(%arg4) : (i32) -> i32 loc(#loc23)
    %c0_i32 = arith.constant 0 : i32 loc(#loc24)
    %c1_i32_32 = arith.constant 1 : i32 loc(#loc24)
    %81 = arith.bitcast %c0_i32 : i32 to i32 loc(#loc24)
    %82 = arith.bitcast %80 : i32 to i32 loc(#loc24)
    %83 = arith.bitcast %c1_i32_32 : i32 to i32 loc(#loc24)
    %84 = ub.poison : i32 loc(#loc24)
    %85 = scf.for %arg9 = %81 to %82 step %83 iter_args(%arg10 = %79) -> (tensor<128x64xf32>)  : i32 {
      %c64_i32_60 = arith.constant 64 : i32 loc(#loc25)
      %c64_i32_61 = arith.constant 64 : i32 loc(#loc25)
      %149 = arith.extsi %arg9 : i32 to i64 loc(#loc25)
      %150 = arith.extsi %c64_i32_61 : i32 to i64 loc(#loc25)
      %151 = arith.muli %149, %150 : i64 loc(#loc25)
      %c2147483647_i64_62 = arith.constant 2147483647 : i64 loc(#loc25)
      %c-2147483648_i64_63 = arith.constant -2147483648 : i64 loc(#loc25)
      %152 = arith.cmpi sle, %151, %c2147483647_i64_62 : i64 loc(#loc25)
      %153 = arith.cmpi sge, %151, %c-2147483648_i64_63 : i64 loc(#loc25)
      %154 = arith.andi %152, %153 : i1 loc(#loc25)
      %155 = arith.muli %arg9, %c64_i32_61 : i32 loc(#loc25)
      %156 = arith.extsi %arg4 : i32 to i64 loc(#loc26)
      %157 = arith.extsi %155 : i32 to i64 loc(#loc26)
      %158 = arith.subi %156, %157 : i64 loc(#loc26)
      %c2147483647_i64_64 = arith.constant 2147483647 : i64 loc(#loc26)
      %c-2147483648_i64_65 = arith.constant -2147483648 : i64 loc(#loc26)
      %159 = arith.cmpi sle, %158, %c2147483647_i64_64 : i64 loc(#loc26)
      %160 = arith.cmpi sge, %158, %c-2147483648_i64_65 : i64 loc(#loc26)
      %161 = arith.andi %159, %160 : i1 loc(#loc26)
      %162 = arith.subi %arg4, %155 : i32 loc(#loc26)
      %163 = tt.expand_dims %34 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc27)
      %164 = tt.splat %162 : i32 -> tensor<1x64xi32> loc(#loc28)
      %165 = arith.cmpi slt, %163, %164 : tensor<1x64xi32> loc(#loc28)
      %c64_i32_66 = arith.constant 64 : i32 loc(#loc29)
      %c64_i32_67 = arith.constant 64 : i32 loc(#loc29)
      %166 = arith.extsi %arg9 : i32 to i64 loc(#loc29)
      %167 = arith.extsi %c64_i32_67 : i32 to i64 loc(#loc29)
      %168 = arith.muli %166, %167 : i64 loc(#loc29)
      %c2147483647_i64_68 = arith.constant 2147483647 : i64 loc(#loc29)
      %c-2147483648_i64_69 = arith.constant -2147483648 : i64 loc(#loc29)
      %169 = arith.cmpi sle, %168, %c2147483647_i64_68 : i64 loc(#loc29)
      %170 = arith.cmpi sge, %168, %c-2147483648_i64_69 : i64 loc(#loc29)
      %171 = arith.andi %169, %170 : i1 loc(#loc29)
      %172 = arith.muli %arg9, %c64_i32_67 : i32 loc(#loc29)
      %c1_i32_70 = arith.constant 1 : i32 loc(#loc30)
      %c1_i32_71 = arith.constant 1 : i32 loc(#loc30)
      %173 = arith.extsi %172 : i32 to i64 loc(#loc30)
      %174 = arith.extsi %c1_i32_71 : i32 to i64 loc(#loc30)
      %175 = arith.muli %173, %174 : i64 loc(#loc30)
      %c2147483647_i64_72 = arith.constant 2147483647 : i64 loc(#loc30)
      %c-2147483648_i64_73 = arith.constant -2147483648 : i64 loc(#loc30)
      %176 = arith.cmpi sle, %175, %c2147483647_i64_72 : i64 loc(#loc30)
      %177 = arith.cmpi sge, %175, %c-2147483648_i64_73 : i64 loc(#loc30)
      %178 = arith.andi %176, %177 : i1 loc(#loc30)
      %179 = arith.muli %172, %c1_i32_71 : i32 loc(#loc30)
      %180 = tt.splat %179 : i32 -> tensor<128x64xi32> loc(#loc31)
      %181 = tt.addptr %56, %180 : tensor<128x64x!tt.ptr<f32>>, tensor<128x64xi32> loc(#loc31)
      %cst_74 = arith.constant 0.000000e+00 : f32 loc(#loc32)
      %182 = tt.broadcast %165 : tensor<1x64xi1> -> tensor<128x64xi1> loc(#loc32)
      %cst_75 = arith.constant dense<0.000000e+00> : tensor<128x64xf32> loc(#loc32)
      %183 = tt.load %181, %182, %cst_75 : tensor<128x64x!tt.ptr<f32>> loc(#loc32)
      %184 = tt.expand_dims %34 {axis = 1 : i32} : tensor<64xi32> -> tensor<64x1xi32> loc(#loc33)
      %185 = tt.splat %162 : i32 -> tensor<64x1xi32> loc(#loc34)
      %186 = arith.cmpi slt, %184, %185 : tensor<64x1xi32> loc(#loc34)
      %c64_i32_76 = arith.constant 64 : i32 loc(#loc35)
      %c64_i32_77 = arith.constant 64 : i32 loc(#loc35)
      %187 = arith.extsi %arg9 : i32 to i64 loc(#loc35)
      %188 = arith.extsi %c64_i32_77 : i32 to i64 loc(#loc35)
      %189 = arith.muli %187, %188 : i64 loc(#loc35)
      %c2147483647_i64_78 = arith.constant 2147483647 : i64 loc(#loc35)
      %c-2147483648_i64_79 = arith.constant -2147483648 : i64 loc(#loc35)
      %190 = arith.cmpi sle, %189, %c2147483647_i64_78 : i64 loc(#loc35)
      %191 = arith.cmpi sge, %189, %c-2147483648_i64_79 : i64 loc(#loc35)
      %192 = arith.andi %190, %191 : i1 loc(#loc35)
      %193 = arith.muli %arg9, %c64_i32_77 : i32 loc(#loc35)
      %194 = arith.extsi %193 : i32 to i64 loc(#loc36)
      %195 = arith.extsi %arg7 : i32 to i64 loc(#loc36)
      %196 = arith.muli %194, %195 : i64 loc(#loc36)
      %c2147483647_i64_80 = arith.constant 2147483647 : i64 loc(#loc36)
      %c-2147483648_i64_81 = arith.constant -2147483648 : i64 loc(#loc36)
      %197 = arith.cmpi sle, %196, %c2147483647_i64_80 : i64 loc(#loc36)
      %198 = arith.cmpi sge, %196, %c-2147483648_i64_81 : i64 loc(#loc36)
      %199 = arith.andi %197, %198 : i1 loc(#loc36)
      %200 = arith.muli %193, %arg7 : i32 loc(#loc36)
      %201 = tt.splat %200 : i32 -> tensor<64x64xi32> loc(#loc37)
      %202 = tt.addptr %78, %201 : tensor<64x64x!tt.ptr<f32>>, tensor<64x64xi32> loc(#loc37)
      %cst_82 = arith.constant 0.000000e+00 : f32 loc(#loc38)
      %203 = tt.broadcast %186 : tensor<64x1xi1> -> tensor<64x64xi1> loc(#loc38)
      %cst_83 = arith.constant dense<0.000000e+00> : tensor<64x64xf32> loc(#loc38)
      %204 = tt.load %202, %203, %cst_83 : tensor<64x64x!tt.ptr<f32>> loc(#loc38)
      %cst_84 = arith.constant 0.000000e+00 : f32 loc(#loc39)
      %cst_85 = arith.constant dense<0.000000e+00> : tensor<128x64xf32> loc(#loc39)
      %205 = tt.dot %183, %204, %cst_85, inputPrecision = tf32 : tensor<128x64xf32> * tensor<64x64xf32> -> tensor<128x64xf32> loc(#loc39)
      %206 = arith.addf %arg10, %205 : tensor<128x64xf32> loc(#loc40)
      scf.yield %206 : tensor<128x64xf32> loc(#loc41)
    } loc(#loc24)
    %86 = tt.expand_dims %17 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc42)
    %87 = tt.splat %arg8 : i32 -> tensor<128x1xi32> loc(#loc43)
    %88 = arith.extsi %86 : tensor<128x1xi32> to tensor<128x1xi64> loc(#loc43)
    %89 = arith.extsi %87 : tensor<128x1xi32> to tensor<128x1xi64> loc(#loc43)
    %90 = arith.muli %88, %89 : tensor<128x1xi64> loc(#loc43)
    %c2147483647_i64_33 = arith.constant 2147483647 : i64 loc(#loc43)
    %c-2147483648_i64_34 = arith.constant -2147483648 : i64 loc(#loc43)
    %cst_35 = arith.constant dense<2147483647> : tensor<128x1xi64> loc(#loc43)
    %91 = arith.cmpi sle, %90, %cst_35 : tensor<128x1xi64> loc(#loc43)
    %cst_36 = arith.constant dense<-2147483648> : tensor<128x1xi64> loc(#loc43)
    %92 = arith.cmpi sge, %90, %cst_36 : tensor<128x1xi64> loc(#loc43)
    %93 = arith.andi %91, %92 : tensor<128x1xi1> loc(#loc43)
    %94 = arith.muli %86, %87 : tensor<128x1xi32> loc(#loc43)
    %95 = tt.splat %arg2 : !tt.ptr<f32> -> tensor<128x1x!tt.ptr<f32>> loc(#loc44)
    %96 = tt.addptr %95, %94 : tensor<128x1x!tt.ptr<f32>>, tensor<128x1xi32> loc(#loc44)
    %97 = tt.expand_dims %33 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc45)
    %c1_i32_37 = arith.constant 1 : i32 loc(#loc46)
    %c1_i32_38 = arith.constant 1 : i32 loc(#loc46)
    %cst_39 = arith.constant dense<1> : tensor<1x64xi32> loc(#loc46)
    %98 = arith.extsi %97 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc46)
    %99 = arith.extsi %cst_39 : tensor<1x64xi32> to tensor<1x64xi64> loc(#loc46)
    %100 = arith.muli %98, %99 : tensor<1x64xi64> loc(#loc46)
    %c2147483647_i64_40 = arith.constant 2147483647 : i64 loc(#loc46)
    %c-2147483648_i64_41 = arith.constant -2147483648 : i64 loc(#loc46)
    %cst_42 = arith.constant dense<2147483647> : tensor<1x64xi64> loc(#loc46)
    %101 = arith.cmpi sle, %100, %cst_42 : tensor<1x64xi64> loc(#loc46)
    %cst_43 = arith.constant dense<-2147483648> : tensor<1x64xi64> loc(#loc46)
    %102 = arith.cmpi sge, %100, %cst_43 : tensor<1x64xi64> loc(#loc46)
    %103 = arith.andi %101, %102 : tensor<1x64xi1> loc(#loc46)
    %104 = arith.muli %97, %cst_39 : tensor<1x64xi32> loc(#loc46)
    %105 = tt.broadcast %96 : tensor<128x1x!tt.ptr<f32>> -> tensor<128x64x!tt.ptr<f32>> loc(#loc47)
    %106 = tt.broadcast %104 : tensor<1x64xi32> -> tensor<128x64xi32> loc(#loc47)
    %107 = tt.addptr %105, %106 : tensor<128x64x!tt.ptr<f32>>, tensor<128x64xi32> loc(#loc47)
    %c128_i32_44 = arith.constant 128 : i32 loc(#loc48)
    %c128_i32_45 = arith.constant 128 : i32 loc(#loc48)
    %108 = arith.extsi %1 : i32 to i64 loc(#loc48)
    %109 = arith.extsi %c128_i32_45 : i32 to i64 loc(#loc48)
    %110 = arith.muli %108, %109 : i64 loc(#loc48)
    %c2147483647_i64_46 = arith.constant 2147483647 : i64 loc(#loc48)
    %c-2147483648_i64_47 = arith.constant -2147483648 : i64 loc(#loc48)
    %111 = arith.cmpi sle, %110, %c2147483647_i64_46 : i64 loc(#loc48)
    %112 = arith.cmpi sge, %110, %c-2147483648_i64_47 : i64 loc(#loc48)
    %113 = arith.andi %111, %112 : i1 loc(#loc48)
    %114 = arith.muli %1, %c128_i32_45 : i32 loc(#loc48)
    %115 = tt.make_range {end = 128 : i32, start = 0 : i32} : tensor<128xi32> loc(#loc49)
    %116 = tt.splat %114 : i32 -> tensor<128xi32> loc(#loc50)
    %117 = arith.extsi %116 : tensor<128xi32> to tensor<128xi64> loc(#loc50)
    %118 = arith.extsi %115 : tensor<128xi32> to tensor<128xi64> loc(#loc50)
    %119 = arith.addi %117, %118 : tensor<128xi64> loc(#loc50)
    %c2147483647_i64_48 = arith.constant 2147483647 : i64 loc(#loc50)
    %c-2147483648_i64_49 = arith.constant -2147483648 : i64 loc(#loc50)
    %cst_50 = arith.constant dense<2147483647> : tensor<128xi64> loc(#loc50)
    %120 = arith.cmpi sle, %119, %cst_50 : tensor<128xi64> loc(#loc50)
    %cst_51 = arith.constant dense<-2147483648> : tensor<128xi64> loc(#loc50)
    %121 = arith.cmpi sge, %119, %cst_51 : tensor<128xi64> loc(#loc50)
    %122 = arith.andi %120, %121 : tensor<128xi1> loc(#loc50)
    %123 = arith.addi %116, %115 : tensor<128xi32> loc(#loc50)
    %c64_i32_52 = arith.constant 64 : i32 loc(#loc51)
    %c64_i32_53 = arith.constant 64 : i32 loc(#loc51)
    %124 = arith.extsi %0 : i32 to i64 loc(#loc51)
    %125 = arith.extsi %c64_i32_53 : i32 to i64 loc(#loc51)
    %126 = arith.muli %124, %125 : i64 loc(#loc51)
    %c2147483647_i64_54 = arith.constant 2147483647 : i64 loc(#loc51)
    %c-2147483648_i64_55 = arith.constant -2147483648 : i64 loc(#loc51)
    %127 = arith.cmpi sle, %126, %c2147483647_i64_54 : i64 loc(#loc51)
    %128 = arith.cmpi sge, %126, %c-2147483648_i64_55 : i64 loc(#loc51)
    %129 = arith.andi %127, %128 : i1 loc(#loc51)
    %130 = arith.muli %0, %c64_i32_53 : i32 loc(#loc51)
    %131 = tt.make_range {end = 64 : i32, start = 0 : i32} : tensor<64xi32> loc(#loc52)
    %132 = tt.splat %130 : i32 -> tensor<64xi32> loc(#loc53)
    %133 = arith.extsi %132 : tensor<64xi32> to tensor<64xi64> loc(#loc53)
    %134 = arith.extsi %131 : tensor<64xi32> to tensor<64xi64> loc(#loc53)
    %135 = arith.addi %133, %134 : tensor<64xi64> loc(#loc53)
    %c2147483647_i64_56 = arith.constant 2147483647 : i64 loc(#loc53)
    %c-2147483648_i64_57 = arith.constant -2147483648 : i64 loc(#loc53)
    %cst_58 = arith.constant dense<2147483647> : tensor<64xi64> loc(#loc53)
    %136 = arith.cmpi sle, %135, %cst_58 : tensor<64xi64> loc(#loc53)
    %cst_59 = arith.constant dense<-2147483648> : tensor<64xi64> loc(#loc53)
    %137 = arith.cmpi sge, %135, %cst_59 : tensor<64xi64> loc(#loc53)
    %138 = arith.andi %136, %137 : tensor<64xi1> loc(#loc53)
    %139 = arith.addi %132, %131 : tensor<64xi32> loc(#loc53)
    %140 = tt.expand_dims %123 {axis = 1 : i32} : tensor<128xi32> -> tensor<128x1xi32> loc(#loc54)
    %141 = tt.splat %arg3 : i32 -> tensor<128x1xi32> loc(#loc55)
    %142 = arith.cmpi slt, %140, %141 : tensor<128x1xi32> loc(#loc55)
    %143 = tt.expand_dims %139 {axis = 0 : i32} : tensor<64xi32> -> tensor<1x64xi32> loc(#loc56)
    %144 = tt.splat %arg5 : i32 -> tensor<1x64xi32> loc(#loc57)
    %145 = arith.cmpi slt, %143, %144 : tensor<1x64xi32> loc(#loc57)
    %146 = tt.broadcast %142 : tensor<128x1xi1> -> tensor<128x64xi1> loc(#loc58)
    %147 = tt.broadcast %145 : tensor<1x64xi1> -> tensor<128x64xi1> loc(#loc58)
    %148 = arith.andi %146, %147 : tensor<128x64xi1> loc(#loc58)
    tt.store %107, %85, %148 : tensor<128x64x!tt.ptr<f32>> loc(#loc59)
    tt.return loc(#loc60)
  } loc(#loc)
  tt.func private @"triton.language.standard.zeros____(0, 0)cconstexpr_128__(0, 1)cconstexpr_64__(1,)cconstexpr_fp32_"() -> tensor<128x64xf32> attributes {noinline = false} {
    %cst = arith.constant 0.000000e+00 : f32 loc(#loc62)
    %cst_0 = arith.constant dense<0.000000e+00> : tensor<128x64xf32> loc(#loc62)
    tt.return %cst_0 : tensor<128x64xf32> loc(#loc63)
  ^bb1:  // no predecessors
    %0 = ub.poison : tensor<128x64xf32> loc(#loc64)
    tt.return %0 : tensor<128x64xf32> loc(#loc64)
  } loc(#loc61)
  tt.func private @"triton.language.standard.cdiv__i32__(1,)cconstexpr_64_"(%arg0: i32 loc("/home/ubuntu/triton/python/triton/language/standard.py":31:0)) -> i32 attributes {noinline = false} {
    %c64_i32 = arith.constant 64 : i32 loc(#loc66)
    %c64_i32_0 = arith.constant 64 : i32 loc(#loc66)
    %0 = arith.extsi %arg0 : i32 to i64 loc(#loc66)
    %1 = arith.extsi %c64_i32_0 : i32 to i64 loc(#loc66)
    %2 = arith.addi %0, %1 : i64 loc(#loc66)
    %c2147483647_i64 = arith.constant 2147483647 : i64 loc(#loc66)
    %c-2147483648_i64 = arith.constant -2147483648 : i64 loc(#loc66)
    %3 = arith.cmpi sle, %2, %c2147483647_i64 : i64 loc(#loc66)
    %4 = arith.cmpi sge, %2, %c-2147483648_i64 : i64 loc(#loc66)
    %5 = arith.andi %3, %4 : i1 loc(#loc66)
    %6 = arith.addi %arg0, %c64_i32_0 : i32 loc(#loc66)
    %c1_i32 = arith.constant 1 : i32 loc(#loc67)
    %c1_i32_1 = arith.constant 1 : i32 loc(#loc67)
    %7 = arith.extsi %6 : i32 to i64 loc(#loc67)
    %8 = arith.extsi %c1_i32_1 : i32 to i64 loc(#loc67)
    %9 = arith.subi %7, %8 : i64 loc(#loc67)
    %c2147483647_i64_2 = arith.constant 2147483647 : i64 loc(#loc67)
    %c-2147483648_i64_3 = arith.constant -2147483648 : i64 loc(#loc67)
    %10 = arith.cmpi sle, %9, %c2147483647_i64_2 : i64 loc(#loc67)
    %11 = arith.cmpi sge, %9, %c-2147483648_i64_3 : i64 loc(#loc67)
    %12 = arith.andi %10, %11 : i1 loc(#loc67)
    %13 = arith.subi %6, %c1_i32_1 : i32 loc(#loc67)
    %c64_i32_4 = arith.constant 64 : i32 loc(#loc68)
    %c64_i32_5 = arith.constant 64 : i32 loc(#loc68)
    %14 = arith.divsi %13, %c64_i32_5 : i32 loc(#loc68)
    tt.return %14 : i32 loc(#loc69)
  ^bb1:  // no predecessors
    %15 = ub.poison : i32 loc(#loc70)
    tt.return %15 : i32 loc(#loc70)
  } loc(#loc65)
} loc(#loc)
#loc1 = loc("/home/ubuntu/triton/matmul.py":18:26)
#loc2 = loc("/home/ubuntu/triton/matmul.py":19:26)
#loc3 = loc("/home/ubuntu/triton/matmul.py":21:21)
#loc4 = loc("/home/ubuntu/triton/matmul.py":21:49)
#loc5 = loc("/home/ubuntu/triton/matmul.py":21:36)
#loc6 = loc("/home/ubuntu/triton/matmul.py":22:21)
#loc7 = loc("/home/ubuntu/triton/matmul.py":22:49)
#loc8 = loc("/home/ubuntu/triton/matmul.py":22:36)
#loc9 = loc("/home/ubuntu/triton/matmul.py":23:26)
#loc10 = loc("/home/ubuntu/triton/matmul.py":26:28)
#loc11 = loc("/home/ubuntu/triton/matmul.py":26:39)
#loc12 = loc("/home/ubuntu/triton/matmul.py":26:21)
#loc13 = loc("/home/ubuntu/triton/matmul.py":26:58)
#loc14 = loc("/home/ubuntu/triton/matmul.py":26:69)
#loc15 = loc("/home/ubuntu/triton/matmul.py":26:51)
#loc16 = loc("/home/ubuntu/triton/matmul.py":27:28)
#loc17 = loc("/home/ubuntu/triton/matmul.py":27:39)
#loc18 = loc("/home/ubuntu/triton/matmul.py":27:21)
#loc19 = loc("/home/ubuntu/triton/matmul.py":27:58)
#loc20 = loc("/home/ubuntu/triton/matmul.py":27:69)
#loc21 = loc("/home/ubuntu/triton/matmul.py":27:51)
#loc22 = loc("/home/ubuntu/triton/matmul.py":29:27)
#loc23 = loc("/home/ubuntu/triton/matmul.py":32:33)
#loc24 = loc("/home/ubuntu/triton/matmul.py":32:22)
#loc25 = loc("/home/ubuntu/triton/matmul.py":33:26)
#loc26 = loc("/home/ubuntu/triton/matmul.py":33:22)
#loc27 = loc("/home/ubuntu/triton/matmul.py":35:71)
#loc28 = loc("/home/ubuntu/triton/matmul.py":35:82)
#loc29 = loc("/home/ubuntu/triton/matmul.py":35:33)
#loc30 = loc("/home/ubuntu/triton/matmul.py":35:48)
#loc31 = loc("/home/ubuntu/triton/matmul.py":35:29)
#loc32 = loc("/home/ubuntu/triton/matmul.py":35:20)
#loc33 = loc("/home/ubuntu/triton/matmul.py":36:71)
#loc34 = loc("/home/ubuntu/triton/matmul.py":36:82)
#loc35 = loc("/home/ubuntu/triton/matmul.py":36:33)
#loc36 = loc("/home/ubuntu/triton/matmul.py":36:48)
#loc37 = loc("/home/ubuntu/triton/matmul.py":36:29)
#loc38 = loc("/home/ubuntu/triton/matmul.py":36:20)
#loc39 = loc("/home/ubuntu/triton/matmul.py":38:33)
#loc40 = loc("/home/ubuntu/triton/matmul.py":38:23)
#loc41 = loc("/home/ubuntu/triton/matmul.py":38:8)
#loc42 = loc("/home/ubuntu/triton/matmul.py":41:28)
#loc43 = loc("/home/ubuntu/triton/matmul.py":41:39)
#loc44 = loc("/home/ubuntu/triton/matmul.py":41:21)
#loc45 = loc("/home/ubuntu/triton/matmul.py":41:58)
#loc46 = loc("/home/ubuntu/triton/matmul.py":41:69)
#loc47 = loc("/home/ubuntu/triton/matmul.py":41:51)
#loc48 = loc("/home/ubuntu/triton/matmul.py":42:22)
#loc49 = loc("/home/ubuntu/triton/matmul.py":42:50)
#loc50 = loc("/home/ubuntu/triton/matmul.py":42:37)
#loc51 = loc("/home/ubuntu/triton/matmul.py":43:22)
#loc52 = loc("/home/ubuntu/triton/matmul.py":43:50)
#loc53 = loc("/home/ubuntu/triton/matmul.py":43:37)
#loc54 = loc("/home/ubuntu/triton/matmul.py":44:22)
#loc55 = loc("/home/ubuntu/triton/matmul.py":44:33)
#loc56 = loc("/home/ubuntu/triton/matmul.py":44:47)
#loc57 = loc("/home/ubuntu/triton/matmul.py":44:58)
#loc58 = loc("/home/ubuntu/triton/matmul.py":44:39)
#loc59 = loc("/home/ubuntu/triton/matmul.py":45:21)
#loc60 = loc("/home/ubuntu/triton/matmul.py":45:4)
#loc61 = loc("/home/ubuntu/triton/python/triton/language/standard.py":117:0)
#loc62 = loc("/home/ubuntu/triton/python/triton/language/standard.py":126:31)
#loc63 = loc("/home/ubuntu/triton/python/triton/language/standard.py":126:11)
#loc64 = loc("/home/ubuntu/triton/python/triton/language/standard.py":126:4)
#loc66 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:16)
#loc67 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:22)
#loc68 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:28)
#loc69 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:11)
#loc70 = loc("/home/ubuntu/triton/python/triton/language/standard.py":40:4)
