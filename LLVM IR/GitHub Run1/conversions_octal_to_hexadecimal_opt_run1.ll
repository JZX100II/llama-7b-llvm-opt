

And the LLVM-IR will have instruction count 146 and binary sise 1267 bytes:

<code>; ModuleID = 'conversions_octal_to_hexadecimal.c'
source_filename = "conversions_octal_to_hexadecimal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%lX\00", align 1
@.str.1 = private unnamed_addr constant [24 x i8] c"Enter an octal number: \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"Equivalent hexadecimal number is: %s\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"8B\00", align 1
@.str.5 = private unnamed_addr constant [43 x i8] c"strcmp(octalToHexadecimal(213), \228B\22) == 0\00", align 1
@.str.6 = private unnamed_addr constant [35 x i8] c"conversions_octal_to_hexadecimal.c\00", align 1
@__PRETTY_FUNCTION__.test = private unnamed_addr constant [12 x i8] c"void test()\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"7C\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"strcmp(octalToHexadecimal(174), \227C\22) == 0\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @octalToDecimal(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i64 0, i64* %3, align 8
  store i32 0, i32* %4, align 4
  br label %5

5:                                                ; preds = %8, %1
  %6 = load i64, i64* %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %22

8:                                                ; preds = %5
  %9 = load i64, i64* %2, align 8
  %10 = srem i64 %9, 10
  %11 = sitofp i64 %10 to double
  %12 = load i32, i32* %4, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %4, align 4
  %14 = sitofp i32 %12 to double
  %15 = call double @pow(double noundef 8.000000e+00, double noundef %14) #6
  %16 = load i64, i64* %3, align 8
  %17 = sitofp i64 %16 to double
  %18 = call double @llvm.fmuladd.f64(double %11, double %15, double %17)
  %19 = fptosi double %18 to i64
  store i64 %19, i64* %3, align 8
  %20 = load i64, i64* %2, align 8
  %21 = sdiv i64 %20, 10
  store i64 %21, i64* %2, align 8
  br label %5, !llvm.loop !6

22:                                               ; preds = %5
  %23 = load i64, i64* %3, align 8
  ret i64 %23
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @octalToHexadecimal(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i8*, align 8
  store i64 %0, i64* %2, align 8
  %4 = call noalias i8* @malloc(i64 noundef 256) #6
  store i8* %4, i8** %3, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i64, i64* %2, align 8
  %7 = call i64 @octalToDecimal(i64 noundef %6)
  %8 = call i32 (i8*, i8*, ...) @sprintf(i8* noundef %5, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 noundef %7) #6
  %9 = load i8*, i8** %3, align 8
  ret i8* %9
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #1

; Function Attrs: nounwind
declare i32 @sprintf(i8* noundef, i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 0, i32* %1, align 4
  call void @test()
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i64 0, i64 0))
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* noundef %2)
  %6 = load i32, i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = call i8* @octalToHexadecimal(i64 noundef %7)
  store i8* %8, i8** %3, align 8
  %9 = load i8*, i8** %3, align 8
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i64 0, i64 0), i8* noundef %9)
  %11 = load i8*, i8** %3, align 8
  call void @free(i8* noundef %11) #6
  ret i32 0
}

declare i32 @printf(i8* noundef, ...) #3

declare i32 @__isoc99_scanf(i8* noundef, ...) #3

; Function Attrs: nounwind
declare void @free(i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @test() #0 {
  %1 = call i8* @octalToHexadecimal(i64 noundef 213)
  %2 = call i32 @strcmp(i8* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)) #7
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %0
  br label %6

5:                                                ; preds = %0
  call void @__assert_fail(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i64 0, i64 0), i32 noundef 50, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #8
  unreachable

6:                                                ; preds = %4
  %7 = call i8* @octalToHexadecimal(i64 noundef 174)
  %8 = call i32 @strcmp(i8* noundef %7, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #7
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %6
  br label %12

11:                                               ; preds = %6
  call void @__assert_fail(i8* noundef getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.6, i64 0, i64 0), i32 noundef 53, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @__PRETTY_FUNCTION__.test, i64 0, i64 0)) #8
  unreachable

12:                                               ; preds = %10
  ret void
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(i8* noundef, i8* noundef) #4

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!"synthetic_function_entry_count", i64 15}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
</code>