#include <stdio.h>
#include <string.h>
#include <stdint.h>

#define ILI9341_TFTWIDTH 2  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 3 ///< ILI9341 max TFT height
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

uint16_t screenbuffer[ILI9341_SIZE] = {};

void foo(void *src, size_t len) {
	char *x = (char *)src;
	do {
		printf("%x\n", *x);
		len--;
		x++;
	} while (len > 0);
}

int main() {
	//screenbuffer[3] = 0x3272;
	//memset(screenbuffer, 0x3272, 50);
	screenbuffer[0] = 0x1122;
	screenbuffer[2] = 0x3344;
	screenbuffer[3] = 0xaabb;
	screenbuffer[5] = 0x55cc;
	char *x = (char *)screenbuffer;
	for(int i=0; i<ILI9341_SIZE*2; i++) {
		printf("%x\n", x[i]);
	}
	printf("**************\n");
	for(int i=0; i<ILI9341_SIZE*2; i++) {
		printf("%x\n", *x);
		x++;
	}
	printf("**************\n");
	for(int i=0; i<ILI9341_SIZE; i++) {
		printf("%x\n", screenbuffer[i]);
	}
}


