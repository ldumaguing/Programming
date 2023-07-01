#include <iostream>

int main(void)
{
	uint8_t X[3] = {1, 2, 3};
	std::cout << sizeof(X) << "\n";   // 3 bytes

	uint16_t Y[3] = {1, 2, 3};
	std::cout << sizeof(Y) << "\n";   // 6 bytes

	uint32_t Z[3] = {1, 2, 3};
	std::cout << sizeof(Z) << "\n";   // 12 bytes
}
