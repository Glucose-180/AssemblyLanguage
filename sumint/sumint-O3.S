	.file	"sumint.c"
	.text
	.p2align 4
	.globl	sum
	.def	sum;	.scl	2;	.type	32;	.endef
	.seh_proc	sum
sum:
	.seh_endprologue
	movl	%ecx, %edx
	testl	%ecx, %ecx
	jle	.L7
	leal	-1(%rcx), %eax
	cmpl	$9, %eax
	jbe	.L8
	movdqa	.LC0(%rip), %xmm1
	movdqa	.LC1(%rip), %xmm3
	shrl	$2, %ecx
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	.p2align 4,,10
	.p2align 3
.L4:
	movdqa	%xmm1, %xmm2
	addl	$1, %eax
	paddd	%xmm3, %xmm1
	paddd	%xmm2, %xmm0
	cmpl	%eax, %ecx
	jne	.L4
	movdqa	%xmm0, %xmm1
	movl	%edx, %ecx
	psrldq	$8, %xmm1
	andl	$-4, %ecx
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	testb	$3, %dl
	je	.L1
.L3:
	leal	1(%rcx), %r8d
	addl	%ecx, %eax
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	2(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	3(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	4(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	5(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	6(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	7(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	leal	8(%rcx), %r8d
	cmpl	%r8d, %edx
	jle	.L1
	addl	%r8d, %eax
	addl	$9, %ecx
	leal	(%rax,%rcx), %r8d
	cmpl	%ecx, %edx
	cmovg	%r8d, %eax
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	ret
.L8:
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	jmp	.L3
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.ident	"GCC: (GNU) 11.2.0"
