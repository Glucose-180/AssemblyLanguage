# uglynumber.s - List ugly numbers between 1 and 100
# ugly number: a positive integer who doesn't have prime factors except 2, 3, 5
.section .data
ostr:
	.asciz "%4d%c"
endl:
	.asciz "\nCount: %d\n"
.section .text
.globl main
main:
	movl	$0, %ecx	# count
	movl	$1, %edx	# n
l0:
	cmpl	$100, %edx
	jg	L0
# call ugly
	pushl	%edx
	call	ugly
	popl	%edx
	testl	%eax, %eax
	je	l1		# if (ugly(n)==0) jump
# print
	incl	%ecx		# ++count
	pushl	%ecx
	movl	%ecx, %eax
	movb	$10, %bl
	idiv	%bl
	movl	$'\n', %esi
	movl	$' ', %ebx
	testb	%ah, %ah
	cmovz	%esi, %ecx	# if (count%10==0) push '\n'
	cmovnz	%ebx, %ecx	# else push ','
	pushl	%ecx
	pushl	%edx
	pushl	$ostr
	call	printf
	addl	$4, %esp
	popl	%edx		# recover n
	addl	$4, %esp
	popl	%ecx		# recover count
l1:
	incl	%edx
	jmp	l0
L0:
	pushl	%ecx
	pushl	$endl
	call	printf
	addl	$8, %esp
	pushl	$0
	call	exit

.globl ugly
.type ugly, @function
ugly:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx	# get the parameter
l2:
	movl	%edx, %eax
	movb	$2, %bl
	idivb	%bl		# ax/2 -> al ... ah
	testb	%ah, %ah
	jnz	l3		# if (n%2!=0) then jump
	movsbl	%al, %edx	# n = n/2
	jmp	l2
l3:
	movl	%edx, %eax
	movb	$3, %bl
	idivb	%bl		# ax/3 -> al ... ah
	testb	%ah, %ah
	jnz	l5		# if (n%3!=0) then jump
	movsbl	%al, %edx	# n = n/3
	jmp	l3
l5:
	movl	%edx, %eax
	movb	$5, %bl
	idivb	%bl		# ax/5 -> al ... ah
	testb	%ah, %ah
	jnz	lrt		# if (n%5!=0) then jump
	movsbl	%al, %edx	# n = n/5
	jmp	l5
lrt:
	cmpl	$1, %edx
	jne	lr0		# if (%edx!=1) return 0
	movl	$1, %eax	# return 1
	popl	%ebp
	ret
lr0:
	movl	$0, %eax
	popl	%ebp
	ret
