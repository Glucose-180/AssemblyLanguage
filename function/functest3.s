# functest3.s - An example of using C style function
.section .data
precision:
	.byte 0x7f, 0x00
output:
	.asciz "The area is %f\n"
.section .bss
	.lcomm result, 4
.section .text
.globl _start
_start:
	finit
	fldcw	precision

	pushl	$10
	call	area
	addl	$4, %esp
	movl	%eax, result
	pushl	%eax
	pushl	$output
	call	printf
	addl	$8, %esp

	pushl	$2
	call	area
	addl	$4, %esp
	movl	%eax, result
	pushl	%eax
	pushl	$output
	call	printf
	addl	$8, %esp

	pushl	$120
	call	area
	addl	$4, %esp
	movl	%eax, result
	pushl	%eax
	pushl	$output
	call	printf
	addl	$8, %esp

	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

.type area, @function
area:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	fldpi
	filds	8(%ebp)		# filds: load integer
	fmul	%st(0), %st(0)
	fmulp	%st(0), %st(1)
	fstps	-4(%ebp)
	movl	-4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
