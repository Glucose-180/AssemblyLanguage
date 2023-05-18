.section .data
buf:
	.float 1.0, 2.0, 3.0, 4.0, 5.0
rt:
	.double 0.0
.section .text
.globl __start
__start:
	addiu	$a0, $zero, 5
	la	$a1, buf
	jal	average
	nop

	la	$t0, rt
	swc1	$f0, 0($t0)
	swc1	$f1, 4($t0)
#exit
	addiu	$v0, $zero, 4001
	addiu	$a0, $zero, 0
	syscall
