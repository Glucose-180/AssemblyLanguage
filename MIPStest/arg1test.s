.section .text
.globl __start
__start:
	move	$t0, $4

	addiu	$v0, $zero, 4001
	addiu	$a0, $zero, 0
	syscall
