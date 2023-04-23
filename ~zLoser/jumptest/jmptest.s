# jmptest.s - An example of jmp
.section .text
.globl _start
_start:
	movl	$1, %eax
	jmp	overhere
	movl	$10, %ebx
	int	$0x80
overhere:
	movl	$020, %ebx
	int	$0x80
