  The LLVM-IR will have instruction count 116 and binary sise 588 bytes:

<code>; ModuleID = 'math_lerp.c'
source_filename = "math_lerp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [55 x i8] c"Input a number, this is the bigger bound of the lerp:\0A\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.2 = private unnamed_addr constant [72 x i8] c"Input a number, this is in how many steps you want to divide the lerp:\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @lerp(float noundef %0, float noundef %1, float noundef %2) #0 {
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store float %0, float* %4, align 4
  store float %1, float* %5, align 4
  store float %2, float* %6, align 4
  %7 = load float, float* %4, align 4
  %8 = load float, float* %6, align 4
  %9 = load float, float* %5, align 4
  %10 = load float, float* %4, align 4
  %11 = fsub float %9, %10
  %12 = call float @llvm.fmuladd.f32(float %8, float %11, float %7)
  ret float %12
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @lerp_precise(i32 noundef %0, i32 noundef %1, float noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store float %2, float* %6, align 4
  %7 = load float, float* %6, align 4
  %8 = fsub float 1.000000e+00, %7
  %9 = load i32, i32* %4, align 4
  %10 = sitofp i32 %9 to float
  %11 = load float, float* %6, align 4
  %12 = load i32, i32* %5, align 4
  %13 = sitofp i32 %12 to float
  %14 = fmul float %11, %13
  %15 = call float @llvm.fmuladd.f32(float %8, float %10, float %14)
  ret float %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store float 0.000000e+00, float* %2, align 4
  store float 5.000000e+00, float* %3, align 4
  store float 0.000000e+00, float* %4, align 4
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([55 x i8], [55 x i8]* @.str, i64 0, i64 0)) #3
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), float* noundef %3)
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @.str.2, i64 0, i64 0))
  %9 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), float* noundef %4)
  store i32 0, i32* %5, align 4
  br label %10

10:                                               ; preds = %26, %0
  %11 = load i32, i32* %5, align 4
  %12 = sitofp i32 %11 to float
  %13 = load float, float* %4, align 4
  %14 = fadd float %13, 1.000000e+00
  %15 = fcmp olt float %12, %14
  br i1 %15, label %16, label %29

16:                                               ; preds = %10
  %17 = load float, float* %2, align 4
  %18 = load float, float* %3, align 4
  %19 = load i32, i32* %5, align 4
  %20 = sitofp i32 %19 to float
  %21 = load float, float* %4, align 4
  %22 = fdiv float %20, %21
  %23 = call float @lerp(float noundef %17, float noundef %18, float noundef %22)
  %24 = fpext float %23 to double
  %25 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), double noundef %24) #3
  br label %26

26:                                               ; preds = %16
  %27 = load i32, i32* %5, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %5, align 4
  br label %10, !llvm.loop !6

29:                                               ; preds = %10
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #2

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i64 2147501258}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
</code>