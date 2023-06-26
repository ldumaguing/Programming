#include <iostream>

void foo(int *x, int count){
	for (int i=0; i<count; i++) {
		std::cout << x[i] << "\n";
	}
};

int main(void)
{
	int x[3] = {3, 2, 6};
	foo(x, 3);
	std::cout << "****\n";
	foo(  (const int [3]){4, 5, 7}, 3             );
}
