#include <stdio.h>
#include "gfx.h"

void app_main(void) {
	GFX_init();

	// GFX_clearScreen(0xb2f8);
	// GFX_clearScreen(0xf8b2);
	GFX_fillScreen(0);

/*
	GFX_drawPixel(20, 20, 0xFFFF);
	GFX_drawPixel(30, 30, 0xFFFF);
	GFX_drawLine(40, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 40, 40, 50, 0xFFFF);
GFX_drawLine(40, 40, 50, 40, 0xFFFF);
GFX_drawLine(50, 40, 50, 50, 0xFFFF);
GFX_drawLine(40, 50, 50, 50, 0xFFFF);
	GFX_drawRect(30, 30, 60, 60, 0xFFFF);
	GFX_drawCircle(70, 70, 25, 0xFFFF);



GFX_drawPixel(50, 50, 0xFFFF);  // NE
GFX_drawPixel(51, 51, 0xFFFF);
GFX_drawPixel(52, 52, 0xFFFF);

GFX_drawPixel(50, 75, 0x4F8F);  //SE
GFX_drawPixel(51, 76, 0x4F8F);
GFX_drawPixel(52, 77, 0x4F8F);

GFX_drawPixel(25, 75, 0x8F4F);  //SW
GFX_drawPixel(26, 76, 0x8F4F);
GFX_drawPixel(27, 77, 0x8F4F);

GFX_drawPixel(25, 50, 0xF4F8);  //NW
GFX_drawPixel(26, 51, 0xF4F8);
GFX_drawPixel(27, 52, 0xF4F8);


GFX_drawLine(25, 50, 50, 75, 0xA4A4);
GFX_drawLine(25, 75, 50, 50, 0xA4A4);


GFX_drawTriangle(50, 50, 50, 75, 25, 75, 0xFFFF);


GFX_drawRoundRect(5, 5, 200, 200, 10, 0x8f4f);
*/

// GFX_fillCircle(70, 70, 25, 0xFFFF);
// GFX_fillRect(30, 30, 60, 60, 0xFFFF);
// GFX_fillRoundRect(5, 5, 200, 200, 10, 0x8f4f);

GFX_fillTriangle(50, 50, 50, 75, 25, 75, 0xFFFF);





	GFX_refreshScreen();
}

