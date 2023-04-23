# calltest.s - An example of using CALL instruction
.section .data
output:
	.asciz	"This is section %d\n"
.section .text
.globl main
main:
	pushl	$1
	pushl	$output
	call	printf
	addl	$8, %esp	# clear up stack
	call	overhere
	pushl	$3
	pushl	$output
	call	printf
	addl	$8, %esp	# clear up stack
	pushl	$0
	call	exit

overhere:
	pushl	%ebp
	movl	%esp, %ebp
# normal function code begin
	pushl	$2
	pushl	$output
	call	printf
	addl	$8, %esp	# clear up stack
# end
	movl	%ebp, %esp
	popl	%ebp
	ret
