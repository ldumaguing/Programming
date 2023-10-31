#include <stdio.h>
#include <string.h>
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

void GFX_fillScreen(uint16_t color) {
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

void GFX_drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {

	if (w < 0) { // Convert negative widths to positive equivalent
		w *= -1;
		x -= w - 1;
		if (x < 0) {
			w += x;
			x = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((y < 0) || (y >= lcd->_height) || (x >= lcd->_width) || ((x + w - 1) < 0)) {
		return;
	}

	if (x < 0) { // Clip left
		w += x;
		x = 0;
	}
	if (x + w >= lcd->_width) { // Clip right
		w = lcd->_width - x;
	}

	if (lcd->rotation == 0) {
		GFX_drawFastRawHLine(x, y, w, color);
	} else if (lcd->rotation == 1) {
		int16_t t = x;
		x = lcd->WIDTH - 1 - y;
		y = t;
		GFX_drawFastRawVLine(x, y, w, color);
	} else if (lcd->rotation == 2) {
		x = lcd->WIDTH - 1 - x;
		y = lcd->HEIGHT - 1 - y;

		x -= w - 1;
		GFX_drawFastRawHLine(x, y, w, color);
	} else if (lcd->rotation == 3) {
		int16_t t = x;
		x = y;
		y = lcd->HEIGHT - 1 - t;
		y -= w - 1;
		GFX_drawFastRawVLine(x, y, w, color);
	}
}

void GFX_drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	if (h < 0) { // Convert negative heights to positive equivalent
		h *= -1;
		y -= h - 1;
		if (y < 0) {
			h += y;
			y = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((x < 0) || (x >= lcd->_width) || (y >= lcd->_height) || ((y + h - 1) < 0)) {
		return;
	}

	if (y < 0) { // Clip top
		h += y;
		y = 0;
	}
	if (y + h > lcd->_height) { // Clip bottom
		h = lcd->_height - y;
	}

	if (lcd->rotation == 0) {
		GFX_drawFastRawVLine(x, y, h, color);
	} else if (lcd->rotation == 1) {
		int16_t t = x;
		x = lcd->WIDTH - 1 - y;
		y = t;
		x -= h - 1;
		GFX_drawFastRawHLine(x, y, h, color);
	} else if (lcd->rotation == 2) {
		x = lcd->WIDTH - 1 - x;
		y = lcd->HEIGHT - 1 - y;

		y -= h - 1;
		GFX_drawFastRawVLine(x, y, h, color);
	} else if (lcd->rotation == 3) {
		int16_t t = x;
		x = y;
		y = lcd->HEIGHT - 1 - t;
		GFX_drawFastRawHLine(x, y, h, color);
	}
}

void GFX_drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
	memset(screen_buffer + y * lcd->WIDTH + x, color, w);
}

void GFX_drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	// uint8_t *buffer_ptr = screen_buffer + y * lcd->WIDTH + x;
	uint16_t *buffer_ptr = screen_buffer + y * lcd->WIDTH + x;
	for (int16_t i = 0; i < h; i++) {
		(*buffer_ptr) = color;
		buffer_ptr += lcd->WIDTH;
	}
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
