/* An example of using identifiers */

int product(int d1, int d2)
{
	asm
	(
		"imull	%[data1], %[data2]"
		:[data2] "+r" (d2)
		:[data1] "r" (d1)
	);

	return d2;
}

int main(int argc)
{
	return product(argc, argc);
}
