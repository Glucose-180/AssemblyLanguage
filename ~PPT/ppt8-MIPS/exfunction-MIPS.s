	.file	1 "exfunction.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%call16(getchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,getchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sb	$2,27($fp)
	lw	$2,%call16(getchar)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,getchar
1:	jalr	$25
	nop

	lw	$28,16($fp)
	sw	$2,28($fp)
	lb	$2,27($fp)
	lw	$5,28($fp)
	move	$4,$2
	.option	pic0
	jal	ex
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.align	2
	.globl	ex
	.set	nomips16
	.set	nomicromips
	.ent	ex
	.type	ex, @function
ex:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	move	$2,$4
	sw	$5,20($fp)
	sb	$2,16($fp)
	lb	$2,16($fp)
	lw	$3,20($fp)
	addu	$2,$3,$2
	sw	$2,0($fp)
	lw	$3,0($fp)
	lw	$2,20($fp)
	xor	$3,$3,$2
	lw	$2,20($fp)
	nor	$2,$0,$2
	or	$2,$3,$2
	sw	$2,4($fp)
	lw	$2,4($fp)
	subu	$2,$0,$2
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	ex
	.size	ex, .-ex
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0"
