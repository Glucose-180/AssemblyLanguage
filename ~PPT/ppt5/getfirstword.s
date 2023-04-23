# getfirstword.s: get the substring before first space
# space: ' ' and 9~13
.section .bss
	.lcomm inbuff, 81
	.lcomm outbuff, 81
.section .text
.globl _start
_start:
# input
	movl	$3, %eax	# syscall: read
	movl	$0, %ebx	# stdin
	movl	$inbuff, %ecx
	movl	$80, %edx
	int	$0x80

	movl	$inbuff, %ebx
	movl	$outbuff, %ecx
	movl	$0, %edx
l1:
	movsbl	(%ebx), %eax
	cmpl	$' ', %eax
	je	l3
	cmpl	$0, %eax
	je	l3
	cmpl	$9, %eax
	jl	l2
	cmpl	$13, %eax
	jle	l3
l2:
	movb	%al, (%ecx)
	incl	%ebx
	incl	%ecx
	incl	%edx
	jmp	l1
l3:	# space reached
	movb	$'\n', (%ecx)
	incl	%edx
# output
	movl	$4, %eax	# syscall: write
	movl	$1, %ebx	# stdout
	movl	$outbuff, %ecx
	int	$0x80
# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
