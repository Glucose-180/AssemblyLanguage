.section .data
iostring:
	.asciz "ab1g2hA0H56po9wK78nB\n"
.section .text
.globl _start
_start:
# finish the code here

#output
	movl	$4, %eax
	movl	$1, %ebx
	movl	$iostring, %ecx
	movl	$21, %edx
	int	$0x80
#exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
