# mov test 1: from reg to RAM
.section .data
value:
	.int	1
.section .text
.globl main
main:
	movl	value, %ecx
	movl	$1, %eax
	movl	$0, %ebx
	int		$0x80
