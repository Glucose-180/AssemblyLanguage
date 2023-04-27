int sum(int n)
{
	int s;

	s = 0;
	while (n > 0)
		s += n--;
	return s;
}
