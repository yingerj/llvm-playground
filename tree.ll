; ModuleID = 'tree.c'
source_filename = "tree.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

%struct.node = type { %struct.node*, %struct.node*, i32 }

@.str = private unnamed_addr constant [23 x i8] c"hello llvm, meet tree\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define %struct.node* @new_node(i32 %label) #0 {
entry:
  %label.addr = alloca i32, align 4
  %n = alloca %struct.node*, align 8
  store i32 %label, i32* %label.addr, align 4
  %call = call i8* @malloc(i64 24)
  %0 = bitcast i8* %call to %struct.node*
  store %struct.node* %0, %struct.node** %n, align 8
  %1 = load %struct.node*, %struct.node** %n, align 8
  %left = getelementptr inbounds %struct.node, %struct.node* %1, i32 0, i32 0
  store %struct.node* null, %struct.node** %left, align 8
  %2 = load %struct.node*, %struct.node** %n, align 8
  %right = getelementptr inbounds %struct.node, %struct.node* %2, i32 0, i32 1
  store %struct.node* null, %struct.node** %right, align 8
  %3 = load i32, i32* %label.addr, align 4
  %4 = load %struct.node*, %struct.node** %n, align 8
  %label1 = getelementptr inbounds %struct.node, %struct.node* %4, i32 0, i32 2
  store i32 %3, i32* %label1, align 8
  %5 = load %struct.node*, %struct.node** %n, align 8
  ret %struct.node* %5
}

declare i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define zeroext i1 @rand_bool() #0 {
entry:
  %call = call i32 @rand()
  %rem = srem i32 %call, 2
  %tobool = icmp ne i32 %rem, 0
  ret i1 %tobool
}

declare i32 @rand() #1

; Function Attrs: nounwind ssp uwtable
define void @add_node_rand(%struct.node* %root, i32 %label) #0 {
entry:
  %root.addr = alloca %struct.node*, align 8
  %label.addr = alloca i32, align 4
  store %struct.node* %root, %struct.node** %root.addr, align 8
  store i32 %label, i32* %label.addr, align 4
  %call = call zeroext i1 @rand_bool()
  br i1 %call, label %if.then, label %if.else5

if.then:                                          ; preds = %entry
  %0 = load %struct.node*, %struct.node** %root.addr, align 8
  %left = getelementptr inbounds %struct.node, %struct.node* %0, i32 0, i32 0
  %1 = load %struct.node*, %struct.node** %left, align 8
  %tobool = icmp ne %struct.node* %1, null
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %2 = load %struct.node*, %struct.node** %root.addr, align 8
  %left2 = getelementptr inbounds %struct.node, %struct.node* %2, i32 0, i32 0
  %3 = load %struct.node*, %struct.node** %left2, align 8
  %4 = load i32, i32* %label.addr, align 4
  call void @add_node_rand(%struct.node* %3, i32 %4)
  br label %if.end

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %label.addr, align 4
  %call3 = call %struct.node* @new_node(i32 %5)
  %6 = load %struct.node*, %struct.node** %root.addr, align 8
  %left4 = getelementptr inbounds %struct.node, %struct.node* %6, i32 0, i32 0
  store %struct.node* %call3, %struct.node** %left4, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end13

if.else5:                                         ; preds = %entry
  %7 = load %struct.node*, %struct.node** %root.addr, align 8
  %right = getelementptr inbounds %struct.node, %struct.node* %7, i32 0, i32 1
  %8 = load %struct.node*, %struct.node** %right, align 8
  %tobool6 = icmp ne %struct.node* %8, null
  br i1 %tobool6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %if.else5
  %9 = load %struct.node*, %struct.node** %root.addr, align 8
  %right8 = getelementptr inbounds %struct.node, %struct.node* %9, i32 0, i32 1
  %10 = load %struct.node*, %struct.node** %right8, align 8
  %11 = load i32, i32* %label.addr, align 4
  call void @add_node_rand(%struct.node* %10, i32 %11)
  br label %if.end12

if.else9:                                         ; preds = %if.else5
  %12 = load i32, i32* %label.addr, align 4
  %call10 = call %struct.node* @new_node(i32 %12)
  %13 = load %struct.node*, %struct.node** %root.addr, align 8
  %right11 = getelementptr inbounds %struct.node, %struct.node* %13, i32 0, i32 1
  store %struct.node* %call10, %struct.node** %right11, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.else9, %if.then7
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.end
  ret void
}

; Function Attrs: nounwind ssp uwtable
define %struct.node* @gen_tree(i32 %num_nodes) #0 {
entry:
  %num_nodes.addr = alloca i32, align 4
  %root = alloca %struct.node*, align 8
  %i = alloca i32, align 4
  store i32 %num_nodes, i32* %num_nodes.addr, align 4
  %call = call %struct.node* @new_node(i32 0)
  store %struct.node* %call, %struct.node** %root, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %num_nodes.addr, align 4
  %sub = sub nsw i32 %1, 1
  %cmp = icmp slt i32 %0, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.node*, %struct.node** %root, align 8
  %3 = load i32, i32* %i, align 4
  call void @add_node_rand(%struct.node* %2, i32 %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load %struct.node*, %struct.node** %root, align 8
  ret %struct.node* %5
}

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %root = alloca %struct.node*, align 8
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0))
  %call1 = call %struct.node* @gen_tree(i32 10)
  store %struct.node* %call1, %struct.node** %root, align 8
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.0 (trunk 271148)"}
