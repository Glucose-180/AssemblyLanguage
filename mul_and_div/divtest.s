# divtest.s - An example of DIV instruction
.section .data
dividend:
	.quad 8335
divisor:
	.int 25
quotient:
	.int 0
remainder:
	.int 0
output:
	.asciz "The quotient is %d, and the remainder is %d.\n"
.section .text
.globl _start
_start:
	movl	dividend, %eax
	movl	dividend + 4, %edx
	divl	divisor	# edx:eax / divisor -> eax ... edx
	movl	%eax, quotient
	movl	%edx, remainder
	pushl	remainder
	pushl	quotient
	pushl	$output
	call	printf
	addl	$12, %esp
	pushl	$0
	call	exit
