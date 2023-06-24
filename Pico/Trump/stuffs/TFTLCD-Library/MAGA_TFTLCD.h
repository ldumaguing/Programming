#include "MAGA_GFX.h"

class MAGA_TFTLCD : public MAGA_GFX {
	public:
		MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0);

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
		// These methods are public in order for BMP examples to work:
		void setAddrWindow(int x1, int y1, int x2, int y2);
		void pushColors(uint16_t *data, uint8_t len, bool first);

		uint16_t color565(uint8_t r, uint8_t g, uint8_t b),
			readPixel(int16_t x, int16_t y),
			readID(void);
		uint32_t readReg(uint8_t r);

	private:
		void init();
		void setWriteDir(void);
};

#define Color565 color565

