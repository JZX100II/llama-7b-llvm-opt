

<code>; ModuleID = '<stdin>'
source_filename = "-"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { i32, %struct.node* }

@top = dso_local global %struct.node* null, align 8
@.str = private unnamed_addr constant [34 x i8] c"\09****stack using linked list****\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"\0A1. Push\0A2. Pop\0A3. Display\0A4. Exit\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"\0AEnter element to be inserted: \00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"Inserted successfully.\0A\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"\0AStack is empty.\0A\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"\0AElement popped is %d.\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"\0AElements in the stack are:\0A\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"\09%d\0A\00", align 1
@temp = dso_local global %struct.node* null, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0))
  br label %5

5:                                                ; preds = %20, %0
  %6 = load i32, i32* %2, align 4
  %7 = icmp ne i32 %6, 4
  br i1 %7, label %8, label %21

8:                                                ; preds = %5
  %9 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0))
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0))
  %11 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i32* noundef %2)
  %12 = load i32, ptr %2, align 4
  switch i32 %12, label %20 [
    i32 1, label %13
    i32 2, label %15
    i32 3, label %17
    i32 4, label %19
  ]

13:                                               ; preds = %8
  %14 = load %struct.node*, ptr @top, align 8
  call void @push(%struct.node* noundef %14)
  br label %20

15:                                               ; preds = %8
  %16 = load %struct.node*, ptr @top, align 8
  call void @pop(%struct.node* noundef %16)
  br label %20

17:                                               ; preds = %8
  %18 = load %struct.node*, ptr @top, align 8
  call void @display(%struct.node* noundef %18)
  br label %20

19:                                               ; preds = %8
  store i32 0, i32* %1, align 4
  br label %21

20:                                               ; preds = %8, %17, %15, %13
  br label %5, !llvm.loop !6

21:                                               ; preds = %19, %5
  %22 = load i32, ptr %1, align 4
  ret i32 %22
}

declare i32 @printf(i8* noundef, ...) #1

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @push(%struct.node* noundef %0) #0 {
  %2 = alloca %struct.node*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.node*, align 8
  store %struct.node* %0, ptr %2, align 8
  %5 = call noalias i8* @malloc(i64 noundef 16) #3
  %6 = bitcast i8* %5 to %struct.node*
  store %struct.node* %6, ptr %4, align 8
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0))
  %8 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i32* noundef %3)
  %9 = load i32, ptr %3, align 4
  %10 = load %struct.node*, ptr %4, align 8
  %11 = getelementptr inbounds %struct.node, %struct.node* %10
  store i32 %9, i32* %11, align 8
  %12 = load %struct.node*, ptr @top, align 8
  %13 = load %struct.node*, ptr %4, align 8
  %14 = getelementptr inbounds %struct.node, %struct.node* %13
  %15 = getelementptr inbounds %struct.node, %struct.node* %14
  store %struct.node* %12, ptr %15, align 8
  %16 = load %struct.node*, ptr %4, align 8
  store %struct.node* %16, ptr @top, align 8
  %17 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @pop(%struct.node* noundef %0) #0 {
  %2 = alloca %struct.node*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.node*, align 8
  store %struct.node* %0, ptr %2, align 8
  %5 = load %struct.node*, ptr @top, align 8
  %6 = icmp eq %struct.node* %5, null
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0))
  br label %21

9:                                                ; preds = %1
  %10 = load %struct.node*, ptr @top, align 8
  %11 = getelementptr inbounds %struct.node, %struct.node* %10
  %12 = load i32, i32* %11, align 8
  store i32 %12, i32* %3, align 4
  %13 = load %struct.node*, ptr @top, align 8
  store %struct.node* %13, ptr %4, align 8
  %14 = load %struct.node*, ptr @top, align 8
  %15 = getelementptr inbounds %struct.node, %struct.node* %14
  %16 = getelementptr inbounds %struct.node, %struct.node* %15
  %17 = load %struct.node*, ptr %16, align 8
  store %struct.node* %17, ptr @top, align 8
  %18 = load %struct.node*, ptr %4, align 8
  %19 = bitcast %struct.node* %18 to i8*
  call void @free(i8* noundef %19) #3
  %20 = load i32, ptr %3, align 4
  call void @outlined_ir_func_0(i32 %20)
  br label %21

21:                                               ; preds = %9, %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @display(%struct.node* noundef %0) #0 {
  %2 = alloca %struct.node*, align 8
  store %struct.node* %0, ptr %2, align 8
  %3 = load %struct.node*, ptr @top, align 8
  %4 = icmp eq %struct.node* %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0))
  br label %21

7:                                                ; preds = %1
  %8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0))
  br label %9

9:                                                ; preds = %12, %7
  %10 = load %struct.node*, ptr %2, align 8
  %11 = icmp ne %struct.node* %10, null
  br i1 %11, label %12, label %20

12:                                               ; preds = %9
  %13 = load %struct.node*, ptr %2, align 8
  %14 = getelementptr inbounds %struct.node, %struct.node* %13
  %15 = load i32, i32* %14, align 8
  call void @outlined_ir_func_0(i32 %15)
  %16 = load %struct.node*, ptr %2, align 8
  %17 = getelementptr inbounds %struct.node, %struct.node* %16
  %18 = getelementptr inbounds %struct.node, %struct.node* %17
  %19 = load %struct.node*, ptr %18, align 8
  store %struct.node* %19, ptr %2, align 8
  br label %9, !llvm.loop !8

20:                                               ; preds = %9
  br label %21

21:                                               ; preds = %20, %5
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare void @free(i8* noundef) #2

; Function Attrs: minsize nounwind optsize uwtable
define internal void @outlined_ir_func_0(i32 %0) #3 {
newFuncRoot:
  br label %_to_outline

_to_outline:                                      ; preds = %newFuncRoot
  %1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i64 0, i64 0), i32 noundef %0)
  br label %_after_outline.exitStub

_after_outline.exitStub:                          ; preds = %_to_outline
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i64 2147508776}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
</code>