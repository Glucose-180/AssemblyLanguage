#mov test 4: An example of indirect addressing
.section .data
values:
	.int	10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .text
.globl main
main:
	movl	values, %eax		#move values 10 to %eax
	movl	$values, %edi		#move values's addr to %edi
	movl	$100, 4(%edi)		#use 100 to replace 15
	movl	$1, %edi
	movl	values(, %edi, 4), %ebx		#move 100 to %ebx
	movl	$1, %eax
	int		$0x80
