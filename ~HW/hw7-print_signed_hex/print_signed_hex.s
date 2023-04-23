.section .rodata
fmt:
	.asciz "%s\n"

.section .text
.globl print_signed_hex
.type print_signed_hex, @function
print_signed_hex:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	%ebx, 12(%esp)

	movl	8(%ebp), %ecx	# ecx = x
	movl	$'+', (%esp)	# sign flag
	testl	%ecx, %ecx
	jge	l0		# if (x >= 0) ...
	negl	%ecx		# ecx = -ecx
	movb	$'-', (%esp)
l0:
	leal	10(%esp), %eax
	movb	$0, 1(%eax)
l1:
	movl	%ecx, %edx
	andb	$0xf, %dl
	movb	$'0', %dh
	cmpb	$10, %dl
	jl	l2
	movb	$0x57, %dh
l2:
	addb	%dh, %dl
	movb	%dl, (%eax)
	decl	%eax
	shr	$4, %ecx
	jnz	l1

	decl	%eax
	movb	$'0', (%eax)
	movb	$'x', 1(%eax)
	cmpb	$'-', (%esp)
	jne	l3
	decl	%eax
	movb	$'-', (%eax)
l3:
	pushl	%eax
	pushl	$fmt
	call	printf

	movl	20(%esp), %ebx
	leave
	ret
