	.file	"memcpy.c"
	.text
	.p2align 4
	.globl	memcpy_1
	.type	memcpy_1, @function
memcpy_1:
.LFB51:
	.cfi_startproc
	endbr64
	movl	%edx, %edx
	testq	%rdx, %rdx
	je	.L1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	(%rsi,%rax), %ecx
	movb	%cl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE51:
	.size	memcpy_1, .-memcpy_1
	.p2align 4
	.globl	memcpy_2
	.type	memcpy_2, @function
memcpy_2:
.LFB52:
	.cfi_startproc
	endbr64
	movl	%edx, %ecx
#APP
# 56 "memcpy.c" 1
	cld
	rep	movsb
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE52:
	.size	memcpy_2, .-memcpy_2
	.p2align 4
	.globl	memcpy_3
	.type	memcpy_3, @function
memcpy_3:
.LFB53:
	.cfi_startproc
	endbr64
	shrl	$3, %edx
	movl	%edx, %ecx
	je	.L10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
#APP
# 72 "memcpy.c" 1
	movq	0(%rsi, %rax, 8), %xmm0
	movq	8(%rsi, %rax, 8), %xmm1
	movq	16(%rsi, %rax, 8), %xmm2
	movq	24(%rsi, %rax, 8), %xmm3
	movq	%xmm0, 0(%rsi, %rax, 8)
	movq	%xmm1, 8(%rsi, %rax, 8)
	movq	%xmm2, 16(%rsi, %rax, 8)
	movq	%xmm3, 24(%rsi, %rax, 8)
# 0 "" 2
#NO_APP
	addq	$4, %rax
	cmpq	%rcx, %rax
	jb	.L12
.L10:
	ret
	.cfi_endproc
.LFE53:
	.size	memcpy_3, .-memcpy_3
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"memcpy_%u: %f s\n"
.LC2:
	.string	"sys memcpy: %f s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$67108864, %edi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	-8+fp(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC1(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$1, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	malloc@PLT
	movl	$67108864, %edi
	movq	%rax, %rbp
	call	malloc@PLT
	movq	%rax, %r12
.L18:
	call	clock@PLT
	movl	$67108864, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movq	%rax, %r15
	call	*(%r14,%rbx,8)
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	%ebx, %edx
	movq	%r13, %rsi
	subq	%r15, %rax
	movl	$1, %edi
	addq	$1, %rbx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	call	__printf_chk@PLT
	cmpq	$4, %rbx
	jne	.L18
	call	clock@PLT
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$67108864, %edx
	movq	%rax, %rbx
	call	memcpy@PLT
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC2(%rip), %rsi
	subq	%rbx, %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	main, .-main
	.globl	fp
	.section	.data.rel.local,"aw"
	.align 16
	.type	fp, @object
	.size	fp, 24
fp:
	.quad	memcpy_1
	.quad	memcpy_2
	.quad	memcpy_3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1093567616
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
