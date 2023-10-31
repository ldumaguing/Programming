#include <stdio.h>
#include "gfx.h"
#include "ili9341.h"
#include "defines.h"

uint16_t *screen_buffer;
struct ILI9341 *lcd;

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
	printf(">>>>>>>>>>>>>>>>>>> \%d\n", lcd->WIDTH);
}

void GFX_drawPixel(int16_t x, int16_t y, uint16_t color) {
  if (screen_buffer) {
    if ((x < 0) || (y < 0) || (x >= lcd->_width) || (y >= lcd->_height))
      return;

    int16_t t;
    switch (lcd->rotation) {
    case 1:
      t = x;
      x = lcd->WIDTH - 1 - y;
      y = t;
      break;
    case 2:
      x = lcd->WIDTH - 1 - x;
      y = lcd->HEIGHT - 1 - y;
      break;
    case 3:
      t = x;
      x = y;
      y = lcd->HEIGHT - 1 - t;
      break;
    }

    screen_buffer[x + y * lcd->WIDTH] = color;
  }
}
