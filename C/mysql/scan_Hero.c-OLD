#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void instructions(void);

// ***************************************************************************************
int main(int argc, char* argv[]) {
	if (argc <= 1) {
		instructions();
		return 0; }

	int val = atoi(argv[1]);

	// ********** find mysql command
	FILE* fp;
	char path[32];
	fp = popen("which mysql", "r");
	if (fp == NULL) return 0;

	while (fgets(path, 32, fp) == NULL) {
		printf("can't find mysql");
		return -1; }

	pclose(fp);


	// ********** scan
	char cmd[64];
	sprintf(cmd, "%s", path);
	char stmt[512];
	sprintf(stmt, "select json_detailed(Definition) Hero "
		" from TheWorld where Id = %d", val);
	cmd[strlen(cmd) - 1] = 0;

	char *args[]={cmd
		, "GURPS"
		, "-e"
		, stmt
		, NULL};
	execv(args[0], args);


	return 0;
}

// ***************************************************************************************
void instructions() {
	puts("scan_Hero   Id");
	puts(""); }


