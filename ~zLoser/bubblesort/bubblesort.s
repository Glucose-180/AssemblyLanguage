# bubble sort: an example of XCHG instruction
.section .data
values:
	.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
.section .text
.globl	main
main:
	movl	$values, %esi
	movl	$9, %ecx
	movl	$9, %ebx
l0:
	movl	(%esi), %eax
	cmpl	%eax, 4(%esi)
	jge	skip
	xchg	%eax, 4(%esi)
	movl	%eax, (%esi)
skip:
	addl	$4, %esi
	dec	%ebx
	jnz	l0
	dec	%ecx
	jz	end
	movl	$values, %esi
	movl	%ecx, %ebx
	jmp	l0
end:
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
