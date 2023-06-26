MAGA_GFX::MAGA_GFX(int16_t w, int16_t h) {
	WIDTH = w;
	HEIGHT = h;
	_width = w;
	_height = h;
	rotation = 0;
	cursor_y = cursor_x = 0;
	textsize_x = textsize_y = 1;
	textcolor = textbgcolor = 0xFFFF;
	wrap = true;
	_cp437 = false;
//	gfxFont = NULL;

};




// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
GFXcanvas8::GFXcanvas8(int16_t x, int16_t y, uint16_t color, uint16_t w, uint16_t h) : MAGA_GFX (w, h) {
	uint32_t bytes = w * h;
	if ((buffer = (uint8_t *)malloc(bytes))) {
		memset(buffer, 0, bytes);
	}

};

GFXcanvas8::~GFXcanvas8() {
	if (buffer)
		free(buffer);
};

void GFXcanvas8::drawPixel(int16_t x, int16_t y, uint16_t color) {
};








/*

void GFXcanvas8::drawPixel(int16_t x, int16_t y, uint16_t color) {
}
*/
