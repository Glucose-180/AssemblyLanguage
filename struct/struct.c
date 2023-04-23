struct s1 {
	int *p;
	char c;
};

struct s2 {
	struct s1 s[2];
	char c;
};

int main()
{
	unsigned long long int n;

	n = sizeof(struct s1);
	n = sizeof(struct s2);
	return 0;
}
