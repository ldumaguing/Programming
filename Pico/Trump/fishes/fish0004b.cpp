#include <iostream>
#include <stdio.h>

void foo(void *p, size_t bytes) {
/*
	int x = *(uint8_t *)p;
	printf("%x\n", x);
*/

/*
	std::cout << bytes << " --\n";
	char *x = (char *)p;
	printf("%x\n", *x);

	x++;
	printf("%x\n", *x);
*/

	size_t count = bytes;
	char *x = (char *)p;

	do {
		printf("%x\n", *x);

		count--;
		x++;
	} while (count > 0);

};

void foo(const uint8_t *x, size_t bytes) {
	std::cout << "other foo" << std::endl;

	size_t count = bytes;

	do {
		printf("%x\n", *x);

		count--;
		x++;
	} while (count > 0);
};

void bar(void *p, size_t bytes) {
	size_t count = bytes;
	char *x = (char *)p;

	do {
		printf("> %x\n", *x);

		count--;
		x++;
	} while (count > 0);
};


int main(void)
{
	uint8_t X[3] = {11, 12, 13};
	uint16_t Y[3] = {11, 12, 13};
	uint32_t Z[3] = {11, 12, 13};

	foo(X, sizeof(X));
	std::cout << std::endl;
	foo(Y, sizeof(Y));
	std::cout << std::endl;
	foo(Z, sizeof(Z));
	std::cout << std::endl;

	foo((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);
	std::cout << std::endl;

	bar(&Z, sizeof(Z));

}
