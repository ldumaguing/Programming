struct MAGA_TFTLCD : public MAGA_GFX {
	MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst);
	MAGA_TFTLCD(void);

	void begin(uint16_t id = 0x9325);
	void drawPixel(int16_t x, int16_t y, uint16_t color);
	void drawFastHLine(int16_t x0, int16_t y0, int16_t w, uint16_t color);
	void drawFastVLine(int16_t x0, int16_t y0, int16_t h, uint16_t color);
	void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t c);
	void fillScreen(uint16_t color);
	void reset(void);
	void setRegisters8(uint8_t *ptr, uint8_t n);
	void setRegisters16(uint16_t *ptr, uint8_t n);
	void setRotation(uint8_t x);

	void setAddrWindow(int x1, int y1, int x2, int y2);
	void pushColors(uint16_t *data, uint8_t len, boolean first);

	uint16_t color565(uint8_t r, uint8_t g, uint8_t b),
	readPixel(int16_t x, int16_t y),
	readID(void);

	uint32_t readReg(uint8_t r);

	private:
		void init(),
	    write8(uint8_t value),
	    setWriteDir(void),
	    setReadDir(void),
	    writeRegister8(uint8_t a, uint8_t d),
	    writeRegister16(uint16_t a, uint16_t d),
		writeRegister24(uint8_t a, uint32_t d),
	    writeRegister32(uint8_t a, uint32_t d),
	    writeRegisterPair(uint8_t aH, uint8_t aL, uint16_t d),
	    setLR(void), flood(uint16_t color, uint32_t len);

		uint8_t driver;
		uint8_t read8fn(void);
};

#define Color565 color565

