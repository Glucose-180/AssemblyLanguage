/* areatest.c - An example of using floating point regs */
#include <stdio.h>

int main()
{
	int rad = 10;
	float area;

	asm(
		"fild	%1\n\t"
		"fimul	%1\n\t"
		"fldpi\n\t"
		"fmul	%%st(1), %%st(0)"
		: "=t"(area)
		: "m"(rad)
		: "%st(1)"
	);

	printf("Area: %f", area);
	return 0;
}
