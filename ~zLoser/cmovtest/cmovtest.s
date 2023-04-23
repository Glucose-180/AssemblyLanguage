# cmovtest.s - An example of the CMOVE instruction
.section .data
output:
	.asciz "The largest value is %d\n"
values:
	.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl main
main:
	movl	values, %ebx
	movl	$1, %edi
l0:
	movl	values(, %edi, 4), %eax
	cmpl	%ebx, %eax
	cmova	%eax, %ebx
	inc	%edi
	cmpl	$10, %edi
	jne	l0
	pushl	%ebx
	pushl	$output
	call	printf
	addl	$8, %esp
	pushl	$0
	call	exit
