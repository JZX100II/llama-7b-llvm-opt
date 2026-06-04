  The LLVM-IR will have instruction count 101 and binary sise 1008 bytes:

<code>; ModuleID = 'telecomm/FFT/fourierf.c'
source_filename = "telecomm/FFT/fourierf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [52 x i8] c"Error in fft():  NumSamples=%u is not power of two\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"RealIn\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"RealOut\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"ImagOut\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"Error in fft_float():  %s == NULL\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @fft_float(i32 noundef %0, i32 noundef %1, float* noundef %2, float* noundef %3, float* noundef %4, float* noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float*, align 8
  %10 = alloca float*, align 8
  %11 = alloca float*, align 8
  %12 = alloca float*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  %25 = alloca double, align 8
  %26 = alloca double, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca [3 x double], align 16
  %30 = alloca [3 x double], align 16
  %31 = alloca double, align 8
  %32 = alloca double, align 8
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store float* %2, float** %9, align 8
  store float* %3, float** %10, align 8
  store float* %4, float** %11, align 8
  store float* %5, float** %12, align 8
  store double 0x401921FB54442D18, double* %20, align 8
  %33 = load i32, i32* %7, align 4
  %34 = call i32 @IsPowerOfTwo(i32 noundef %33)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %40, label %36

36:                                               ; preds = %6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = load i32, i32* %7, align 4
  %39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %37, i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str, i64 0, i64 0), i32 noundef %38)
  call void @exit(i32 noundef 1) #5
  unreachable

40:                                               ; preds = %6
  %41 = load i32, i32* %8, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %46

43:                                               ; preds = %40
  %44 = load double, double* %20, align 8
  %45 = fneg double %44
  store double %45, double* %20, align 8
  br label %46

