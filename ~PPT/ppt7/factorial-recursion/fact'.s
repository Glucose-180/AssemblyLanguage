.section .text

.globl fact
.type fact, @function
fact:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %eax	# arg: n
	#movl	%eax, -4(%ebp)	# do not save n
	cmpl	$1, %eax
	jg	l2
	movl	$1, %eax
	jmp	l3
l2:
	subl	$1, %eax
	movl	%eax, (%esp)
	call	fact		# recursion
	imull	8(%ebp), %eax	# eax *= n
l3:
	leave
	ret

.globl _start
_start:
	movl	(%esp), %ecx
	pushl	%ecx
	call	fact
	addl	$4, %esp
# exit
	movl	%eax, %ebx
	movl	$1, %eax
	int	$0x80
