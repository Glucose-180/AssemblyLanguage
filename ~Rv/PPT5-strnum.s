.section .bss
	.lcomm ibuf, 101
	.lcomm obuf, 101

.section .text
.globl _start
_start:
# read
	movl	$3, %eax
	movl	$0, %ebx
	movl	$ibuf, %ecx
	movl	$100, %edx
	int	$0x80

	movl	$ibuf, %ebx	# p
	movl	$obuf, %edx	# q
L0:
	movb	(%ebx), %al	# al := *p
	testb	%al, %al
	je	L1
	cmpb	$'0', %al
	jb	L2
	cmpb	$'9', %al
	ja	L2
	movb	%al, (%edx)
	incl	%edx
L2:
# *p < '0' || *p > '9'
	incl	%ebx
	jmp	L0
L1:
# output
	movb	$'\n', (%edx)
	subl	$obuf, %edx
	incl	%edx		# edx := strlen(obuf)
	movl	$4, %eax
	movl	$1, %ebx
	movl	$obuf, %ecx
	int	$0x80

# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
