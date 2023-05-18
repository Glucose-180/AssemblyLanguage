.section .data
fmt1:
	.asciz "%f%f"
fmt2:
	.asciz "%f\n"
LC1:
	.long 1065353216	# (float)1.0
.section .text
.globl _start
_start:
	subl	$16, %esp
	movl	%esp, %eax
	pushl	%eax	# &y
	addl	$4, %eax
	pushl	%eax	# &x
	pushl	$fmt1
	call	scanf
	addl	$12, %esp
# begin calc z=x*x-2x*y+1.0
	flds	4(%esp)	# x
	flds	(%esp)	# y
	fld	%st(1)	# x
	fmul	%st(2), %st	# x*x
	fld	%st(2)	# x
	fadd	%st(3), %st	# x+x
	fmul	%st(2), %st	# 2*x*y
	fsubrp	%st, %st(1)	# st1 - st -> st1, pop
	fadds	LC1	# st + 1.0 -> z
	fldz
	fxch	%st(2)	# exchange st2 and st0
	fucomi	%st(2), %st	# st=y > 0.0=st(2) ?
	fstp	%st(2)	# st -> st2, pop
	jbe	L7	# if y <= 0, then jump

	fxch	%st(2)
	fdivp	%st, %st(1)	# ???
	faddp	%st, %st(1)
	jmp	L2

L7:
	fstp	%st(1)
	fstp	%st(1)

L2:
	fstpl	4(%esp)
	movl	$fmt2, (%esp)
	call	printf
	addl	$8, %esp
# exit
	pushl	$0
	call	exit

