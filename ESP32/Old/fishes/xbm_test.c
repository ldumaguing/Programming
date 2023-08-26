#define width15 15
#define height15 16
static unsigned char bits15[] = {
   0x01, 0x40,
   0x00, 0x20,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x08,
   0x04, 0x10,
   0x02, 0x20,
   0x01, 0x40 };

#define width16 16
#define height16 16
static unsigned char bits16[] = {
   0x01, 0x80,
   0x00, 0x40,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x00,
   0x00, 0x10,
   0x04, 0x20,
   0x02, 0x40,
   0x01, 0x80 };

#define width17 17
#define height17 16
static unsigned char bits17[] = {
   0x01, 0x00, 0x01,
   0x00, 0x80, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x00, 0x00,
   0x00, 0x20, 0x00,
   0x04, 0x40, 0x00,
   0x02, 0x80, 0x00,
   0x01, 0x00, 0x01 };

#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

void main() {
/*
	int numBytes = ceil(width17 / 8.0);
	printf("%d bytes\n", numBytes);

	int counter = 0;
	int counter2 = 0;
	for(int i=0; i<height17; i++) {
		for(int j=0; j<numBytes; j++) {
			for(int k=0; k<8; k++) {
				if(counter2>=width17) continue;
				printf("%c", 
					(bits17[counter] & (1 << k)) ? 'X': '.'
				);
				counter2++;
			}
			counter++;
		}
		counter2 = 0;
		printf("\n");
	}


	int numBytes = ceil(width15 / 8.0);
	printf("%d bytes\n", numBytes);

	int counter = 0;
	int counter2 = 0;
	for(int i=0; i<height15; i++) {
		for(int j=0; j<numBytes; j++) {
			for(int k=0; k<8; k++) {
				if(counter2>=width15) continue;
				printf("%c", 
					(bits15[counter] & (1 << k)) ? 'X': '.'
				);
				counter2++;
			}
			counter++;
		}
		counter2 = 0;
		printf("\n");
	}
*/

	int numBytes = ceil(width16 / 8.0);
	printf("%d bytes\n", numBytes);

	int counter = 0;
	int counter2 = 0;
	for(int i=0; i<height16; i++) {
		for(int j=0; j<numBytes; j++) {
			for(int k=0; k<8; k++) {
				if(counter2>=width16) continue;
				printf("%c", 
					(bits16[counter] & (1 << k)) ? 'X': '.'
				);
				counter2++;
			}
			counter++;
		}
		counter2 = 0;
		printf("\n");
	}
}

