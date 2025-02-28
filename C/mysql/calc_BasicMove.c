#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc == 1) {
		instructions();
		return 0; }

	int multiplier = 0;
	double multipliers[] = {1, 0.8, 0.6, 0.4, 0.2};
	if (argc == 4) multiplier = atoi(argv[3]);
	int HT = atoi(argv[1]);
	int DX = atoi(argv[2]);
	int x = trunc((HT + DX) / 4.0);
	x *= multipliers[multiplier];
	printf("%d\n", x);
	return 0; }

// ***************************************************************************************
void instructions() {
	puts("calc_BasicMove   HT   DX   [enc]");
	puts("   HT: HT value");
	puts("   DX: DX value");
	puts("   [enc]:");
	puts("      0: None");
	puts("      1: Light");
	puts("      2: Medium");
	puts("      3: Heavy");
	puts("      4: Extra-Heavy");
	puts("");
	puts(""); }
