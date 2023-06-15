	.file	"memcpy.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	fp
	.data
	.align 16
fp:
	.quad	memcpy_1
	.quad	memcpy_2
	.quad	memcpy_3
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "memcpy_%u: %f s\12\0"
.LC2:
	.ascii "sys memcpy: %f s\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	movl	$67108864, %ecx
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$67108864, %ecx
	call	malloc
	movq	%rax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	call	clock
	movl	%eax, -28(%rbp)
	movl	-4(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	leaq	fp(%rip), %rax
	movq	(%rdx,%rax), %r9
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$67108864, %r8d
	movq	%rax, %rcx
	call	*%r9
	call	clock
	subl	-28(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movsd	-40(%rbp), %xmm0
	movq	-40(%rbp), %rdx
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	addl	$1, -4(%rbp)
.L4:
	cmpl	$2, -4(%rbp)
	jbe	.L5
	call	clock
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$67108864, %r8d
	movq	%rax, %rcx
	call	memcpy
	call	clock
	subl	-28(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	-40(%rbp), %xmm0
	movq	-40(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	memcpy_1
	.def	memcpy_1;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_1
memcpy_1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L8
.L9:
	movq	24(%rbp), %rdx
	leaq	1(%rdx), %rax
	movq	%rax, 24(%rbp)
	movq	16(%rbp), %rax
	leaq	1(%rax), %rcx
	movq	%rcx, 16(%rbp)
	movzbl	(%rdx), %edx
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L8:
	movl	32(%rbp), %eax
	cmpq	%rax, -8(%rbp)
	jb	.L9
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	memcpy_2
	.def	memcpy_2;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_2
memcpy_2:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	leaq	(%rsp), %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movl	%r8d, 48(%rbp)
	movl	48(%rbp), %ecx
	movq	32(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
/APP
 # 56 ".\memcpy.c" 1
	cld
	rep	movsb
 # 0 "" 2
/NO_APP
	nop
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.globl	memcpy_3
	.def	memcpy_3;	.scl	2;	.type	32;	.endef
	.seh_proc	memcpy_3
memcpy_3:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	shrl	$3, 32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L12
.L13:
	movq	16(%rbp), %rax
	movq	24(%rbp), %rdx
	movq	-8(%rbp), %rcx
/APP
 # 72 ".\memcpy.c" 1
	movq	0(%rdx, %rcx, 8), %xmm0
	movq	8(%rdx, %rcx, 8), %xmm1
	movq	16(%rdx, %rcx, 8), %xmm2
	movq	24(%rdx, %rcx, 8), %xmm3
	movq	%xmm0, 0(%rdx, %rcx, 8)
	movq	%xmm1, 8(%rdx, %rcx, 8)
	movq	%xmm2, 16(%rdx, %rcx, 8)
	movq	%xmm3, 24(%rdx, %rcx, 8)
 # 0 "" 2
/NO_APP
	addq	$4, -8(%rbp)
.L12:
	movl	32(%rbp), %eax
	cmpq	%rax, -8(%rbp)
	jb	.L13
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
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
