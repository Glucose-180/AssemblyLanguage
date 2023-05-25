# imultesr2.s - An example of detecting an IMUL overflow
.section .text
.globl _start
_start:
	movw	$680, %ax
	movw	$100, %cx
	imulw	%cx		# cx*ax->dx:ax
	jo	over
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
over:
	movl	$1, %eax
	movl	$1, %ebx
	int	$0x80
