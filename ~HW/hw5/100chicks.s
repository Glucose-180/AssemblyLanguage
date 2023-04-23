.section .data
ostr:
	.asciz "%2d roosters %2d hens %2d chicks\n"
.section .text
.globl _start
_start:
	movl	$0, %ebx	# rooster
lb:
	cmpl	$33, %ebx
	jg	La
	movl	$0, %ecx	# hens
lc:
	cmpl	$50, %ecx
	jg	Lb
	movl	$0, %edi	# chicks
ld:
	cmpl	$100, %edi
	jg	Lc
	movl	%ebx, %eax
	addl	%ecx, %eax
	addl	%edi, %eax
	cmpl	$100, %eax	# R + H + C == 100 ?
	jne	Ld
	movb	%bl, %al
	movb	$3, %dl
	imulb	%dl		# al * dl -> ax
	movswl	%ax, %esi
	movl	%ecx, %eax
	sall	$1, %eax	# eax <<= 1
	addl	%eax, %esi
	movw	%di, %ax
	movb	$3, %dl
	idivb	%dl		# ax / si -> al
	movsbl	%al, %eax
	addl	%eax, %esi
	cmpl	$100, %esi
	jne	Ld
# save data in stack
# print
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	pushl	$ostr
	call	printf
	addl	$4, %esp
# recover data
	popl	%ebx
	popl	%ecx
	popl	%edi
Ld:
	addl	$3, %edi
	jmp	ld
Lc:
	addl	$1, %ecx
	jmp	lc
Lb:
	addl	$1, %ebx
	jmp	lb
La:
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80
