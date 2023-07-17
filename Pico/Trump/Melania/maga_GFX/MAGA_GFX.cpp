// ************************************************************************************ MAGA_GFX.cpp
uint16_t screenbuffer[ILI9341_SIZE] = { 0 };

/**************************************************************************/
/*!
   @brief    Instatiate a GFX context for graphics! Can only be done by a
   superclass
   @param    w   Display width, in pixels
   @param    h   Display height, in pixels
*/
/**************************************************************************/
MAGA_GFX::MAGA_GFX() {
}

/**************************************************************************/
/*!
    @brief  Fill the framebuffer completely with one color
    @param  color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::fillScreen(uint16_t color) {
	if (screenbuffer) {
		uint8_t hi = color >> 8, lo = color & 0xFF;
		if (hi == lo) {
		memset(screenbuffer, lo, ILI9341_SIZE*2);
		} else {
			uint32_t i, pixels = ILI9341_SIZE;
			for (i = 0; i < pixels; i++)
			screenbuffer[i] = color;
		}
	}
}




/**************************************************************************/
/*!
    @brief      Set rotation setting for display
    @param  x   0 thru 3 corresponding to 4 cardinal rotations
*/
/**************************************************************************/
void MAGA_GFX::setRotation(uint8_t x) {
	rotation = (x & 3);
	switch (rotation) {
		case 0:
		case 2:
			_width = WIDTH;
			_height = HEIGHT;
			break;
		case 1:
		case 3:
			_width = HEIGHT;
			_height = WIDTH;
			break;
	}
}

