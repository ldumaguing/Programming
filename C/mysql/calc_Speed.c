#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc != 3) {
		instructions();
		return 0; }

	int HT = atoi(argv[1]);
	int DX = atoi(argv[2]);
	printf("%.2f\n", (HT + DX) / 4.0);
	return 0; }

// ***************************************************************************************
void instructions() {
	puts("calc_Speed   HT   DX");
	puts("   HT: HT value");
	puts("   DX: DX value"); }
