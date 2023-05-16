	.file	"if_branch.c"
	.text
	.p2align 4
	.globl	if_branch_i
	.def	if_branch_i;	.scl	2;	.type	32;	.endef
	.seh_proc	if_branch_i
if_branch_i:
	.seh_endprologue
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	setg	%al
	ret
	.seh_endproc
	.p2align 4
	.globl	if_branch_c
	.def	if_branch_c;	.scl	2;	.type	32;	.endef
	.seh_proc	if_branch_c
if_branch_c:
	.seh_endprologue
	cmpl	%edx, %ecx
	setg	%al
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
