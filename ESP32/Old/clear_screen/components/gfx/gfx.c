#include <stdio.h>
#include "gfx.h"
#include "ili9341.h"

void func(void)
{

}

void GFX_init(void) {
	ILI9341_init();
}

void GFX_clearScreen(uint16_t color) {
	ILI9341_clearScreen(color);
}

void GFX_refreshScreen(void) {
	ILI9341_render();
}
