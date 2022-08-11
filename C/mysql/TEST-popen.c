#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
	FILE* fp;
	char path[20];
	fp = popen("ls", "r");
	if (fp == NULL) return 0;

	while (fgets(path, 20, fp) != NULL)
		printf("%s", path);

	pclose(fp);
	return 0;
}
