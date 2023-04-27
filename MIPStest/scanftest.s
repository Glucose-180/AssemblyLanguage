.section .rodata
fmt:
	.asciz "%d"
.section .data
dt:
	.int 0
.section .text
.globl main
main:
	la	$a0, fmt
	la	$a1, dt
	jal	scanf
	nop

	addiu	$v0, $zero, 4001
	addiu	$a0, $zero, 0
	syscall
