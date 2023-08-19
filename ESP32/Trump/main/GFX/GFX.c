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

