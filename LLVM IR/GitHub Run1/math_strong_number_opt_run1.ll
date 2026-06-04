  The LLVM-IR will have instruction count 117 and binary sise 617 bytes:

<code>; ModuleID = 'math_strong_number.c'
source_filename = "math_strong_number.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"isStrong(145)\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"math_strong_number.c\00", align 1
@__PRETTY_FUNCTION__.test = private unnamed_addr constant [12 x i8] c"void test()\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"!isStrong(543)\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @isStrong(i32 noundef %0) #0 {
  %2 = alloca i1, align 1
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  store i1 false, i1* %2, align 1
  br label %45

12:                                               ; preds = %1
  store i32 0, i32* %4, align 4
  %13 = load i32, i32* %3, align 4
  store i32 %13, i32* %5, align 4
  br label %14

14:                                               ; preds = %35, %12
  %15 = load i32, i32* %5, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %41

17:                                               ; preds = %14
  %18 = load i32, i32* %5, align 4
  %19 = srem i32 %18, 10
  store i32 %19, i32* %6, align 4
  %20 = load i32, i32* %6, align 4
  %21 = icmp eq i32 %20, 0
  %22 = zext i1 %21 to i64
  %23 = select i1 %21, i32 0, i32 1
  store i32 %23, i32* %7, align 4
  store i32 1, i32* %8, align 4
  br label %24

24:                                               ; preds = %29, %17
  %25 = load i32, i32* %8, align 4
  %26 = load i32, i32* %6, align 4
  %27 = icmp sle i32 %25, %26
  br i1 %27, label %28, label %35

28:                                               ; preds = %24
  br label %29

29:                                               ; preds = %28
  %30 = load i32, i32* %8, align 4
  %31 = load i32, i32* %7, align 4
  %32 = mul nsw i32 %31, %30
  store i32 %32, i32* %7, align 4
  %33 = load i32, i32* %8, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %8, align 4
  br label %24, !llvm.loop !6

35:                                               ; preds = %24
  %36 = load i32, i32* %7, align 4
  %37 = load i32, i32* %4, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, i32* %4, align 4
  %39 = load i32, i32* %5, align 4
  %40 = sdiv i32 %39, 10
  store i32 %40, i32* %5, align 4
  br label %14, !llvm.loop !8

41:                                               ; preds = %14
  %42 = load i32, i32* %3, align 4
  %43 = load i32, i32* %4, align 4
  %44 = icmp eq i32 %42, %43
  store i1 %44, i1* %2, align 1
  br label %45

45:                                               ; preds = %41, %11
  %46 = load i1, i1* %2, align 1
  ret i1 %46
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test() #0 {
  %1 = call zeroext i1 @isStrong(i32 noundef 145)
  br i1 %1, label %2, label %3

2:                                                ; preds = %0
  br label %4

3:                                                ; preds = %0
  call void @__assert_fail(i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 noundef 45, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #2
  unreachable

4:                                                ; preds = %2
  %5 = call zeroext i1 @isStrong(i32 noundef 543)
  br i1 %5, label %7, label %6

6:                                                ; preds = %4
  br label %8

7:                                                ; preds = %4
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0), i32 noundef 46, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #2
  unreachable

8:                                                ; preds = %6
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @test()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i64 2147500098}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
</code>