#include <stdio.h>

int ex(char a, int b);

int main()
{
	char c;
	int b;

	c = getchar();
	b = getchar();
	return ex(c, b);
}

int ex(char a, int b)
{
	int x, y;

	x = (int)a + b;
	y = x ^ b | ~b;
	return (-y);
}
