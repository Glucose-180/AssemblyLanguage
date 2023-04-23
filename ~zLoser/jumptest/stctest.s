# signtest.s - An example of using the stc instruction
.section .data
out0:
	.asciz "CF is 0!\n"
out1:
	.asciz "CF is 1!\n"
.section .text
.globl	_start
_start:
	movl	$9, %eax
	addl	$1, %eax
	jc	l0
	pushl	$out0
	call	printf
	addl	$4, %esp
l0:
	stc
	jnc	l1
	pushl	$out1
	call	printf
	addl	$4, %esp
l1:
	movl	$1, %eax
	movl	$0, %ebx	# return 0
	int	$0x80
