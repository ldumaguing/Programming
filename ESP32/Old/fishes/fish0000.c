#include <stdio.h>

int main() {
	printf("%d\n", (0xa & 1) ? 1:0);
	printf("%d\n", (0xa & 2) ? 1:0);
	printf("%d\n", (0xa & 4) ? 1:0);
	printf("%d\n", (0xa & 8) ? 1:0);
}


