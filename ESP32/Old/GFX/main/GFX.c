#include <stdio.h>
#include "gfx.h"

void app_main(void) {
	GFX_init();

	// GFX_clearScreen(0xb2f8);
	// GFX_clearScreen(0xf8b2);
	GFX_fillScreen(0);

	GFX_drawPixel(20, 20, 0xFFFF);
	GFX_drawPixel(30, 30, 0xFFFF);
	GFX_drawLine(40, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 40, 40, 50, 0xFFFF);
GFX_drawLine(40, 40, 50, 40, 0xFFFF);
GFX_drawLine(50, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 50, 50, 50, 0xFFFF);

	GFX_refreshScreen();
}

