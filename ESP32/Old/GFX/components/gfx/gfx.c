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

void GFX_fillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color) {

	int16_t a, b, y, last;

	// Sort coordinates by Y order (y2 >= y1 >= y0)
	if (y0 > y1) {
		_swap_int16_t(y0, y1);
		_swap_int16_t(x0, x1);
	}
	if (y1 > y2) {
		_swap_int16_t(y2, y1);
		_swap_int16_t(x2, x1);
	}
	if (y0 > y1) {
		_swap_int16_t(y0, y1);
		_swap_int16_t(x0, x1);
	}

	if (y0 == y2) { // Handle awkward all-on-same-line case as its own thing
		a = b = x0;
		if (x1 < a)
			a = x1;
		else if (x1 > b)
			b = x1;
		if (x2 < a)
			a = x2;
		else if (x2 > b)
			b = x2;
			 GFX_drawFastHLine(a, y0, b - a + 1, color);
		return;
	}

	int16_t dx01 = x1 - x0, dy01 = y1 - y0, dx02 = x2 - x0, dy02 = y2 - y0,
		dx12 = x2 - x1, dy12 = y2 - y1;
	int32_t sa = 0, sb = 0;

	// For upper part of triangle, find scanline crossings for segments
	// 0-1 and 0-2.  If y1=y2 (flat-bottomed triangle), the scanline y1
	// is included here (and second loop will be skipped, avoiding a /0
	// error there), otherwise scanline y1 is skipped here and handled
	// in the second loop...which also avoids a /0 error here if y0=y1
	// (flat-topped triangle).
	if (y1 == y2) last = y1; // Include y1 scanline
	else last = y1 - 1; // Skip it

	for (y = y0; y <= last; y++) {
		a = x0 + sa / dy01;
		b = x0 + sb / dy02;
		sa += dx01;
		sb += dx02;
		/* longhand:
		a = x0 + (x1 - x0) * (y - y0) / (y1 - y0);
		b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
		*/
		if (a > b) _swap_int16_t(a, b);
		 GFX_drawFastHLine(a, y, b - a + 1, color);
	}

	// For lower part of triangle, find scanline crossings for segments
	// 0-2 and 1-2.  This loop is skipped if y1=y2.
	sa = (int32_t)dx12 * (y - y1);
	sb = (int32_t)dx02 * (y - y0);
	for (; y <= y2; y++) {
		a = x1 + sa / dy12;
		b = x0 + sb / dy02;
		sa += dx12;
		sb += dx02;
		/* longhand:
		a = x1 + (x2 - x1) * (y - y1) / (y2 - y1);
		b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
		*/
		if (a > b) _swap_int16_t(a, b);
		 GFX_drawFastHLine(a, y, b - a + 1, color);
	}
}

void GFX_fillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color) {
	int16_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
	if (r > max_radius)
		r = max_radius;
	// smarter version
	GFX_fillRect(x + r, y, w - 2 * r, h, color);
	// GFX_ four corners
	GFX_fillCircleHelper(x + w - r - 1, y + r, r, 1, h - 2 * r - 1, color);
	GFX_fillCircleHelper(x + r, y + r, r, 2, h - 2 * r - 1, color);
}

void GFX_fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
	for (int16_t i = x; i < x + w; i++) {
		 GFX_drawFastVLine(i, y, h, color);
	}
}

void GFX_fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color) {
	GFX_drawFastVLine(x0, y0 - r, 2 * r + 1, color);
	GFX_fillCircleHelper(x0, y0, r, 3, 0, color);
}

void GFX_fillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t corners, int16_t delta,
	uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;
	int16_t px = x;
	int16_t py = y;

	delta++; // Avoid GFX_some +1's in the loop

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		// These checks avoid GFX_double-drawing certain lines, important
		// for the SSD1306 library which has an INVERT GFX_ing mode.
		if (x < (y + 1)) {
			if (corners & 1) GFX_drawFastVLine(x0 + x, y0 - y, 2 * y + delta, color);
			if (corners & 2) GFX_drawFastVLine(x0 - x, y0 - y, 2 * y + delta, color);
		}
		if (y != py) {
			if (corners & 1) GFX_drawFastVLine(x0 + py, y0 - px, 2 * px + delta, color);
			if (corners & 2) GFX_drawFastVLine(x0 - py, y0 - px, 2 * px + delta, color);
			py = y;
		}
		px = x;
	}
}

