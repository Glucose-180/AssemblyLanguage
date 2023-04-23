	.file	"complexstruct.c"
	.text
	.p2align 4
	.globl	test
	.def	test;	.scl	2;	.type	32;	.endef
	.seh_proc	test
test:
	.seh_endprologue
	leaq	(%rcx,%rcx,4), %rax
	addq	8(%rdx,%rax,8), %rax
	movq	%rax, %rcx
	movl	288(%rdx), %eax
	addl	(%rdx), %eax
	cltq
	movq	%rax, 16(%rdx,%rcx,8)
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
