#include <stdio.h>
#include "gfx.h"

void app_main(void) {
	GFX_init();

	// GFX_clearScreen(0xb2f8);
	GFX_clearScreen(0xf8b2);

	GFX_refreshScreen();
}
