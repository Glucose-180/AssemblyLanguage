	.file	"memcpy.c"
	.text
	.p2align 4
	.globl	memcpy_1
	.def	memcpy_1;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_1
memcpy_1:
	.seh_endprologue
	movl	%r8d, %r8d
	testq	%r8, %r8
	je	.L1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	(%rdx,%rax), %r9d
	movb	%r9b, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%r8, %rax
	jne	.L3
.L1:
	ret
	.seh_endproc
	.p2align 4
	.globl	memcpy_2
	.def	memcpy_2;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_2
memcpy_2:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	.seh_endprologue
	movq	%rcx, %r9
	movq	%rdx, %rsi
	movl	%r8d, %ecx
	movq	%r9, %rdi
/APP
 # 56 ".\memcpy.c" 1
	cld
	rep	movsb
 # 0 "" 2
/NO_APP
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4
	.globl	memcpy_3
	.def	memcpy_3;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_3
memcpy_3:
	.seh_endprologue
	shrl	$3, %r8d
	movl	%r8d, %r9d
	je	.L10
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L12:
/APP
 # 72 ".\memcpy.c" 1
	movq	0(%rdx, %rax, 8), %xmm0
	movq	8(%rdx, %rax, 8), %xmm1
	movq	16(%rdx, %rax, 8), %xmm2
	movq	24(%rdx, %rax, 8), %xmm3
	movq	%xmm0, 0(%rdx, %rax, 8)
	movq	%xmm1, 8(%rdx, %rax, 8)
	movq	%xmm2, 16(%rdx, %rax, 8)
	movq	%xmm3, 24(%rdx, %rax, 8)
 # 0 "" 2
/NO_APP
	addq	$4, %rax
	cmpq	%r9, %rax
	jb	.L12
.L10:
	ret
	.seh_endproc
	.p2align 4
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	88(%rsp), %rbx
	movq	%rdx, 88(%rsp)
	movq	%rcx, %r12
	movl	$1, %ecx
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	movq	%rbx, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	movq	%r12, %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "memcpy_%u: %f s\12\0"
.LC2:
	.ascii "sys memcpy: %f s\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	.seh_endprologue
	movl	$1, %ebx
	leaq	-8+fp(%rip), %rdi
	leaq	.LC1(%rip), %rsi
	call	__main
	movl	$67108864, %ecx
	call	malloc
	movl	$67108864, %ecx
	movq	%rax, %r12
	call	malloc
	movsd	.LC0(%rip), %xmm6
	movq	%rax, %r13
.L19:
	call	clock
	movl	$67108864, %r8d
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	%eax, %ebp
	call	*(%rdi,%rbx,8)
	call	clock
	pxor	%xmm2, %xmm2
	movl	%ebx, %edx
	movq	%rsi, %rcx
	subl	%ebp, %eax
	addq	$1, %rbx
	cvtsi2sdl	%eax, %xmm2
	divsd	%xmm6, %xmm2
	movq	%xmm2, %r8
	call	printf
	cmpq	$4, %rbx
	jne	.L19
	call	clock
	movl	$67108864, %r8d
	movq	%r13, %rdx
	movq	%r12, %rcx
	movl	%eax, %ebx
	call	memcpy
	call	clock
	pxor	%xmm1, %xmm1
	leaq	.LC2(%rip), %rcx
	subl	%ebx, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	%xmm6, %xmm1
	movq	%xmm1, %rdx
	call	printf
	nop
	movaps	32(%rsp), %xmm6
	xorl	%eax, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.globl	fp
	.data
	.align 16
fp:
	.quad	memcpy_1
	.quad	memcpy_2
	.quad	memcpy_3
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
