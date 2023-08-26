#include <stdio.h>
#include <stdint.h>

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

int main() {
	uint32_t color = 0;
	char data = 32;

	color |= (data & 1)<<ILI9341_D0;
	color |= (data & 2)<<(ILI9341_D1-1);
	color |= (data & 4)<<(ILI9341_D2-2);
	color |= (data & 8)<<(ILI9341_D3-3);
	color |= (data & 16)<<(ILI9341_D4-4);
	color |= (data & 32)<<(ILI9341_D5-5);
	color |= (data & 64)<<(ILI9341_D6-6);
	color |= (data & 128)<<(ILI9341_D7-7);

	printf("%d\n", (color & (1<<0)) ? 1:0);
	printf("%d\n", (color & (1<<1)) ? 1:0);
	printf("%d\n", (color & (1<<2)) ? 1:0);
	printf("%d\n", (color & (1<<3)) ? 1:0);
	printf("%d\n", (color & (1<<4)) ? 1:0);
	printf("1.%d\n", (color & (1<<5)) ? 1:0);
	printf("%d\n", (color & (1<<6)) ? 1:0);
	printf("%d\n", (color & (1<<7)) ? 1:0);
	printf("%d\n", (color & (1<<8)) ? 1:0);
	printf("%d\n", (color & (1<<9)) ? 1:0);
	printf("%d\n", (color & (1<<10)) ? 1:0);
	printf("%d\n", (color & (1<<11)) ? 1:0);
	printf("%d\n", (color & (1<<12)) ? 1:0);
	printf("%d\n", (color & (1<<13)) ? 1:0);
	printf("%d\n", (color & (1<<14)) ? 1:0);
	printf("%d\n", (color & (1<<15)) ? 1:0);
	printf("%d\n", (color & (1<<16)) ? 1:0);
	printf("0.%d\n", (color & (1<<17)) ? 1:0);
	printf("2.%d\n", (color & (1<<18)) ? 1:0);
	printf("3.%d\n", (color & (1<<19)) ? 1:0);
	printf("%d\n", (color & (1<<20)) ? 1:0);
	printf("4.%d\n", (color & (1<<21)) ? 1:0);
	printf("5.%d\n", (color & (1<<22)) ? 1:0);
	printf("6.%d\n", (color & (1<<23)) ? 1:0);
	printf("%d\n", (color & (1<<24)) ? 1:0);
	printf("7.%d\n", (color & (1<<25)) ? 1:0);
	printf("%d\n", (color & (1<<26)) ? 1:0);
	printf("%d\n", (color & (1<<27)) ? 1:0);
	printf("%d\n", (color & (1<<28)) ? 1:0);
	printf("%d\n", (color & (1<<29)) ? 1:0);
	printf("%d\n", (color & (1<<30)) ? 1:0);
	printf("%d\n", (color & (1<<31)) ? 1:0);
}


