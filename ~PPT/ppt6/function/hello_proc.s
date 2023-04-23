#hello_proc.s - An example of using call and ret
.section .rodata
output:
	.ascii "Hello World\n"
.section .text
.globl _start
_start:
	pushl	$12		# arg2
	pushl	$output		# arg1
	call	print_s
	addl	$8, %esp
# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

.type print_s, @function
print_s:
	pushl	%ebp
	movl	%esp, %ebp
	movl	$4, %eax
	movl	$1, %ebx
	movl	8(%ebp), %ecx	# get arg1
	movl	12(%ebp), %edx	# get arg2
	int	$0x80
	leave	# movl %ebp, %esp; popl %ebp;
	ret
