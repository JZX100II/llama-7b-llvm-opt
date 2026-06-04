  The LLVM-IR will have instruction count 103 and binary sise 1007 bytes:

<code>; ModuleID = 'security/sha/sha_driver.c'
source_filename = "security/sha/sha_driver.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.SHA_INFO = type { [5 x i64], i64, i64, [16 x i64] }

@stdin = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"error opening %s for reading\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  %7 = alloca %struct.SHA_INFO, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %13

10:                                               ; preds = %2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %11, %struct._IO_FILE** %6, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @sha_stream(%struct.SHA_INFO* noundef %7, %struct._IO_FILE* noundef %12)
  call void @sha_print(%struct.SHA_INFO* noundef %7)
  br label %35

13:                                               ; preds = %2
  br label %14

14:                                               ; preds = %33, %13
  %15 = load i32, i32* %4, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %4, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %34

18:                                               ; preds = %14
  %19 = load i8**, i8*** %5, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i32 1
  store i8** %20, i8*** %5, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = call noalias %struct._IO_FILE* @fopen(i8* noundef %21, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0))
  store %struct._IO_FILE* %22, %struct._IO_FILE** %6, align 8
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %24 = icmp eq %struct._IO_FILE* %23, null
  br i1 %24, label %25, label %29

25:                                               ; preds = %18
  %26 = load i8**, i8*** %5, align 8
  %27 = load i8*, i8** %26, align 8
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i64 0, i64 0), i8* noundef %27)
  br label %33

29:                                               ; preds = %18
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  call void @sha_stream(%struct.SHA_INFO* noundef %7, %struct._IO_FILE* noundef %30)
  call void @sha_print(%struct.SHA_INFO* noundef %7)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %32 = call i32 @fclose(%struct._IO_FILE* noundef %31)
  br label %33

33:                                               ; preds = %29, %25
  br label %14, !llvm.loop !6

34:                                               ; preds = %14
  br label %35

35:                                               ; preds = %34, %10
  ret i32 0
}

declare void @sha_stream(%struct.SHA_INFO* noundef, %struct._IO_FILE* noundef) #1

declare void @sha_print(%struct.SHA_INFO* noundef) #1

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #1

declare i32 @printf(i8* noundef, ...) #1

declare i32 @fclose(%struct._IO_FILE* noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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