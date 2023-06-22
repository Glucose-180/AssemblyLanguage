.section .data
str:
	.ascii "743691052\n"

.section .text
.globl _start
_start:
	pushl	$9
	pushl	$str
	call	bubblesort
	addl	$8, %esp

	movl	$4, %eax
	movl	$1, %ebx
	movl	$str, %ecx
	movl	$10, %edx
	int	$0x80

	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

# void bubblesort(char *a, unsigned n);
.globl bubblesort
.type bubblesort, @function
bubblesort:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx

	movl	8(%ebp), %edi	# edi points to the first char
	movl	%edi, %ebx
	addl	12(%ebp), %ebx
L3:
	decl	%ebx		# ebx points to the last char
	cmpl	%edi, %ebx
	jbe	L4
	movl	%edi, %eax	# j = 0
L2:
	cmpl	%ebx, %eax	# j < i?
	jae	L0
	movb	(%eax), %cl	# cl is a[j]
	movb	1(%eax), %ch	# ch is a[j+1]
	cmpb	%ch, %cl
	jl	L1
# swap
	movb	%cl, 1(%eax)
	movb	%ch, (%eax)
L1:
	incl	%eax
	jmp	L2
L0:
	jmp	L3
L4:
	popl	%ebx
	popl	%esi
	popl	%edi
	movl	%ebp, %esp
	popl	%ebp
	ret
