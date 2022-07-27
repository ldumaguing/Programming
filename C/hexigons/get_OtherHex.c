#include <stdio.h>
#include <stdlib.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if ((argc == 1)
	| (argc > 4)) {
		instructions();
		return 0; }

	int x0 = atoi(argv[1]);
	int y0 = atoi(argv[2]);
	int d = atoi(argv[3]);

	if (d == 0) {
		printf("%d %d\n", x0, --y0);
		return 0;}
	if (d == 3) {
		printf("%d %d\n", x0, ++y0);
		return 0;}

	int X = d < 3 ? x0 + 1 : x0 - 1;

	if (x0 % 2) {  // X is odd
		if ((d == 2) | (d == 4))
			printf("%d %d\n", X, ++y0);
		else
			printf("%d %d\n", X, y0);
		return 0; }
		
	if ((d == 2) | (d == 4))
		printf("%d %d\n", X, y0);
	else
		printf("%d %d\n", X, --y0);


	return 0;
}

// ***************************************************************************************
void instructions() {
	puts("get_OtherHex   x0   y0   d");
	puts("   x0: reference hex's X location");
	puts("   y0: reference hex's Y location");
	puts("   d:  direction to the other hexagon (0 to 5)");
	puts("   *****");
	puts("   OUTPUT: hexID (aka hex location) of the other hexagon");
	puts("");
	puts("          ___0___");
	puts("         /       \\");
	puts("       5/         \\1");
	puts("       /   x0,y0   \\");
	puts("       \\           /");
	puts("       4\\         /2");
	puts("         \\_______/");
	puts("             3");
}
