.section .text
# void gen_str(char *str);
.type gen_str, @function
.globl gen_str
gen_str:
	addu	$t0, $0, $a0	# arg: char *str
	addiu	$t1, $0, 0x30	# '0'
.L1:
	sb	$t1, 0($t0)	# t0: pointer
	addiu	$t1, $t1, 1	# t1: char
	addiu	$t0, $t0, 1
	sltiu	$t2, $t1, 0x3a
	bne	$t2, $0, .L1
	nop

	jr	$ra
	nop
