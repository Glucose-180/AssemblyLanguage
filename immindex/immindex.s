.section .data
val:
	.byte 2, 3, 4
.section .text
.globl _start
_start:
	movl	$1, %ebx
	leal	val(, %ebx), %ecx
	leal	val(, 1), %eax

	movl	val(, 1), %eax
	#movl	val(1, %ebx), %eax

	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
