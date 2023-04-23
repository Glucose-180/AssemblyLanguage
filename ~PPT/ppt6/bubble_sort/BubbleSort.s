.section .data
iostring:
	.asciz	"ab1g2hA0H56po9wK78nB"
.section .text
	.globl _start
_start:
	subl $8, %esp
	movl $20, 4(%esp)			# parameter 2
	movl $iostring, (%esp)		# parameter 1
	call bubble_sort

	call as_puts

	call as_exit

	.globl as_puts
	.type as_puts, @function
as_puts:
	push %ebx
	movl $4, %eax
	movl $1, %ebx
/*	
	movl 8(%esp), %ecx
	movl 12(%esp), %edx
*/
	movl $iostring, %ecx
	movl $20, %edx
	int $0x80
	pop %ebx
	ret

	.globl as_exit
	.type as_exit, @function
as_exit:
	movl $1, %eax
	movl $0, %ebx
	int $0x80	

	.globl	bubble_sort
	.type	bubble_sort, @function
bubble_sort:
	pushl	%edi		# j
	pushl	%esi		# i
	pushl	%ebx
	movl	16(%esp), %edx		# char a[]
	movl	20(%esp), %eax		# int n
	leal	-1(%eax), %ecx		# n-1
	testl	%ecx, %ecx
	jle	.L1

	xorl %edi, %edi			# j=0

.L2:
	cmpl %ecx, %edi			# ? j<n-1
	jge .L1

	xorl %esi, %esi			# i=0
.L3:
	movl %ecx, %eax			# n-1
	subl %edi, %eax			# n-1-j 
	cmpl %eax, %esi			# ? i<n-1-j
	jge .L5

	movzbl (%edx, %esi), %ebx		# a[i]
	movzbl 1(%edx, %esi), %eax  	# a[i+1]
	cmpb %al, %bl					# a[i] > a[i+1]
	jle .L4
	
	movb %bl, 1(%edx, %esi)			# swap a[i+1],a[i]
	movb %al, (%edx, %esi)

.L4:
	addl $1, %esi		# i++
	jmp	.L3

.L5:
	addl $1, %edi		# j++
	jmp .L2	

.L1:
	popl	%ebx
	popl	%esi
	popl	%edi
	ret
