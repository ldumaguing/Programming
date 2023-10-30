#include <stdio.h>
#include "gfx.h"

void app_main(void) {
	GFX_init();
	for (int i=0; i<7000; i++) {
		GFX_clearScreen(i);
		GFX_refreshScreen();
	}
}

