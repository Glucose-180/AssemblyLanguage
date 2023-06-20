#include <stdio.h>

/*
 * Test the offset bit of bitbase
 */
int bittest(int bitbase, unsigned offset)
{
	int rt;

	__asm__ volatile
	(
		"xor	%0, %0\n\t"
		"bt 	%2, %1\n\t"
		"setc	%b0"
		:"=&a"(rt)
		:"g"(bitbase), "r"(offset)
	);
	return rt;
}

/*
 * Scan the first '1' of bitbase
 * Direction: from low to high
 */
int bitscanf(int bitbase)
{
	int index;

	__asm__ volatile
	(
		"bsf	%1, %0\n\t"
		"jnz	1f\n\t"
		"mov	$-1, %0\n"
		"1:"
		:"=a"(index)
		:"g"(bitbase)
	);
	return index;
}

/*
 * Scan the first '1' of bitbase
 * Direction: from high to low
 */
int bitscanr(int bitbase)
{
	int index;

	__asm__ volatile
	(
		"bsr	%1, %0\n\t"
		"jnz	1f\n\t"
		"mov	$-1, %0\n"
		"1:"
		:"=a"(index)
		:"g"(bitbase)
	);
	return index;
}

int main()
{
	int bitbase;
	unsigned offset;

	while (scanf("%d%u", &bitbase, &offset) == 2)
	{
		printf("The result of bit test is %d.\n", bittest(bitbase, offset));
		offset = bitscanf(bitbase);
		printf("The result of bit scan forward is %d.\n", offset);
		offset = bitscanr(bitbase);
		printf("The result of bit scan reversely is %d.\n", offset);
	}
	return 0;
}
