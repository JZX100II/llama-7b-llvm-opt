  The LLVM-IR will have instruction count 117 and binary sise 657 bytes:

<code>; ModuleID = 'conversions_decimal_to_binary_recursion.c'
source_filename = "conversions_decimal_to_binary_recursion.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const.test.sets = private unnamed_addr constant [7 x [2 x i32]] [[2 x i32] zeroinitializer, [2 x i32] [i32 1, i32 1], [2 x i32] [i32 2, i32 10], [2 x i32] [i32 3, i32 11], [2 x i32] [i32 4, i32 100], [2 x i32] [i32 6, i32 110], [2 x i32] [i32 7, i32 111]], align 16
@.str = private unnamed_addr constant [44 x i8] c"decimal_to_binary(sets[i][0]) == sets[i][1]\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"conversions_decimal_to_binary_recursion.c\00", align 1
@__PRETTY_FUNCTION__.test = private unnamed_addr constant [12 x i8] c"void test()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @decimal_to_binary(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %14

6:                                                ; preds = %1
  %7 = load i32, i32* %2, align 4
  %8 = urem i32 %7, 2
  %9 = load i32, i32* %2, align 4
  %10 = udiv i32 %9, 2
  %11 = call i32 @decimal_to_binary(i32 noundef %10)
  %12 = mul nsw i32 10, %11
  %13 = add i32 %8, %12
  br label %14

14:                                               ; preds = %6, %5
  %15 = phi i32 [ 0, %5 ], [ %13, %6 ]
  ret i32 %15
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test() #0 {
  %1 = alloca [7 x [2 x i32]], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast [7 x [2 x i32]]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([7 x [2 x i32]]* @__const.test.sets to i8*), i64 56, i1 false)
  store i32 0, i32* %2, align 4
  store i32 7, i32* %3, align 4
  br label %5

5:                                                ; preds = %25, %0
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %28

9:                                                ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [7 x [2 x i32]], [7 x [2 x i32]]* %1, i64 0, i64 %11
  %13 = getelementptr inbounds [2 x i32], [2 x i32]* %12, i64 0, i64 0
  %14 = load i32, i32* %13, align 8
  %15 = call i32 @decimal_to_binary(i32 noundef %14)
  %16 = load i32, i32* %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [7 x [2 x i32]], [7 x [2 x i32]]* %1, i64 0, i64 %17
  %19 = getelementptr inbounds [2 x i32], [2 x i32]* %18, i64 0, i64 1
  %20 = load i32, i32* %19, align 4
  %21 = icmp eq i32 %15, %20
  br i1 %21, label %22, label %23

22:                                               ; preds = %9
  br label %24

23:                                               ; preds = %9
  call void @__assert_fail(i8* noundef getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0), i32 noundef 29, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #3
  unreachable

24:                                               ; preds = %22
  br label %25

25:                                               ; preds = %24
  %26 = load i32, i32* %2, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %2, align 4
  br label %5, !llvm.loop !6

28:                                               ; preds = %5
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0i8.p0i8.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @test()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i32 0, i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
</code>