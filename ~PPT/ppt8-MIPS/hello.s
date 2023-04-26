.section .data
output:
	.ascii "Hello world!\n"
.section .text
.globl __start
__start:
	addiu	$v0, $0, 4004		# syscall#
	addiu	$a0, $0, 1		# arg1
#	la	$a1, output
	lui	$a1, %hi(output)
	addiu	$a1, $a1, %lo(output)
	addiu	$a2, $0, 13
	syscall

	addiu	$v0, $0, 4001		# syscall#
	addiu	$a0, $0, 0		# arg1
	syscall
