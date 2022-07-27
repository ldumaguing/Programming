#include <stdio.h>
#include <stdlib.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if ((argc == 1)
	| (argc > 4)) {
		instructions();
		return 0; }

	int x = atoi(argv[1]);
	int y = atoi(argv[2]);
	char c = argv[3][0];

	if (x % 2) {  // x is odd
		switch(c) {
			case 'A':
				printf("%d %d D\n", --x, y);
				break;
			case 'B':
				printf("%d %d E\n", ++x, y);
				break;
			case 'C':
				printf("%d %d F\n", ++x, ++y);
				break;
			case 'D':
				printf("%d %d D\n", --x, ++y);
				break;
			case 'E':
				printf("%d %d B\n", --x, ++y);
				break;
			default:
				printf("%d %d C\n", --x, y); }

		return 0; }


	if (c == 'D') {
		printf("%d %d A\n", x, ++y);
		return 0; }

	printf("%d %d %c\n", x, y, c);


	return 0;
}

// ***************************************************************************************
void instructions() {
	puts("get_HexSpineID   x   y   s");
	puts("   x: reference hex's X location");
	puts("   y: reference hex's Y location");
	puts("   s:  direction to the other hexagon (A to F)");
	puts("   *****");
	puts("   OUTPUT: output real spineID (x y SpineLetter)");
	puts("");
	puts("   as seen:    ___A___");
	puts("              /       \\");
	puts("            F/         \\B");
	puts("            /    x,y    \\");
	puts("            \\           /");
	puts("            E\\         /C");
	puts("              \\_______/");
	puts("                  D");
	puts("");
	puts("");
	puts("   actual:     ___A___");
	puts("              /       \\");
	puts("             F         B");
	puts("            /    x,y    \\___D___");
	puts("            \\           /");
	puts("             E         C");
	puts("              \\       /");
	puts("");
	puts("");
}
