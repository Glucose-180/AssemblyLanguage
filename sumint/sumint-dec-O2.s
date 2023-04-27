	.file	"sumint-dec.c"
	.text
	.p2align 4
	.globl	sum
	.def	sum;	.scl	2;	.type	32;	.endef
	.seh_proc	sum
sum:
	.seh_endprologue
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.L1
	.p2align 4,,10
	.p2align 3
.L3:
	addl	%ecx, %eax
	subl	$1, %ecx
	jne	.L3
.L1:
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
