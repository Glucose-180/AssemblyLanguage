.section .data
stringvar:
	.ascii	"0123456789abcdef\n"
.section .text
.globl _start
_start:
#TODO: finish the code here

#output
	movl	$4, %eax
	movl	$1, %ebx
	movl	$stringvar, %ecx
	movl	$17, %edx
	int	$0x80
#exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
