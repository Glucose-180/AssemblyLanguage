/* An example of using independent function. */
void print_str(char *s, unsigned int len)

asm("print_str:\n\t"
	"pushl	%ebx\n\t"
	"movl	$4, %eax\n\t"
	"movl	$1, %ebx\n\t"
	"movl	8(%esp), %ecx\n\t"
	"movl	12(%esp), %edx\n\t"
	"int	$0x80\n\t"
	"popl	%ebx\n\t"
	"ret"
);

int main()
{
	print_str("Hello world\n", 12);
	return 0;
}
