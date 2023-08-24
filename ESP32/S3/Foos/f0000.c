#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define ILI9341_CS 4
#define ILI9341_CD 5
#define ILI9341_WR 6
#define ILI9341_RD 7

#define ILI9341_D0 8
#define ILI9341_D1 3
#define ILI9341_D2 9
#define ILI9341_D3 10
#define ILI9341_D4 11
#define ILI9341_D5 12
#define ILI9341_D6 13
#define ILI9341_D7 14

void main() {
	printf("control: %x\n",
		(1 << ILI9341_CS) |
		(1 << ILI9341_CD) |
		(1 << ILI9341_WR) |
		(1 << ILI9341_RD)
	);
	printf("datum: %x\n",
		(1 << ILI9341_D0) |
		(1 << ILI9341_D1) |
		(1 << ILI9341_D2) |
		(1 << ILI9341_D3) |
		(1 << ILI9341_D4) |
		(1 << ILI9341_D5) |
		(1 << ILI9341_D6) |
		(1 << ILI9341_D7)
	);
}


