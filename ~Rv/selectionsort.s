.section .bss
	.lcomm buf, 50

.section .text
.globl _start
_start:
# read
	movl	$3, %eax
	movl	$0, %ebx	# stdin
	movl	$buf, %ecx
	movl	$50, %edx
	int	$0x80

	decl	%eax
	pushl	%eax		# strlen(buf) - 1
	pushl	$buf
	call	selectionsort
	addl	$4, %esp
	popl	%edx
	incl	%edx		# eax := strlen(buf)
# write
	movl	$4, %eax
	movl	$1, %ebx	# stdout
	movl	$buf, %ecx
	int	$0x80
#exit
	movl	$1, %eax
	movl	$0, %ebx
	int	$0x80

# void selectionsort(char *a, unsigned n);
.globl selectionsort
.type selectionsort, @function
selectionsort:
	pushl	%ebx
	pushl	%edi
	movl	12(%esp), %edi	# edi(&a[i]) := a
	movl	%edi, %ebx
	addl	16(%esp), %ebx	# ebx(&a[n]) := a + n
L0:
	cmpl	%ebx, %edi	# i < n ?
	jae	L4
	movb	$127, %dl	# dl(min) := +127
	movl	%edi, %eax	# eax(j) := edi
	movl	%edi, %ecx	# ecx(mj) := edi
L1:
	cmpl	%ebx, %eax	# j < n ?
	jae	L3
	movb	(%eax), %dh	# dh := a[j]
	cmpb	%dl, %dh	# a[j] < min ?
	jge	L2
	movb	%dh, %dl	# min = a[j]
	movl	%eax, %ecx	# mj = j
L2:
	incl	%eax		# ++j
	jmp	L1
L3:
# swap
	movb	(%edi), %dh	# dh := a[i]
	movb	%dl, (%edi)	# a[i] := min
	movb	%dh, (%ecx)	# a[mj] := dh
	incl	%edi		# ++i
	jmp	L0
L4:
	popl	%edi
	popl	%edx
	ret
