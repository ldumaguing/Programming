void initGFX() {
	ili.WIDTH = ILI9341_TFTWIDTH;
	ili.HEIGHT = ILI9341_TFTHEIGHT;
	ili._width = ILI9341_TFTWIDTH;
	ili._height = ILI9341_TFTHEIGHT;
	ili.rotation = 0;
}

void renderScreenbuffer() {
	ILI9341_write_data(screenbuffer, ILI9341_SIZE*2);
}

/**************************************************************************/
/*!
   @brief   Draw a triangle with no fill color
    @param    x0  Vertex #0 x coordinate
    @param    y0  Vertex #0 y coordinate
    @param    x1  Vertex #1 x coordinate
    @param    y1  Vertex #1 y coordinate
    @param    x2  Vertex #2 x coordinate
    @param    y2  Vertex #2 y coordinate
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2,
	uint16_t color) {
	drawLine(x0, y0, x1, y1, color);
	drawLine(x1, y1, x2, y2, color);
	drawLine(x2, y2, x0, y0, color);
}

/**************************************************************************/
/*!
   @brief   Draw a rounded rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    r   Radius of corner rounding
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color) {
	int16_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
	if (r > max_radius) r = max_radius;

	// smarter version
	drawFastHLine(x + r, y, w - 2 * r, color);         // Top
	drawFastHLine(x + r, y + h - 1, w - 2 * r, color); // Bottom
	drawFastVLine(x, y + r, h - 2 * r, color);         // Left
	drawFastVLine(x + w - 1, y + r, h - 2 * r, color); // Right
	// draw four corners
	drawCircleHelper(x + r, y + r, r, 1, color);
	drawCircleHelper(x + w - r - 1, y + r, r, 2, color);
	drawCircleHelper(x + w - r - 1, y + h - r - 1, r, 4, color);
	drawCircleHelper(x + r, y + h - r - 1, r, 8, color);
}

/**************************************************************************/
/*!
    @brief    Quarter-circle drawer, used to do circles and roundrects
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    cornername  Mask bit #1 or bit #2 to indicate which quarters of
   the circle we're doing
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color) {
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
			drawPixel(x0 + x, y0 + y, color);
			drawPixel(x0 + y, y0 + x, color);
		}
		if (cornername & 0x2) {
			drawPixel(x0 + x, y0 - y, color);
			drawPixel(x0 + y, y0 - x, color);
		}
		if (cornername & 0x8) {
			drawPixel(x0 - y, y0 + x, color);
			drawPixel(x0 - x, y0 + y, color);
		}
		if (cornername & 0x1) {
			drawPixel(x0 - y, y0 - x, color);
			drawPixel(x0 - x, y0 - y, color);
		}
	}
}

/**************************************************************************/
/*!
   @brief    Draw a circle outline
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	drawPixel(x0, y0 + r, color);
	drawPixel(x0, y0 - r, color);
	drawPixel(x0 + r, y0, color);
	drawPixel(x0 - r, y0, color);

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		drawPixel(x0 + x, y0 + y, color);
		drawPixel(x0 - x, y0 + y, color);
		drawPixel(x0 + x, y0 - y, color);
		drawPixel(x0 - x, y0 - y, color);
		drawPixel(x0 + y, y0 + x, color);
		drawPixel(x0 - y, y0 + x, color);
		drawPixel(x0 + y, y0 - x, color);
		drawPixel(x0 - y, y0 - x, color);
	}
}

/**************************************************************************/
/*!
   @brief   Draw a rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
	drawFastHLine(x, y, w, color);
	drawFastHLine(x, y + h - 1, w, color);
	drawFastVLine(x, y, h, color);
	drawFastVLine(x + w - 1, y, h, color);
}

/**************************************************************************/
/*!
   @brief    Draw a line
    @param    x0  Start point x coordinate
    @param    y0  Start point y coordinate
    @param    x1  End point x coordinate
    @param    y1  End point y coordinate
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
	// Update in subclasses if desired!
	if (x0 == x1) {
		if (y0 > y1) _swap_int16_t(y0, y1);
		drawFastVLine(x0, y0, y1 - y0 + 1, color);
	} else if (y0 == y1) {
		if (x0 > x1) _swap_int16_t(x0, x1);
		drawFastHLine(x0, y0, x1 - x0 + 1, color);
	} else {
		//startWrite();
		writeLine(x0, y0, x1, y1, color);
		//endWrite();
	}
}

/**************************************************************************/
/*!
   @brief    Write a line.  Bresenham's algorithm - thx wikpedia
    @param    x0  Start point x coordinate
    @param    y0  Start point y coordinate
    @param    x1  End point x coordinate
    @param    y1  End point y coordinate
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
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
			drawPixel(y0, x0, color);
		} else {
			drawPixel(x0, y0, color);
		}
		err -= dy;
		if (err < 0) {
			y0 += ystep;
			err += dx;
		}
	}
}

/**************************************************************************/
/*!
   @brief    Speed optimized vertical line drawing
   @param    x   Line horizontal start point
   @param    y   Line vertical start point
   @param    h   length of vertical line to be drawn, including first point
   @param    color   color 16-bit 5-6-5 Color to draw line with
*/
/**************************************************************************/
void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	if (h < 0) { // Convert negative heights to positive equivalent
		h *= -1;
		y -= h - 1;
		if (y < 0) {
			h += y;
			y = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((x < 0) || (x >= ili._width) || (y >= ili._height) || ((y + h - 1) < 0)) {
		return;
	}

	if (y < 0) { // Clip top
		h += y;
		y = 0;
	}
	if (y + h > ili._height) { // Clip bottom
		h = ili._height - y;
	}

	if (ili.rotation == 0) {
		drawFastRawVLine(x, y, h, color);
	} else if (ili.rotation == 1) {
		int16_t t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		x -= h - 1;
		drawFastRawHLine(x, y, h, color);
	} else if (ili.rotation == 2) {
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;

		y -= h - 1;
		drawFastRawVLine(x, y, h, color);
	} else if (ili.rotation == 3) {
		int16_t t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
		drawFastRawHLine(x, y, h, color);
	}
}

/**************************************************************************/
/*!
   @brief  Speed optimized horizontal line drawing
   @param  x      Line horizontal start point
   @param  y      Line vertical start point
   @param  w      Length of horizontal line to be drawn, including 1st point
   @param  color  Color 16-bit 5-6-5 Color to draw line with
*/
/**************************************************************************/
void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
	if (w < 0) { // Convert negative widths to positive equivalent
		w *= -1;
		x -= w - 1;
		if (x < 0) {
			w += x;
			x = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((y < 0) || (y >= ili._height) || (x >= ili._width) || ((x + w - 1) < 0)) {
		return;
	}

	if (x < 0) { // Clip left
		w += x;
		x = 0;
	}
	if (x + w >= ili._width) { // Clip right
		w = ili._width - x;
	}

	if (ili.rotation == 0) {
		drawFastRawHLine(x, y, w, color);
	} else if (ili.rotation == 1) {
		int16_t t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		drawFastRawVLine(x, y, w, color);
	} else if (ili.rotation == 2) {
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;

		x -= w - 1;
		drawFastRawHLine(x, y, w, color);
	} else if (ili.rotation == 3) {
		int16_t t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
		y -= w - 1;
		drawFastRawVLine(x, y, w, color);
	}
}

/**************************************************************************/
/*!
   @brief    Speed optimized vertical line drawing into the raw canvas buffer
   @param    x   Line horizontal start point
   @param    y   Line vertical start point
   @param    h   length of vertical line to be drawn, including first point
   @param    color   color 16-bit 5-6-5 Color to draw line with
*/
/**************************************************************************/
void drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	// x & y already in raw (rotation 0) coordinates, no need to transform.
	uint16_t *buffer_ptr = screenbuffer + y * ili.WIDTH + x;
	for (int16_t i = 0; i < h; i++) {
		(*buffer_ptr) = color;
		buffer_ptr += ili.WIDTH;
	}
}

/**************************************************************************/
/*!
   @brief    Speed optimized horizontal line drawing into the raw canvas buffer
   @param    x   Line horizontal start point
   @param    y   Line vertical start point
   @param    w   length of horizontal line to be drawn, including first point
   @param    color   color 16-bit 5-6-5 Color to draw line with
*/
/**************************************************************************/
void drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
	// x & y already in raw (rotation 0) coordinates, no need to transform.
	uint32_t buffer_index = y * ili.WIDTH + x;
	for (uint32_t i = buffer_index; i < buffer_index + w; i++) {
		screenbuffer[i] = color;
	}
}

/**************************************************************************/
/*!
    @brief  Draw a pixel to the canvas screenbuffer
    @param  x   x coordinate
    @param  y   y coordinate
    @param  color 16-bit Color to fill with.
*/
/**************************************************************************/
void drawPixel(int16_t x, int16_t y, uint16_t color) {
	if ((x < 0) || (y < 0) || (x >= ili._width) || (y >= ili._height)) return;

	int16_t t;
	switch (ili.rotation) {
	case 1:
		t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		break;
	case 2:
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;
		break;
	case 3:
		t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
		break;
	}

	screenbuffer[x + y * ili.WIDTH] = color;
}

