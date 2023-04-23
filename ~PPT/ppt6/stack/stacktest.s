#stacktest.s - How many bytes does pushw and pushl cause %esp sub?
.section .text
.globl _start
_start:
	pushw	$12
#	pushw	$13
	pushl	$14
	pushw	$15

	movl	$1, %eax
	movl	$0, %ebx
	int 	$0x80
