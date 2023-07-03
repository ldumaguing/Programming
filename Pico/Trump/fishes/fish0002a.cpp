#include <iostream>
#include <cstdint>

void foo(const uint8_t *x, int count){
	for (int i=0; i<count; i++) {
		std::cout << x[i] << "\n";
	}
};

int main(void)
{
	uint8_t x[3] = {3, 2, 6};
	foo(x, 3);
	std::cout << "****\n";
	foo(  (const uint8_t [3]){4, 5, 7}, 3             );
}
