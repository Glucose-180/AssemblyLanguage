.section .text
.globl fmax
.type fmax, @function
# float fmax(float x, float y);
fmax:
	c.lt.s	$f12, $f14	# x < y ?
	bc1t	L1
	nop
L0:	# x >= y
	mov.s	$f0, $f12	# from ChatGPT
	j	LR
	nop
L1:	# x < y
	mov.s	$f0, $f12
LR:
	jr	$ra
	nop

.globl __start
__start:
	addiu	$t0, $zero, 251
	mtc1	$t0, $f12
	cvt.s.w	$f12, $f12

	addiu	$t0, $zero, 244
	mtc1	$t0, $f14
	cvt.s.w	$f14, $f14

	jal	fmax
	nop

	cvt.w.s	$f4, $f0
	mfc1	$t0, $f4

# exit
	addiu	$v0, $zero, 4001
	addu	$a0, $zero, $t0
	syscall
