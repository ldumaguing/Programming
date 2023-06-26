MAGA_TFTLCD::MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t reset, uint8_t d0, int16_t w, int16_t h)
	: MAGA_GFX(w, h) {

	_cs = cs;
	_cd = cd;
	_wr = wr;
	_rd = rd;
	_rst = reset;
	_d0 = d0;
}

// *************************************************************************************************
void MAGA_TFTLCD::drawPixel(int16_t x, int16_t y, uint16_t color) {
};

void MAGA_TFTLCD::reset() {
}

