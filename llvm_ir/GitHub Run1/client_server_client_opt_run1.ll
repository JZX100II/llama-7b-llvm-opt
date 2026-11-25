  The LLVM-IR will have instruction count 117 and binary sise 1017 bytes:

<code>; ModuleID = 'client_server_client.c'
source_filename = "client_server_client.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [20 x i8] c"Enter the string : \00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"From Server : %s\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Client Exit...\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"socket creation failed...\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"Socket successfully created..\0A\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"connection with the server failed...\0A\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"connected to the server..\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @func(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca [80 x i8], align 16
  %4 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  br label %5

5:                                                ; preds = %33, %1
  %6 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 80, i1 false)
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %4, align 4
  br label %8

8:                                                ; preds = %17, %5
  %9 = call i32 @getchar()
  %10 = trunc i32 %9 to i8
  %11 = load i32, i32* %4, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %4, align 4
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 %13
  store i8 %10, i8* %14, align 1
  %15 = sext i8 %10 to i32
  %16 = icmp ne i32 %15, 10
  br i1 %16, label %17, label %18

17:                                               ; preds = %8
  br label %8, !llvm.loop !6

18:                                               ; preds = %8
  %19 = load i32, i32* %2, align 4
  %20 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  %21 = call i64 @write(i32 noundef %19, i8* noundef %20, i64 noundef 80)
  %22 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* align 16 %22, i8 0, i64 80, i1 false)
  %23 = load i32, i32* %2, align 4
  %24 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  %25 = call i64 @read(i32 noundef %23, i8* noundef %24, i64 noundef 80)
  %26 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  %27 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i8* noundef %26)
  %28 = getelementptr inbounds [80 x i8], [80 x i8]* %3, i64 0, i64 0
  %29 = call i32 @strncmp(i8* noundef %28, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 noundef 4) #7
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %18
  %32 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0))
  br label %34

33:                                               ; preds = %18
  br label %5

34:                                               ; preds = %31
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

declare i32 @printf(i8* noundef, ...) #2

declare i32 @getchar() #2

declare i64 @write(i32 noundef, i8* noundef, i64 noundef) #2

declare i64 @read(i32 noundef, i8* noundef, i64 noundef) #2

; Function Attrs: nounwind readonly willreturn
declare i32 @strncmp(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.sockaddr_in, align 4
  %5 = alloca %struct.sockaddr_in, align 4
  store i32 0, i32* %1, align 4
  %6 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 0) #8
  store i32 %6, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %11

9:                                                ; preds = %0
  %10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i64 0, i64 0))
  call void @exit(i32 noundef 0)
  unreachable

11:                                               ; preds = %0
  %12 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0))
  br label %13

13:                                               ; preds = %11
  %14 = bitcast %struct.sockaddr_in* %4 to i8*
  call void @llvm.memset.p0.i64(i8* align 4 %14, i8 0, i64 16, i1 false)
  %15 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %4, i32 0, i32 0
  store i16 2, i16* %15, align 4
  %16 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0)) #8
  %17 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %4, i32 0, i32 2
  %18 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %17, i32 0, i32 0
  store i32 %16, i32* %18, align 4
  %19 = call zeroext i16 @htons(i16 noundef zeroext 8080) #9
  %20 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %4, i32 0, i32 1
  store i16 %19, i16* %20, align 2
  %21 = load i32, i32* %2, align 4
  %22 = bitcast %struct.sockaddr_in* %4 to %struct.sockaddr*
  %23 = call i32 @connect(i32 noundef %21, %struct.sockaddr* noundef %22, i32 noundef 16)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %27

25:                                               ; preds = %13
  %26 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([38 x i8], [38 x i8]* @.str.7, i64 0, i64 0))
  call void @exit(i32 noundef 0)
  unreachable

27:                                               ; preds = %13
  %28 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0))
  br label %29

29:                                               ; preds = %27
  %30 = load i32, i32* %2, align 4
  call void @func(i32 noundef %30)
  %31 = load i32, i32* %2, align 4
  %32 = call i32 @close(i32 noundef %31)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

; Function Attrs: nounwind
declare i32 @inet_addr(i8* noundef) #4

; Function Attrs: nounwind readnone willreturn
declare zeroext i16 @htons(i16 noundef zeroext) #6

declare i32 @connect(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i32 @close(i32 noundef) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{i64 108}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
</code>