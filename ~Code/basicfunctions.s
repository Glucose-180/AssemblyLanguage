# int as_puts(char *s, int n);
.globl as_puts
	.type as_puts, @function
as_puts:
	pushl	%ebx
	movl	$4, %eax
	movl	$1, %ebx
	movl	8(%esp), %ecx
	movl	12(%esp), %edx
	int	$0x80
	popl	%ebx
	ret

# void as_exit(int n);
.globl as_exit
	.type as_exit, @function
as_exit:
	movl	4(%esp), %ebx
	movl	$1, %eax
	int	$0x80
	ret
