#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void instructions();

// ***************************************************************************************
int main (int argc, char *argv[]) {
	if(argc<3) {
		instructions();
		return 0;
	}

	FILE *fptr;

	if ((fptr = fopen(argv[1],"rb")) == NULL){
		printf("Error! opening file");
		exit(1);
	}




	return 0;
}

void instructions() {
	printf("<file> <pixel width>\n");
}

