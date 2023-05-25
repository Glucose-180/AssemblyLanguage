int main()
{
	int x = 0;

	asm("movl\t$1, %eax\n\tmovl\t$2, %ebx\n\tint\t$0x80");

	return x;
}
