  The LLVM-IR will have instruction count 117 and binary sise 568 bytes:

<code>; ModuleID = 'conversions_decimal_to_hexa.c'
source_filename = "conversions_decimal_to_hexa.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Enter decimal number: \00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  %3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0))
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i64* noundef %2)
  %5 = load i64, i64* %2, align 8
  call void @decimal2Hexadecimal(i64 noundef %5)
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #1

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @decimal2Hexadecimal(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [100 x i8], align 16
  store i64 %0, i64* %2, align 8
  %9 = load i64, i64* %2, align 8
  store i64 %9, i64* %3, align 8
  store i32 0, i32* %7, align 4
  %10 = load i64, i64* %3, align 8
  store i64 %10, i64* %4, align 8
  br label %11

11:                                               ; preds = %35, %1
  %12 = load i64, i64* %4, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %38

14:                                               ; preds = %11
  %15 = load i64, i64* %4, align 8
  %16 = srem i64 %15, 16
  store i64 %16, i64* %5, align 8
  %17 = load i64, i64* %5, align 8
  %18 = icmp slt i64 %17, 10
  br i1 %18, label %19, label %27

19:                                               ; preds = %14
  %20 = load i64, i64* %5, align 8
  %21 = add nsw i64 48, %20
  %22 = trunc i64 %21 to i8
  %23 = load i32, i32* %7, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %7, align 4
  %25 = sext i32 %23 to i64
  %26 = getelementptr inbounds [100 x i8], [100 x i8]* %8, i64 0, i64 %25
  store i8 %22, i8* %26, align 1
  br label %35

27:                                               ; preds = %14
  %28 = load i64, i64* %5, align 8
  %29 = add nsw i64 55, %28
  %30 = trunc i64 %29 to i8
  %31 = load i32, i32* %7, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %7, align 4
  %33 = sext i32 %31 to i64
  %34 = getelementptr inbounds [100 x i8], [100 x i8]* %8, i64 0, i64 %33
  store i8 %30, i8* %34, align 1
  br label %35

35:                                               ; preds = %27, %19
  %36 = load i64, i64* %4, align 8
  %37 = sdiv i64 %36, 16
  store i64 %37, i64* %4, align 8
  br label %11, !llvm.loop !6

38:                                               ; preds = %11
  %39 = load i32, i32* %7, align 4
  store i32 %39, i32* %6, align 4
  br label %40

40:                                               ; preds = %50, %38
  %41 = load i32, i32* %6, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %53

43:                                               ; preds = %40
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [100 x i8], [100 x i8]* %8, i64 0, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32 noundef %48)
  br label %50

50:                                               ; preds = %43
  %51 = load i32, i32* %6, align 4
  %52 = add nsw i32 %51, -1
  store i32 %52, i32* %6, align 4
  br label %40, !llvm.loop !8

53:                                               ; preds = %40
  %54 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i64 2147667918}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
</code>