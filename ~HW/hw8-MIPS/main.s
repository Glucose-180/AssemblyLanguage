.section .data
dt:
	.int 0x0fff
.section .text
.globl	__start
__start:
	lw	$a0, dt
	jal	print_unsigned
	nop
# exit
	addiu	$v0, $zero, 4001
	addiu	$a0, $zero, 0
	syscall
