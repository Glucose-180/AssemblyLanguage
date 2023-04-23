#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
	int gongji, muji, xiaoji;
//	cout << setw(5)  << "公鸡" << setw(5) << "母鸡" << setw(5) << "小鸡" << endl;
	for(gongji=1; gongji<=33; gongji++)
		for(muji=1; muji<=50; muji++)
			for(xiaoji=1; xiaoji<=100; xiaoji++)
				if((gongji+muji+xiaoji == 100) &&
					(gongji*3 + muji*2 +xiaoji/3.0 == 100))
				{
					//cout << setw(5) << gongji << setw(5) << muji << setw(5) << xiaoji << endl;
					printf("%d %d %d\n", gongji, muji,xiaoji);
				}

	return 0;
}
