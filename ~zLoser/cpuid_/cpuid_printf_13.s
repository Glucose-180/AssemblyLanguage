#cpuid2.s View the CPUID using C library calls
.section .data
output:
    .asciz "The processor Vendor ID is '%s'\n"
.section .bss
    .lcomm buffer, 13
.section .text
.globl _start
_start:
    movl $0, %eax
    cpuid
    movl $buffer, %edi
    movl %ebx, (%edi)
    movl %edx, 4(%edi)
    movl %ecx, 8(%edi)
    movb $0, 12(%edi)  # set \0 at the end of buffer
    pushl $buffer
    pushl $output
    call printf
    addl $8, %esp
    pushl $0
    call exit
