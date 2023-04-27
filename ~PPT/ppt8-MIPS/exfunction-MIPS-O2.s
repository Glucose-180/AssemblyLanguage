	.file	1 "exfunction.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$28,%hi(__gnu_local_gp)
	addiu	$sp,$sp,-32
	addiu	$28,$28,%lo(__gnu_local_gp)
	sw	$16,24($sp)
	lw	$16,%got(stdin)($28)
	lw	$25,%call16(getc)($28)
	sw	$31,28($sp)
	.cprestore	16
	.reloc	1f,R_MIPS_JALR,getc
1:	jalr	$25
	lw	$4,0($16)

	lw	$28,16($sp)
	lw	$4,0($16)
	move	$16,$2
	lw	$25,%call16(getc)($28)
	.reloc	1f,R_MIPS_JALR,getc
1:	jalr	$25
	seb	$16,$16

	addu	$16,$16,$2
	lw	$31,28($sp)
	nor	$3,$0,$2
	xor	$2,$16,$2
	lw	$16,24($sp)
	or	$2,$2,$3
	subu	$2,$0,$2
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.text
	.align	2
	.globl	ex
	.set	nomips16
	.set	nomicromips
	.ent	ex
	.type	ex, @function
ex:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addu	$4,$4,$5
	nor	$3,$0,$5
	xor	$2,$4,$5
	or	$2,$2,$3
	jr	$31
	subu	$2,$0,$2

	.set	macro
	.set	reorder
	.end	ex
	.size	ex, .-ex
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
