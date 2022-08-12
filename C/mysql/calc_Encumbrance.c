#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if (argc <= 2) {
		instructions();
		return 0; }

	int ST = atoi(argv[1]);
	int lbs = atoi(argv[2]);
	printf("%d %d\n", ST, lbs);
/*
	FILE* fp;
	char path[20];
	fp = popen("./calc_BL 33", "r");
	if (fp == NULL) return 0;

	while (fgets(path, 20, fp) != NULL)
		printf("%s", path);

	pclose(fp);
*/


	return 0; }

// ***************************************************************************************
void instructions() {
	puts("calc_Encumbrance   ST   lbs");
	puts("   ST:  ST value");
	puts("   lbs: currently carrying weight");
}
