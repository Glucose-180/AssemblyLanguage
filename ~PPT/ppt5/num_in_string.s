# num_in_string.s - fund all numbers in a string
.section .data
string:
	.asciz "ab12g2hA0H56po9wK78nB"
.section .rodata
format:
	.asciz "%s\n"
.section .text
.globl	_start
_start:
	movl	$string, %ecx	# p
	movl	$string, %edx	# q
l0:
	movsbl	(%ecx), %ebx	# *p
	#extend: source is reg or ram, targer must be reg
	cmpl	$0, %ebx	# if *p==0 then jump
	jz	l2
	cmpl	$'0', %ebx
	jl	l1
	cmpl	$'9', %ebx
	jg	l1
	movb	(%ecx),	%al
	movb	%al, (%edx)	# *q = *p
	incl	%edx
l1:
	incl	%ecx		# ++p
	jmp	l0
l2:
	movb	$0, (%edx)
# print
	pushl	$string
	pushl	$format
	call	printf
	addl	$8, %esp
	pushl	$0
	call	exit
