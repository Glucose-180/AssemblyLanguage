.section .text
.globl average
.type average, @function
# double average(int n, float a[]);
average:
	blez	$4, L4		# int n
	nop

	move	$2, $5		# float *a
	sll	$3, $4, 2	# 4*n
	addu	$5, $5, $3	# point to end
	mtc1	$0, $f0		# 0

L3:
	lwc1	$f2, 0($2)	# load a[i]
	add.s	$f0, $f0, $f2	# sum += a[i]
	addiu	$2, $2, 4	# ++i
	bne	$2, $5, L3
	nop

L2:
	cvt.d.s	$f0, $f0	# convert float to double
	mtc1	$4, $f2		# n
	cvt.d.w	$f2, $f2
	div.d	$f0, $f0, $f2	# sum /= n
	jr	$31
	nop

L4:
	mtc1	$0, $f0
	j	L2
	nop
