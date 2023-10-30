#include <stdio.h>
#include "gfx.h"
#include "ili9341.h"
// #include "../ili9341/include/defines.h"
#include "defines.h"


uint16_t *screen_buffer;
struct ILI9341 lcd;



void GFX_init(void) {
	ILI9341_init();
	screen_buffer = ILI9341_get_screenbuffer();
	lcd = ILI9341_get_ili();
}

void GFX_clearScreen(uint16_t color) {
	int i = 0;
	while (i < ILI9341_SIZE) {
		screen_buffer[i] = color;
		i++;
	}
}

void GFX_refreshScreen(void) {
	ILI9341_render();
	printf(">>>>>>>>>>>>>>>>>>> \%d\n", lcd.WIDTH);
}
