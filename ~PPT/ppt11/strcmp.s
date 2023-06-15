	.file	"strcmp.c"
	.text
	.globl	s1
	.section	.rodata
.LC0:
	.string	"CaiXukun"
	.section	.data.rel.local,"aw"
	.align 4
	.type	s1, @object
	.size	s1, 4
s1:
	.long	.LC0
	.globl	s2
	.align 4
	.type	s2, @object
	.size	s2, 4
s2:
	.long	.LC0
	.globl	s3
	.section	.rodata
.LC1:
	.string	"Caixukun"
	.section	.data.rel.local
	.align 4
	.type	s3, @object
	.size	s3, 4
s3:
	.long	.LC1
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr32
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	movl	%esp, %ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	s2@GOTOFF(%ebx), %edx
	movl	s1@GOTOFF(%ebx), %eax
	subl	$4, %esp
	pushl	$8
	pushl	%edx
	pushl	%eax
	call	s_cmp
	addl	$16, %esp
	addl	$48, %eax
	subl	$12, %esp
	pushl	%eax
	call	putchar@PLT
	addl	$16, %esp
	movl	s3@GOTOFF(%ebx), %edx
	movl	s2@GOTOFF(%ebx), %eax
	subl	$4, %esp
	pushl	$8
	pushl	%edx
	pushl	%eax
	call	s_cmp
	addl	$16, %esp
	addl	$48, %eax
	subl	$12, %esp
	pushl	%eax
	call	putchar@PLT
	addl	$16, %esp
	subl	$12, %esp
	pushl	$10
	call	putchar@PLT
	addl	$16, %esp
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	s_cmp
	.type	s_cmp, @function
s_cmp:
.LFB1:
	.cfi_startproc
	endbr32
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	subl	$16, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	16(%ebp), %ecx
	movl	%eax, %edi
	movl	%edx, %esi
#APP
# 20 "strcmp.c" 1
	xorl	%eax, %eax
	cld
	repe	cmpsb
	setne	%al
# 0 "" 2
#NO_APP
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$16, %esp
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	s_cmp, .-s_cmp
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB2:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE2:
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB3:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE3:
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 4
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 4
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 4
4:
