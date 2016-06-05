; ModuleID = 'tree.c'
source_filename = "tree.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

%struct.node = type { %struct.node*, %struct.node*, i32 }

@.str = private unnamed_addr constant [12 x i8] c"hello llvm\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"root label %i\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %root = alloca %struct.node*, align 8
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0))
  %call1 = call i8* @malloc(i64 24)
  %0 = bitcast i8* %call1 to %struct.node*
  store %struct.node* %0, %struct.node** %root, align 8
  %1 = load %struct.node*, %struct.node** %root, align 8
  %label = getelementptr inbounds %struct.node, %struct.node* %1, i32 0, i32 2
  store i32 1, i32* %label, align 8
  %2 = load %struct.node*, %struct.node** %root, align 8
  %label2 = getelementptr inbounds %struct.node, %struct.node* %2, i32 0, i32 2
  %3 = load i32, i32* %label2, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

declare i8* @malloc(i64) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.0 (trunk 271148)"}
