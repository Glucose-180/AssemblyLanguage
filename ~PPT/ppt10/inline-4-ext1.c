int inc(int src)
{
	int dst;

	asm("movl	%1, %0\n\t"
		"addl	$1, %0"
		: "=r" (dst)	/* input */
		: "r" (src)		/* output */
	);
	return dst;
}

int main(int argc, char *argv[])
{
	return inc(argc);
}
