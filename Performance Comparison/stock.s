	.text
	.file	"data_structures_linked_list_stack_using_linked_lists.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$4, -4(%rbp)
	je	.LBB0_9
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf@PLT
	leaq	-4(%rbp), %rsi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	-4(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, %ecx
	subl	$3, %ecx
	ja	.LBB0_8
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movq	.LJTI0_0(,%rax,8), %rax
	jmpq	*%rax
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movq	top, %rdi
	callq	push
	jmp	.LBB0_8
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movq	top, %rdi
	callq	pop
	jmp	.LBB0_8
.LBB0_6:                                #   in Loop: Header=BB0_1 Depth=1
	movq	top, %rdi
	callq	display
	jmp	.LBB0_8
.LBB0_7:
	movl	$0, -8(%rbp)
	jmp	.LBB0_10
.LBB0_8:                                #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_9:                                # %.loopexit
	jmp	.LBB0_10
.LBB0_10:
	movl	-8(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI0_0:
	.quad	.LBB0_4
	.quad	.LBB0_5
	.quad	.LBB0_6
	.quad	.LBB0_7
                                        # -- End function
	.text
	.globl	push                            # -- Begin function push
	.p2align	4, 0x90
	.type	push,@function
push:                                   # @push
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	callq	malloc@PLT
	movq	%rax, -8(%rbp)
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf@PLT
	movabsq	$.L.str.3, %rdi
	leaq	-12(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	movq	-8(%rbp), %rcx
	movl	%eax, (%rcx)
	movq	top, %rax
	movq	-8(%rbp), %rcx
	movq	%rax, 8(%rcx)
	movq	-8(%rbp), %rax
	movq	%rax, top
	movabsq	$.L.str.5, %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	push, .Lfunc_end1-push
	.cfi_endproc
                                        # -- End function
	.globl	pop                             # -- Begin function pop
	.p2align	4, 0x90
	.type	pop,@function
pop:                                    # @pop
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, top
	jne	.LBB2_2
# %bb.1:
	movabsq	$.L.str.6, %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB2_3
.LBB2_2:
	movq	top, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	top, %rax
	movq	%rax, -16(%rbp)
	movq	top, %rax
	movq	8(%rax), %rax
	movq	%rax, top
	movq	-16(%rbp), %rdi
	callq	free@PLT
	movl	-4(%rbp), %esi
	movabsq	$.L.str.7, %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB2_3:
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	pop, .Lfunc_end2-pop
	.cfi_endproc
                                        # -- End function
	.globl	display                         # -- Begin function display
	.p2align	4, 0x90
	.type	display,@function
display:                                # @display
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, top
	jne	.LBB3_2
# %bb.1:
	movabsq	$.L.str.6, %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB3_6
.LBB3_2:
	movabsq	$.L.str.8, %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB3_3:                                # =>This Inner Loop Header: Depth=1
	cmpq	$0, -8(%rbp)
	je	.LBB3_5
# %bb.4:                                #   in Loop: Header=BB3_3 Depth=1
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	movabsq	$.L.str.9, %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB3_3
.LBB3_5:
	jmp	.LBB3_6
.LBB3_6:
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	display, .Lfunc_end3-display
	.cfi_endproc
                                        # -- End function
	.type	top,@object                     # @top
	.bss
	.globl	top
	.p2align	3
top:
	.quad	0
	.size	top, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\t****stack using linked list****\n"
	.size	.L.str, 34

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"\n1. Push\n2. Pop\n3. Display\n4. Exit\n"
	.size	.L.str.1, 36

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Enter your choice: "
	.size	.L.str.2, 20

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"%d"
	.size	.L.str.3, 3

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"\nEnter element to be inserted: "
	.size	.L.str.4, 32

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"Inserted successfully.\n"
	.size	.L.str.5, 24

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"\nStack is empty.\n"
	.size	.L.str.6, 18

	.type	.L.str.7,@object                # @.str.7
.L.str.7:
	.asciz	"\nElement popped is %d.\n"
	.size	.L.str.7, 24

	.type	.L.str.8,@object                # @.str.8
.L.str.8:
	.asciz	"\nElements in the stack are:\n"
	.size	.L.str.8, 29

	.type	.L.str.9,@object                # @.str.9
.L.str.9:
	.asciz	"\t%d\n"
	.size	.L.str.9, 5

	.type	temp,@object                    # @temp
	.bss
	.globl	temp
	.p2align	3
temp:
	.quad	0
	.size	temp, 8

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
