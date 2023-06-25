.section .text
.globl _start
_start:
	pushl	$0x11de784a
	call	print_dec
	addl	$4, %esp
# exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

# void print_dec(unsigned x);
.globl print_dec
.type print_dec, @function
print_dec:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	%ebx, -4(%ebp)

	movl	8(%ebp), %eax	# eax := x
	leal	9(%esp), %ecx
	movb	$0, 2(%ecx)
	movb	$'\n', 1(%ecx)
	movl	$10, %ebx
L0:
	xorl	%edx, %edx
	# eax := edx:eax / 10, edx := edx:eax % 10
	div	%ebx
	addb	$'0', %dl
	movb	%dl, (%ecx)
	decl	%ecx
	testl	%eax, %eax
	jg	L0
# output
	movl	$4, %eax
	movl	$1, %ebx
	incl	%ecx
	leal	11(%esp), %edx
	subl	%ecx, %edx
	int	$0x80
	leave
	ret
