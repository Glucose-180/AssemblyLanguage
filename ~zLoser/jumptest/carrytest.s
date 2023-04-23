# signtest.s - An example of using the carryout flag and cmc instruction
.section .data
value:
	.int 21, 15, 34, 11, 6, 50, 32, 80, 10, 2
output:
	.asciz "The value is: %d\n"
.section .text
.globl	_start
_start:
	movl	$9, %edi
loop:
	pushl	value(, %edi, 4)
	pushl	$output
	call	printf
	addl	$8, %esp
	subl	$1, %edi
	cmc
	jc	loop		# jump when edi is negative

	movl	$1, %eax
	movl	$0, %ebx	# return 0
	int	$0x80
