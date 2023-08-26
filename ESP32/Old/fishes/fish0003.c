#include <stdio.h>
#include <stdint.h>

#define ILI9341_CS  15
#define ILI9341_CD  2
#define ILI9341_WR  4
#define ILI9341_RD  16

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

int main() {
	uint8_t pins[] = {
		ILI9341_CS,
		ILI9341_CD,
		ILI9341_WR,
		ILI9341_RD,

		ILI9341_D0,
		ILI9341_D1,
		ILI9341_D2,
		ILI9341_D3,
		ILI9341_D4,
		ILI9341_D5,
		ILI9341_D6,
		ILI9341_D7
	};

	for(int i=0; i<12; i++) {
		printf("%d\n", (1<<pins[i]));
	}
}


