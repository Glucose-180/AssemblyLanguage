	.file	"complexstruct.c"
	.text
	.globl	test
	.type	test, @function
test:
.LFB0:
	.cfi_startproc
	endbr64
	leaq	0(,%rdi,4), %rax
	leaq	(%rax,%rdi), %rdx
	movq	%rdx, %rax
	addq	8(%rsi,%rdx,8), %rax
	movl	288(%rsi), %edx
	addl	(%rsi), %edx
	movslq	%edx, %rdx
	movq	%rdx, 16(%rsi,%rax,8)
	ret
	.cfi_endproc
.LFE0:
	.size	test, .-test
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
