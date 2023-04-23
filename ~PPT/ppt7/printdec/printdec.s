.section .rodata
fmt:
	.asciz "%s\n"

.section .text
.globl print_dec
.type print_dec, @function
print_dec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	%ebx, 12(%esp)

	movl	8(%ebp), %eax	# eax = x
	leal	11(%esp), %ecx	# ecx = buf + 11
	movb	$0, (%ecx)
	movl	$10, %ebx	# ebx = 10
l0:
	decl	%ecx
	xorl	%edx, %edx	# edx = 0
	div	%ebx		# r = edx, x = eax
	orb	$0x30, %dl
	movb	%dl, (%ecx)
	testl	%eax, %eax
	ja	l0

	pushl	%ecx
	pushl	$fmt
	call	printf

	movl	20(%esp), %ebx
	leave
	ret
