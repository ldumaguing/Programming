#include <iostream>
#include <cstddef>
#include <cstring>

int main(void)
{
	uint32_t X[4] = {44, 333, 22, 1111};
	std::cout << sizeof(X) << " bytes\n\n";
	
	char *p;
	p = (char *)X;
	for (int i=0; i<sizeof(X); i++) {
		printf("%x\n", *p);
		p++;
	}
	printf("\n");

}
