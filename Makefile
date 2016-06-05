tree.ll : tree.c
	clang -S -emit-llvm tree.c

tree.s : tree.ll
	llc tree.ll

tree : tree.s
	gcc tree.s -o tree

.PHONY : all
all : tree
