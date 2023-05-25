/* An example of using registers directly */

int product(int d1, int d2)
{
	int rt;

	asm("imull	%%edx, %%ecx\n\t"
		"movl	%%ecx, %%eax"
		: "=a" (rt)
		: "d" (d1), "c" (d2)
	);

	return rt;
}

int main(int argc)
{
	return product(argc, argc);
}
