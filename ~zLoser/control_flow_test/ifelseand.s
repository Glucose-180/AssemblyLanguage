	.file	"ifelseand.c"
	.text
	.section	.rodata
.LC0:
	.string	"The higher value is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$100, -8(%rbp)		# a = 100
	movl	$25, -4(%rbp)		# b = 25
	cmpl	$99, -8(%rbp)		# a ? 99
	jle	.L2			# if a <= 99 then jmp .L2
	cmpl	$24, -4(%rbp)
	jle	.L2			# if b <= 24 then jmp .L2
# then case
	movl	-8(%rbp), %eax		# a -> %eax
	movl	%eax, %esi		# %eax -> %esi
	leaq	.LC0(%rip), %rdi	# %rdi := .LC0 + %rip
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
# else case
.L2:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:					# exit
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
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
