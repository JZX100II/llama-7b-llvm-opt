  ; ModuleID = '<stdin>'
  source_filename = "-"
  target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
  target triple = "x86_64-unknown-linux-gnu"

  ; Function Attrs: minsize nounwind optsize uwtable
  define dso_local i32 @add_two(i32 noundef %0, i32 noundef %1) #0 {
    %3 = add nsw i32 %0, %1
    ret i32 %3
  }

  attributes #0 = { minsize nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

  !llvm.module.flags = !{!0, !1, !2, !3}
  !llvm.ident = !{!4}

  !0 = !{i32 1, !"wchar_size", i32 4}
  !1 = !{i32 8, !"PIC Level", i32 2}
  !2 = !{i32 7, !"PIE Level", i32 2}
  !3 = !{i32 7, !"uwtable", i32 2}
  !4 = !{!"clang version 17.0.6 (git@github.com:fairinternal/CodeGen.git b05db9bbf7a92019267416c1bb9996fe6134e3f1)"}