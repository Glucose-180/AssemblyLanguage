	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	20(%esp), %eax		# int n
	movl	16(%esp), %edi		# char a[]
	leal	-1(%eax), %esi		# n-1
	testl	%esi, %esi			# ? n-1 == 0
	jle	.L1
	leal	-1(%edi,%eax), %ebx		# %ebx: a+n-1
.L3:
	movl	%edi, %eax			# %eax: a
	testl	%esi, %esi
	jle	.L6
.L5:
	movzbl	(%eax), %edx		# a[i]
	movzbl	1(%eax), %ecx		# a[i+1]
	cmpb	%cl, %dl			# ? a[i] compare with a[i+1]
	jle	.L4
	movb	%cl, (%eax)			# swap
	movb	%dl, 1(%eax)
.L4:
	addl	$1, %eax			# i++
	cmpl	%ebx, %eax			# compare a+i with a+n-1-j
	jne	.L5
.L6:
	subl	$1, %ebx			# 
	subl	$1, %esi
	cmpl	%edi, %ebx
	jne	.L3
.L1:
	popl	%ebx
	popl	%esi
	popl	%edi
	ret

