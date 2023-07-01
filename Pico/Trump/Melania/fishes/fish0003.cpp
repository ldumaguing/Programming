#include <iostream>


int main(void)
{
	std::cout << "int:      " << sizeof(int) << " bytes\n";         // 4 bytes
	std::cout << "uint:     " << sizeof(uint) << " bytes\n";        // 4 bytes
	std::cout << "uint8_t:  " << sizeof(uint8_t) << " byte\n";      // 1 byte
	std::cout << "uint16_t: " << sizeof(uint16_t) << " bytes\n";    // 2 bytes
	std::cout << "uint32_t: " << sizeof(uint32_t) << " bytes\n";    // 4 bytes
}
