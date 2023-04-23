.section .data
stringvar:
	.ascii	"0123456789abcdef\n"
.section .text
.globl _start
_start:
#Finish the code here
	movl	$8, %ecx
	movl	$stringvar, %ebx
	movl	$0, %edx
L0:
	movb	(%ebx, %edx, 2), %al
	xchg	%al, 1(%ebx, %edx, 2)
	xchg	%al, (%ebx, %edx, 2)
	incl	%edx
	loop	L0
#Done
#output
	movl	$4, %eax
	movl	$1, %ebx
	movl	$stringvar, %ecx
	movl	$17, %edx
	int	$0x80
#exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
