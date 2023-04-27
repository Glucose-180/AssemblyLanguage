	.file	"sumconst.c"
	.text
	.p2align 4
	.globl	sum
	.def	sum;	.scl	2;	.type	32;	.endef
	.seh_proc	sum
sum:
	.seh_endprologue
	xorl	%edx, %edx
	leal	(%rcx,%rcx,2), %eax
	testl	%ecx, %ecx
	cmovle	%edx, %eax
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
