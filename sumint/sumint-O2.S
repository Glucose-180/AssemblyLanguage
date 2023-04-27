	.file	"sumint.c"
	.text
	.p2align 4
	.globl	sum
	.def	sum;	.scl	2;	.type	32;	.endef
	.seh_proc	sum
sum:
	.seh_endprologue
	testl	%ecx, %ecx
	jle	.L4
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L3:
	addl	%eax, %r8d
	addl	$1, %eax
	cmpl	%eax, %ecx
	jne	.L3
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
