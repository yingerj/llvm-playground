	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 11
	.globl	_new_node
	.p2align	4, 0x90
_new_node:                              ## @new_node
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -12(%rbp)
	movl	$24, %edi
	callq	_malloc
	movq	%rax, -8(%rbp)
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, 16(%rcx)
	movq	-8(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_rand_bool
	.p2align	4, 0x90
_rand_bool:                             ## @rand_bool
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp3:
	.cfi_def_cfa_offset 16
Ltmp4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp5:
	.cfi_def_cfa_register %rbp
	callq	_rand
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	cmpl	%ecx, %eax
	setne	%al
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_add_node_rand
	.p2align	4, 0x90
_add_node_rand:                         ## @add_node_rand
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -4(%rbp)
	callq	_rand_bool
	testb	%al, %al
	je	LBB2_5
## BB#1:                                ## %if.then
	movq	-16(%rbp), %rax
	cmpq	$0, (%rax)
	je	LBB2_4
## BB#2:                                ## %if.then1
	movq	-16(%rbp), %rax
	movq	(%rax), %rdi
	jmp	LBB2_3
LBB2_5:                                 ## %if.else5
	movq	-16(%rbp), %rax
	cmpq	$0, 8(%rax)
	je	LBB2_7
## BB#6:                                ## %if.then7
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
LBB2_3:                                 ## %if.end13
	movl	-4(%rbp), %esi
	callq	_add_node_rand
	jmp	LBB2_8
LBB2_4:                                 ## %if.else
	movl	-4(%rbp), %edi
	callq	_new_node
	movq	-16(%rbp), %rcx
	movq	%rax, (%rcx)
	jmp	LBB2_8
LBB2_7:                                 ## %if.else9
	movl	-4(%rbp), %edi
	callq	_new_node
	movq	-16(%rbp), %rcx
	movq	%rax, 8(%rcx)
LBB2_8:                                 ## %if.end13
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_gen_tree
	.p2align	4, 0x90
_gen_tree:                              ## @gen_tree
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -8(%rbp)
	xorl	%edi, %edi
	callq	_new_node
	movq	%rax, -16(%rbp)
	movl	$1, -4(%rbp)
	jmp	LBB3_1
	.p2align	4, 0x90
LBB3_2:                                 ## %for.body
                                        ##   in Loop: Header=BB3_1 Depth=1
	movq	-16(%rbp), %rdi
	movl	-4(%rbp), %esi
	callq	_add_node_rand
	incl	-4(%rbp)
LBB3_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	decl	%eax
	cmpl	%eax, -4(%rbp)
	jl	LBB3_2
## BB#3:                                ## %for.end
	movq	-16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	movl	$10, %edi
	callq	_gen_tree
	movq	%rax, -16(%rbp)
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"hello llvm, meet tree\n"


.subsections_via_symbols
