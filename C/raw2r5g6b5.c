/*
* Use GIMP and export it as RAW.  This program will convert the file
* to the ILI9341 color format R5G6B5.
*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>

struct pixel { uint8_t r, g, b; } pix;

void instructions();

void toR5G6B5() {
	uint16_t dot = 0;
	// printf("%02x%02x%02x ", pix.r, pix.g, pix.b);
	//printf("%02x.", (int)((pix.r/255.0)*31));
	//printf("%02x.", (int)((pix.g/255.0)*63));
	//printf("%02x ", (int)((pix.b/255.0)*31));
	dot |= ((int)((pix.r/255.0)*31) << 11);
	dot |= ((int)((pix.g/255.0)*63) << 5);
	dot |= ((int)((pix.b/255.0)*31) << 0);
	printf("%04x, ", dot);
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

