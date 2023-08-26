#include <stdio.h>

int main() {
	printf("%d\n", (0xab & 1));
	printf("%d\n", (0xab & 2)>>1);
	printf("%d\n", (0xab & 4)>>2);
	printf("%d\n", (0xab & 8)>>3);
	printf("%d\n", (0xab & 16)>>4);
	printf("%d\n", (0xab & 32)>>5);
	printf("%d\n", (0xab & 64)>>6);
	printf("%d\n", (0xab & 128)>>7);
}