46:                                               ; preds = %43, %40
  %47 = load float*, float** %9, align 8
  %48 = bitcast float* %47 to i8*
  call void @CheckPointer(i8* noundef %48, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %49 = load float*, float** %11, align 8
  %50 = bitcast float* %49 to i8*
  call void @CheckPointer(i8* noundef %50, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %51 = load float*, float** %12, align 8
  %52 = bitcast float* %51 to i8*
  call void @CheckPointer(i8* noundef %52, i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0))
  %53 = load i32, i32* %7, align 4
  %54 = call i32 @NumberOfBitsNeeded(i32 noundef %53)
  store i32 %54, i32* %13, align 4
  store i32 0, i32* %14, align 4
  br label %55

55:                                               ; preds = %82, %46
  %56 = load i32, i32* %14, align 4
  %57 = load i32, i32* %7, align 4
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %59, label %85

59:                                               ; preds = %55
  %60 = load i32, i32* %14, align 4
  %61 = load i32, i32* %13, align 4
  %62 = call i32 @ReverseBits(i32 noundef %60, i32 noundef %61)
  store i32 %62, i32* %15, align 4
  %63 = load float*, float** %9, align 8
  %64 = load i32, i32* %14, align 4
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %63, i64 %65
  %67 = load float, float* %66, align 4
  %68 = load float*, float** %11, align 8
  %69 = load i32, i32* %15, align 4
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds float, float* %68, i64 %70
  store float %67, float* %71, align 4
  %72 = load float*, float** %10, align 8
  %73 = icmp eq float* %72, null
  br i1 %73, label %74, label %75

74:                                               ; preds = %59
  br label %82

75:                                               ; preds = %59
  %76 = load float*, float** %10, align 8
  %77 = load i32, i32* %14, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds float, float* %76, i64 %78
  %80 = load float, float* %79, align 4
  %81 = fpext float %80 to double
  br label %82

82:                                               ; preds = %75, %74
  %83 = phi double [ 0.000000e+00, %74 ], [ %81, %75 ]
  %84 = fptrunc double %83 to float
  call void @outlined_ir_func_0(ptr %12, ptr %15, float %84)
  call void @outlined_ir_func_1(ptr %14)
  br label %55

85:                                               ; preds = %55
  store i32 1, i32* %19, align 4
  store i32 2, i32* %18, align 4
  br label %86

86:                                               ; preds = %131, %85
  %87 = load i32, i32* %18, align 4
  %88 = load i32, i32* %7, align 4
  %89 = icmp ule i32 %87, %88
  br i1 %89, label %90, label %134

90:                                               ; preds = %86
  %91 = load double, double* %20, align 8
  %92 = load i32, i32* %18, align 4
  %93 = uitofp i32 %92 to double
  %94 = fdiv double %91, %93
  store double %94, double* %23, align 8
  %95 = load double, ptr %23, align 8
  %96 = fmul double -2.000000e+00, %95
  %97 = call double @sin(double noundef %96) #6
  store double %97, ptr %24, align 8
  %98 = load double, ptr %23, align 8
  %99 = fneg double %98
  %100 = call double @sin(double noundef %99) #6
  store double %100, ptr %25, align 8
  %101 = load double, ptr %23, align 8
  %102 = fmul double -2.000000e+00, %101
  %103 = call double @cos(double noundef %102) #6
  store double %103, ptr %26, align 8
  %104 = load double, ptr %23, align 8
  %105 = fneg double %104
  %106 = call double @cos(double noundef %105) #6
  store double %106, ptr %27, align 8
  %107 = load double, ptr %27, align 8
  %108 = fmul double 2.000000e+00, %107
  store double %108, ptr %28, align 8
  store i32 0, i32* %14, align 4
  br label %109

109:                                              ; preds = %126, %90
  %110 = load i32, ptr %14, align 4
  %111 = load i32, ptr %7, align 4
  %112 = icmp ult i32 %110, %111
  br i1 %112, label %113, label %131

113:                                              ; preds = %109
  %114 = load double, ptr %26, align 8
  %115 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 2
  store double %114, ptr %115, align 16
  %116 = load double, ptr %27, align 8
  %117 = getelementptr inbounds [3 x double], ptr %29, i64 0, i64 1
  store double %116, ptr %117, align 8
  %118 = load i32, ptr %14, align 4
  store i32 %118, ptr %15, align 4
  store i32 0, ptr %17, align 4
  br label %119

119:                                              ; preds = %122, %113
  %120 = load i32, ptr %17, align 4
  %121 = icmp ult i32 %120, 1
  br i1 %121, label %122, label %126

122:                                              ; preds = %119
  %123 = load i32, ptr %15, align 4
  %124 = load i32, ptr %19, align 4
  %125 = add i32 %123, %124
  store i32 %125, ptr %16, align 4
  call void @outlined_ir_func_0(ptr %11, ptr %16, float 0.000000e+00)
  call void @outlined_ir_func_0(ptr %12, ptr %16, float 0.000000e+00)
  call void @outlined_ir_func_1(ptr %15)
  call void @outlined_ir_func_1(ptr %17)
  br label %119

126:                                              ; preds = %119
  %127 = load i32, ptr %18, align 4
  %128 = load i32, ptr %14, align 4
  %129 = add i32 %128, %127
  store i32 %129, ptr %14, align 4
  br label %109, !llvm.loop !6

130:                                              ; No predecessors!
  unreachable

131:                                              ; preds = %109
  %132 = load i32, ptr %18, align 4
  store i32 %132, ptr %19, align 4
  %133 = shl i32 %132, 1
  store i32 %133, ptr %18, align 4
  br label %86, !llvm.loop !8

134:                                              ; preds = %86
  %135 = load i32, ptr %8, align 4
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %155

137:                                              ; preds = %134
  %138 = load i32, ptr %7, align 4
  %139 = uitofp i32 %138 to double
  store double %139, ptr %32, align 8
  store i32 0, ptr %14, align 4
  br label %140

140:                                              ; preds = %144, %137
  %141 = load i32, ptr %14, align 4
  %142 = load i32, ptr %7, align 4
  %143 = icmp ult i32 %141, %142
  br i1 %143, label %144, label %154

144:                                              ; preds = %140
  %145 = load double, ptr %32, align 8
  %146 = load float*, float** %11, align 8
  %147 = load i32, ptr %14, align 4
  %148 = zext i32 %147 to i64
  %149 = getelementptr inbounds float, float* %146, i64 %148
  %150 = load float, float* %149, align 4
  %151 = fpext float %150 to double
  %152 = fdiv double %151, %145
  %153 = fptrunc double %152 to float
  store float %153, float* %149
  call void @outlined_ir_func_1(ptr %14)
  br label %140

154:                                              ; preds = %140
  br label %155

155:                                              ; preds = %154, %134
  ret void
}

declare i32 @IsPowerOfTwo(i32 noundef) #1

declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @CheckPointer(i8* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %8, i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0), i8* noundef %9)
  call void @exit(i32 noundef 1) #5
  unreachable

11:                                               ; preds = %2
  ret void
}

declare i32 @NumberOfBitsNeeded(i32 noundef) #1

declare i32 @ReverseBits(i32 noundef, i32 noundef) #1

; Function Attrs: nounwind
declare double @sin(double noundef) #3

; Function Attrs: nounwind
declare double @cos(double noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #4

; Function Attrs: minsize nounwind optsize uwtable
define internal void @outlined_ir_func_0(ptr %0, ptr %1, float %2) #5 {
newFuncRoot:
  br label %_to_outline

_to_outline:                                      ; preds = %newFuncRoot
  %3 = load float*, float** %0, align 8
  %4 = load i32, ptr %1, align 4
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds float, float* %3, i64 %5
  store float %2, float* %6, align 4
  br label %_after_outline.exitStub

_after_outline.exitStub:                          ; preds = %_to_outline
  ret void
}

; Function Attrs: minsize nounwind optsize uwtable
define internal void @outlined_ir_func_1(ptr %0) #5 {
newFuncRoot:
  br label %_to_outline

_to_outline:                                      ; preds = %newFuncRoot
  br label %1

1:                                                ; preds = %_to_outline
  %2 = load i32, ptr %0, align 4
  %3 = add i32 %2, 1
  store i32 %3, ptr %0, align 4
  br label %.exitStub, !llvm.loop !9

.exitStub:                                        ; preds = %1
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { minsize nounwind optsize uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"};
!5 = !{!"synthetic_function_entry_count", i64 5}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
</code>