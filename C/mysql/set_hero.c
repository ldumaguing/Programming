#include <stdio.h>
#include <stdlib.h>
#include <mysql.h>

void instructions(void);

// ***************************************************************************************
int main (int argc, char* argv[]) {
	if ((argc == 1)
	| (argc > 3)) {
		instructions();
		return 0; }

	printf("reading %s\n", argv[1]);
	char buffer[256];
	FILE *fp = fopen(argv[1], "r");
	if (fp == NULL) {
		instructions();
		fclose(fp);
		return 0; }

	while (fgets(buffer, 256, fp) != NULL) {
		printf("%s", buffer);
		}



	fclose(fp);
	return 0;}

// ***************************************************************************************
void instructions() {
	puts("set_hero   file.conf   Id");
	puts("");
}