void GFX_drawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color) {
	int16_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
	if (r > max_radius) r = max_radius;

	// smarter version
	 GFX_drawFastHLine(x + r, y, w - 2 * r, color);         // Top
	 GFX_drawFastHLine(x + r, y + h - 1, w - 2 * r, color); // Bottom
	 GFX_drawFastVLine(x, y + r, h - 2 * r, color);         // Left
	 GFX_drawFastVLine(x + w - 1, y + r, h - 2 * r, color); // Right
	// GFX_ four corners
	 GFX_drawCircleHelper(x + r, y + r, r, 1, color);
	 GFX_drawCircleHelper(x + w - r - 1, y + r, r, 2, color);
	 GFX_drawCircleHelper(x + w - r - 1, y + h - r - 1, r, 4, color);
	 GFX_drawCircleHelper(x + r, y + h - r - 1, r, 8, color);
}

void GFX_drawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		if (cornername & 0x4) {
			 GFX_drawPixel(x0 + x, y0 + y, color);
			 GFX_drawPixel(x0 + y, y0 + x, color);
		}
		if (cornername & 0x2) {
			 GFX_drawPixel(x0 + x, y0 - y, color);
			 GFX_drawPixel(x0 + y, y0 - x, color);
		}
		if (cornername & 0x8) {
			 GFX_drawPixel(x0 - y, y0 + x, color);
			 GFX_drawPixel(x0 - x, y0 + y, color);
		}
		if (cornername & 0x1) {
			 GFX_drawPixel(x0 - y, y0 - x, color);
			 GFX_drawPixel(x0 - x, y0 - y, color);
		}
	}
}

void GFX_drawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color) {
	GFX_drawLine(x0, y0, x1, y1, color);
	GFX_drawLine(x1, y1, x2, y2, color);
	GFX_drawLine(x2, y2, x0, y0, color);
}

void GFX_drawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	GFX_drawPixel(x0, y0 + r, color);
	GFX_drawPixel(x0, y0 - r, color);
	GFX_drawPixel(x0 + r, y0, color);
	GFX_drawPixel(x0 - r, y0, color);

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		GFX_drawPixel(x0 + x, y0 + y, color);
		GFX_drawPixel(x0 - x, y0 + y, color);
		GFX_drawPixel(x0 + x, y0 - y, color);
		GFX_drawPixel(x0 - x, y0 - y, color);
		GFX_drawPixel(x0 + y, y0 + x, color);
		GFX_drawPixel(x0 - y, y0 + x, color);
		GFX_drawPixel(x0 + y, y0 - x, color);
		GFX_drawPixel(x0 - y, y0 - x, color);
	}
}

void GFX_drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
	GFX_drawFastHLine(x, y, w, color);
	GFX_drawFastHLine(x, y + h - 1, w, color);
	GFX_drawFastVLine(x, y, h, color);
	GFX_drawFastVLine(x + w - 1, y, h, color);
}

void GFX_drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
	// Update in subclasses if desired!
	if (x0 == x1) {
		if (y0 > y1)
			_swap_int16_t(y0, y1);
		GFX_drawFastVLine(x0, y0, y1 - y0 + 1, color);
	} else if (y0 == y1) {
		if (x0 > x1)
			_swap_int16_t(x0, x1);
		GFX_drawFastHLine(x0, y0, x1 - x0 + 1, color);
	} else {
		GFX_writeLine(x0, y0, x1, y1, color);
	}
}

void GFX_writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
	int16_t steep = abs(y1 - y0) > abs(x1 - x0);
	if (steep) {
		_swap_int16_t(x0, y0);
		_swap_int16_t(x1, y1);
	}

	if (x0 > x1) {
		_swap_int16_t(x0, x1);
		_swap_int16_t(y0, y1);
	}

	int16_t dx, dy;
	dx = x1 - x0;
	dy = abs(y1 - y0);

	int16_t err = dx / 2;
	int16_t ystep;

	if (y0 < y1) {
		ystep = 1;
	} else {
		ystep = -1;
	}

	for (; x0 <= x1; x0++) {
		if (steep) {
			GFX_drawPixel(y0, x0, color);
		} else {
			GFX_drawPixel(x0, y0, color);
		}
		err -= dy;
		if (err < 0) {
			y0 += ystep;
			err += dx;
		}
	}
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
	uint32_t buffer_index = y * lcd->WIDTH + x;
	for (uint32_t i = buffer_index; i < buffer_index + w; i++) {
		screen_buffer[i] = color;
	}
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
