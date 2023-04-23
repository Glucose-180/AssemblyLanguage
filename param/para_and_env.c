/* List command line parameters and environment variables */
#include <stdio.h>

int main(int argc, char *argv[])
{
	int i;

	for (i = 0; argv[i] != NULL; ++i)
		printf("arg%d: %s\n", i, argv[i]);
	argv += i + 1;
	for (i = 0; argv[i] != NULL; ++i)
		printf("env%d: %s\n", i, argv[i]);
	return 0;
}
