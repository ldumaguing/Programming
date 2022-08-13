#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);


// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	if (argc == 3) {
		maxLBS(argv);
		return 0;}




	return 0; }

// ***************************************************************************************
void instructions() {
	puts("wear_Armor   HeroID   ArmorID");
	puts("");
}
