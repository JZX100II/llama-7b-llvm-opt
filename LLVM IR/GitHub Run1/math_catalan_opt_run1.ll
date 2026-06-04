  The LLVM-IR will have instruction count 105 and binary sise 368 bytes:

<code>; ModuleID = 'math_catalan.c'
source_filename = "math_catalan.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%0.2f\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @factorial(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  store i32 %0, i32* %2, align 4
  %5 = load i32, i32* %2, align 4
  %6 = sext i32 %5 to i64
  store i64 %6, i64* %4, align 8
  store i32 1, i32* %3, align 4
  br label %7

7:                                                ; preds = %18, %1
  %8 = load i32, i32* %3, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %21

11:                                               ; preds = %7
  %12 = load i64, i64* %4, align 8
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* %3, align 4
  %15 = sub nsw i32 %13, %14
  %16 = sext i32 %15 to i64
  %17 = mul nsw i64 %12, %16
  store i64 %17, i64* %4, align 8
  br label %18

18:                                               ; preds = %11
  %19 = load i32, i32* %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %3, align 4
  br label %7, !llvm.loop !6

21:                                               ; preds = %7
  %22 = load i64, i64* %4, align 8
  ret i64 %22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 0, i32* %1, align 4
  %7 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %5)
  %8 = load i32, i32* %5, align 4
  %9 = mul nsw i32 2, %8
  %10 = call i64 @factorial(i32 noundef %9)
  store i64 %10, i64* %2, align 8
  %11 = load i32, i32* %5, align 4
  %12 = add nsw i32 %11, 1
  %13 = call i64 @factorial(i32 noundef %12)
  store i64 %13, i64* %3, align 8
  %14 = load i32, i32* %5, align 4
  %15 = call i64 @factorial(i32 noundef %14)
  store i64 %15, i64* %4, align 8
  %16 = load i64, i64* %2, align 8
  %17 = load i64, i64* %3, align 8
  %18 = load i64, i64* %4, align 8
  %19 = mul nsw i64 %17, %18
  %20 = sdiv i64 %16, %19
  %21 = sitofp i64 %20 to float
  store float %21, float* %6, align 4
  %22 = load float, float* %6, align 4
  %23 = fpext float %22 to double
  %24 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), double noundef %23)
  ret i32 0
}

declare i32 @__isoc99_scanf(i8* noundef, ...)

declare i32 @printf(i8* noundef, ...)

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
</code>