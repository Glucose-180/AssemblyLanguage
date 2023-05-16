.section .data
str:
	.rept 10
	.byte 0x0
	.endr
	.byte 13	# Cr
	.byte 10	# Lf
.section .text
.globl __start
__start:
	lui	$a0, %hi(str)
	addiu	$a0, $a0, %lo(str)
	jal	gen_str
	nop

	addiu	$v0, $0, 4004
	addiu	$a0, $0, 1
	lui	$a1, %hi(str)
	addiu	$a1, $a1, %lo(str)
	addiu	$a2, $0, 12
	syscall

	addiu	$v0, $0, 4001
	addiu	$a0, $0, 0
	syscall
