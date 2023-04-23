.section .data
iostring:
	.asciz "ab1g2hA0H56po9wK78nB\n"
.section .text
.globl _start
_start:
# finish the code here
/*	C code:
	char *p;
	for (p = str; *p != '\0'; ++p)
		if (*p >= 'a' && *p <= 'z')
			*p += -32;
*/
	movl	$iostring, %ebx	# p = str
ls:
	movb	(%ebx), %al
	test	%al, %al	# *p ? '\0'
	je	ikun		# *p == '\0'
	cmpb	$'a', %al	# *p ? 'a'
	jl	l0		# *p < 'a'
	cmpb	$'z', %al
	jg	l0		# *p > 'z'
	addb	$-32, %al	# *p += -32
	movb	%al, (%ebx)	# write memory (store)
l0:
	incl	%ebx		# ++p
	jmp	ls
ikun:
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
