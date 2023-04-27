.section .text
.type print_unsigned, @function
.globl print_unsigned
print_unsigned:
	addiu	$sp, $sp, -16
	addiu	$t4, $zero, 10	# divisior
	sw	$a0, 10($sp)	# save arg: x
	addiu	$t2, $sp, 11	# t2 is pointer
	addiu	$t3, $t2, -1	# t3 moves
l0:
	addiu	$t3, $t3, -1
	divu	$a0, $t4
	mfhi	$t0		# x % 10
	mflo	$a0		# x /= 10
	addiu	$t5, $t0, 0x30	# x % 10 + '0'
	sb	$t5, ($t3)
	bne	$zero, $a0, l0
	nop

	addiu	$a0, $zero, 0xa	# '\n'
	sb	$a0, 10($sp)
# output
	addiu	$v0, $zero, 4004
	addiu	$a0, $zero, 1
	addu	$a1, $zero, $t3
	subu	$a2, $t2, $t3
	syscall
	addiu	$sp, $sp, 16
	jr	$ra
	nop
