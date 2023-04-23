.section .data
data:
	.byte 'A', '0', 'z', 'P', '8', 'r', 'Z', '2', 'f', 'H'
nl:
	.byte '\n'
.section .text
.globl _start
_start:
	pushl	$10
	pushl	$data
	call	insert_sort
# print
	call	as_puts
	addl	$8, %esp

	pushl	$1
	pushl	$nl
	call	as_puts		# '\n'
	addl	$8, %esp
# exit
	pushl	$0
	call	as_exit

.globl insert_sort
	.type insert_sort, @function
insert_sort:
	pushl	%ebp
	movl	%esp, %ebp
# save 3 regs
	pushl	%edi
	pushl	%esi
	pushl	%ebx

	movl	8(%ebp), %eax		# arg1: a
	movl	12(%ebp), %ebx		# arg2: n
	movl	$1, %esi		# i=1
li:
	cmpl	%ebx, %esi
	jge	le			# if i>=n then jump
	movb	(%eax, %esi, 1), %cl	# tmp=a[i]
	leal	-1(%esi), %edi		# j=i-1
lj:
	cmpl	$0, %edi
	jl	l1
	cmpb	%cl, (%eax, %edi, 1)
	jle	l1			# if a[j]<=tmp then jump
	movb	(%eax, %edi, 1), %dl
	movb	%dl, 1(%eax, %edi, 1)	# a[j+1] = a[j]
	decl	%edi
	jmp	lj
l1:
	movb	%cl, 1(%eax, %edi, 1)	# a[j+1] = tmp
	incl	%esi
	jmp	li
le:
# recover regs
	popl	%ebx
	popl	%esi
	popl	%edi

	leave
	ret

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
