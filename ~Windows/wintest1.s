# wintest1.s - An example of Windows program
.section .data
dt:
	.int 3
.section .text
.globl main
main:
	movl	dt, %eax
	movq	$250, %rbx
	pushq	%rbx
	popq	%rax
	movl	$5, %eax
	ret
