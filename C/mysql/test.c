#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// ***************************************************************************************
int main(int argc, char* argv[]) {
	printf("%s\n", argv[0]);
	char* loc;
	char buff1[] = "Programming/C/mysql/testx";
	char* buff2 = "test";
	loc = strstr(buff1, buff2);
	printf(".%s\n", loc);
	printf("%d\n", loc-buff1);
	buff1[loc-buff1] = 0;
	printf("%s\n", buff1);
	printf("%s\n", buff2 + 2);
	
	return 0;
}

