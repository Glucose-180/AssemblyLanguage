# pushw test
.section .text
.globl _start
_start:
	movw	$12, %dx
	pushw	%dx
	popw	%cx
# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
