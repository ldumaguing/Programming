#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>

struct pixel { uint8_t r, g, b; } pix;

void instructions();

void toR5G6B5() {
	// printf("%02x%02x%02x ", pix.r, pix.g, pix.b);
	printf("%02x ", (int)((pix.r/255.0) * 100));
}

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
	int width = atoi(argv[2]);
	printf("%d\n", width);
	uint8_t buf;

	int counter = 0;
	while(fread(&pix, sizeof(struct pixel), 1, fptr)) {
		if(width == 0)
			toR5G6B5();
		else {
			toR5G6B5();
			counter++;
			if(counter>=width) {
				counter = 0;
				printf("\n");
			}
		}
	}


	return 0;
}

void instructions() {
	printf("<file> <pixel width>\n");
}

