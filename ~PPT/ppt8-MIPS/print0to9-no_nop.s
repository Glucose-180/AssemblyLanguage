.section .data
buf:
	.rept 10
	.byte 0x0
	.endr
	.byte '\n'
.section .text
.globl __start
__start:
	lui	$t0, %hi(buf)
	addiu	$t0, $t0, %lo(buf)
	addu	$a1, $0, $t0
	addiu	$t1, $0, 0x30		# '0'
L1:
	sb	$t1, 0($t0)
	addiu	$t1, $t1, 1		# '1' to '9'
	sltiu	$t3, $t1, 0x3a		# $t1 < '0'+10 ?
	bgtz	$t3, L1
	addiu	$t0, $t0, 1		# delay slot ?
#output
	addiu	$v0, $0, 4004		# syscall#
	addiu	$a0, $0, 1
	#la	$a1, buf		# see line 11
	addiu	$a2, $0, 11
	syscall
#exit
	addiu	$v0, $0, 4001		# syscall#
	addiu	$a0, $0, 0
	syscall
