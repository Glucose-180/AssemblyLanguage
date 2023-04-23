.section .rodata
fmt:
	.asciz "%s\n"
.globl print_hex
.section .text
.type print_hex, @function
print_hex:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp	# stack frame
	movl	%ebx, 12(%esp)

	movl	8(%ebp), %ecx	# ecx = x
	movl	$'0', 0(%esp)	# buf[0] = '0'
	movl	$'x', 1(%esp)	# buf[1] = 'x'
	movl	$0, 10(%esp)	# buf[10] = '\0'
	leal	9(%esp), %eax	# eax = buf + 9
	leal	2(%esp), %ebx	# ebx = buf + 2
l1:
	movl	%ecx, %edx
	andb	$0xf, %dl	# dl = c = (x & 0xf)
	cmpb	$10, %dl
	jb	l2
	addb	$0x57, %dl
	jmp	l3
l2:
	orb	$0x30, %dl
l3:
	movb	%dl, (%eax)	# buf[9 - i] = c
	decl	%eax
	shrl	$4, %ecx
	cmpl	%ebx, %eax
	jae	l1

	pushl	%esp
	pushl	$fmt
	call	printf

	movl	20(%esp), %ebx	# recover
	leave
	ret
