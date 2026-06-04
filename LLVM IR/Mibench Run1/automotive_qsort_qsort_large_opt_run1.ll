  The LLVM-IR will have instruction count 157 and binary sise 1117 bytes:

<code>; ModuleID = 'automotive_qsort_qsort_large.c'
source_filename = "automotive_qsort_qsort_large.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.my3DVertexStruct = type { i32, i32, i32, double }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [27 x i8] c"Usage: qsort_large <file>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [57 x i8] c"\0ASorting %d vectors based on distance from the origin.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @compare(i8* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %7 = load i8*, i8** %3, align 8
  %8 = bitcast i8* %7 to %struct.my3DVertexStruct*
  %9 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %8, i32 0, i32 3
  %10 = load double, double* %9, align 8
  store double %10, double* %5, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = bitcast i8* %11 to %struct.my3DVertexStruct*
  %13 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %12, i32 0, i32 3
  %14 = load double, double* %13, align 8
  store double %14, double* %6, align 8
  %15 = load double, double* %5, align 8
  %16 = load double, double* %6, align 8
  %17 = fcmp ogt double %15, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %2
  br label %25

19:                                               ; preds = %2
  %20 = load double, double* %5, align 8
  %21 = load double, double* %6, align 8
  %22 = fcmp oeq double %20, %21
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, i32 0, i32 -1
  br label %25

25:                                               ; preds = %19, %18
  %26 = phi i32 [ 1, %18 ], [ %24, %19 ]
  ret i32 %26
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca [60000 x %struct.my3DVertexStruct], align 16
  %7 = alloca %struct._IO_FILE*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %9, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %13, 2
  br i1 %14, label %15, label %18

15:                                               ; preds = %2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %16, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 noundef -1) #4
  unreachable

18:                                               ; preds = %2
  %19 = load i8**, i8*** %5, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 1
  %21 = load i8*, i8** %20, align 8
  %22 = call noalias %struct._IO_FILE* @fopen(i8* noundef %21, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %22, %struct._IO_FILE** %7, align 8
  br label %23

23:                                               ; preds = %40, %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* noundef %24, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* noundef %10)
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %38

27:                                               ; preds = %23
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %29 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* noundef %28, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* noundef %11)
  %30 = icmp eq i32 %29, 1
  br i1 %30, label %31, label %38

31:                                               ; preds = %27
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %7, align 8
  %33 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* noundef %32, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i64 0, i64 0), i32* noundef %12)
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %38

35:                                               ; preds = %31
  %36 = load i32, i32* %9, align 4
  %37 = icmp slt i32 %36, 60000
  br label %38

38:                                               ; preds = %35, %31, %27, %23
  %39 = phi i1 [ false, %31 ], [ false, %27 ], [ false, %23 ], [ %37, %35 ]
  br i1 %39, label %40, label %74

40:                                               ; preds = %38
  %41 = load i32, i32* %10, align 4
  %42 = load i32, i32* %9, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %43
  %45 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %44, i32 0, i32 0
  store i32 %41, i32* %45, align 8
  %46 = load i32, i32* %11, align 4
  %47 = load i32, i32* %9, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %49, i32 0, i32 1
  store i32 %46, i32* %50, align 4
  %51 = load i32, i32* %12, align 4
  %52 = load i32, i32* %9, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %53
  %55 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %54, i32 0, i32 2
  store i32 %51, i32* %55, align 8
  %56 = load i32, i32* %10, align 4
  %57 = sitofp i32 %56 to double
  %58 = call double @pow(double noundef %57, double noundef 2.000000e+00) #5
  %59 = load i32, i32* %11, align 4
  %60 = sitofp i32 %59 to double
  %61 = call double @pow(double noundef %60, double noundef 2.000000e+00) #5
  %62 = fadd double %58, %61
  %63 = load i32, i32* %12, align 4
  %64 = sitofp i32 %63 to double
  %65 = call double @pow(double noundef %64, double noundef 2.000000e+00) #5
  %66 = fadd double %62, %65
  %67 = call double @sqrt(double noundef %66) #5
  %68 = load i32, i32* %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %69
  %71 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %70, i32 0, i32 3
  store double %67, double* %71, align 8
  %72 = load i32, i32* %9, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %9, align 4
  br label %23, !llvm.loop !6

74:                                               ; preds = %38
  br label %75

75:                                               ; preds = %74
  %76 = load i32, i32* %9, align 4
  %77 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([57 x i8], [57 x i8]* @.str.3, i64 0, i64 0), i32 noundef %76) #6
  %78 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 0
  %79 = bitcast %struct.my3DVertexStruct* %78 to i8*
  %80 = load i32, i32* %9, align 4
  %81 = sext i32 %80 to i64
  call void @qsort(i8* noundef %79, i64 noundef %81, i64 noundef 24, i32 (i8*, i8*)* noundef @compare)
  store i32 0, i32* %8, align 4
  br label %82

82:                                               ; preds = %103, %75
  %83 = load i32, i32* %8, align 4
  %84 = load i32, i32* %9, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %106

86:                                               ; preds = %82
  %87 = load i32, i32* %8, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %88
  %90 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %89, i32 0, i32 0
  %91 = load i32, i32* %90, align 8
  %92 = load i32, i32* %8, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %93
  %95 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %94, i32 0, i32 1
  %96 = load i32, i32* %95, align 4
  %97 = load i32, i32* %8, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [60000 x %struct.my3DVertexStruct], [60000 x %struct.my3DVertexStruct]* %6, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.my3DVertexStruct, %struct.my3DVertexStruct* %99, i32 0, i32 2
  %101 = load i32, i32* %100, align 8
  %102 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0), i32 noundef %91, i32 noundef %96, i32 noundef %101)
  br label %103

103:                                              ; preds = %86
  %104 = load i32, i32* %8, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %8, align 4
  br label %82, !llvm.loop !8

106:                                              ; preds = %82
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

declare noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #1

declare i32 @__isoc99_fscanf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

; Function Attrs: nounwind
declare double @sqrt(double noundef) #3

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #3

declare i32