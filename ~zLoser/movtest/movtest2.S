#mov test 2: from RAM to reg

.section .data
value:
	.int	0

.section .text
.globl main
main:
	movl	$250, %ecx
	movl	%ecx, value
	movl	$1, %eax
	movl	$0, %ebx
	int		$0x80
