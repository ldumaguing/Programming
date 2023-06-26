#include "pico/stdlib.h"
#include <stdio.h>

/// Font data stored PER GLYPH
typedef struct {
  uint16_t bitmapOffset; ///< Pointer into GFXfont->bitmap
  uint8_t width;         ///< Bitmap dimensions in pixels
  uint8_t height;        ///< Bitmap dimensions in pixels
  uint8_t xAdvance;      ///< Distance to advance cursor (x axis)
  int8_t xOffset;        ///< X dist from cursor pos to UL corner
  int8_t yOffset;        ///< Y dist from cursor pos to UL corner
} GFXglyph;

/// Data stored for FONT AS A WHOLE
typedef struct {
  uint8_t *bitmap;  ///< Glyph bitmaps, concatenated
  GFXglyph *glyph;  ///< Glyph array
  uint16_t first;   ///< ASCII extents (first char)
  uint16_t last;    ///< ASCII extents (last char)
  uint8_t yAdvance; ///< Newline distance (y axis)
} GFXfont;



// Register names from Peter Barrett's Microtouch code
#define ILI9341_SOFTRESET 0x01
#define ILI9341_SLEEPIN 0x10
#define ILI9341_SLEEPOUT 0x11
#define ILI9341_NORMALDISP 0x13
#define ILI9341_INVERTOFF 0x20
#define ILI9341_INVERTON 0x21
#define ILI9341_GAMMASET 0x26
#define ILI9341_DISPLAYOFF 0x28
#define ILI9341_DISPLAYON 0x29
#define ILI9341_COLADDRSET 0x2A
#define ILI9341_PAGEADDRSET 0x2B
#define ILI9341_MEMORYWRITE 0x2C
#define ILI9341_PIXELFORMAT 0x3A
#define ILI9341_FRAMECONTROL 0xB1
#define ILI9341_DISPLAYFUNC 0xB6
#define ILI9341_ENTRYMODE 0xB7
#define ILI9341_POWERCONTROL1 0xC0
#define ILI9341_POWERCONTROL2 0xC1
#define ILI9341_VCOMCONTROL1 0xC5
#define ILI9341_VCOMCONTROL2 0xC7
#define ILI9341_MEMCONTROL 0x36
#define ILI9341_MADCTL 0x36

#define ILI9341_MADCTL_MY 0x80
#define ILI9341_MADCTL_MX 0x40
#define ILI9341_MADCTL_MV 0x20
#define ILI9341_MADCTL_ML 0x10
#define ILI9341_MADCTL_RGB 0x00
#define ILI9341_MADCTL_BGR 0x08
#define ILI9341_MADCTL_MH 0x04

struct MAGA_GFX {
	MAGA_GFX(int16_t w, int16_t h){};

	virtual void drawPixel(int16_t x, int16_t y, uint16_t color){};

	virtual void startWrite(void){};
	virtual void writePixel(int16_t x, int16_t y, uint16_t color){};
	virtual void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color){};
	virtual void writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color){};
	virtual void writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color){};
	virtual void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color){};
	virtual void endWrite(void){};

	virtual void setRotation(uint8_t r){};
	virtual void invertDisplay(bool i){};

	virtual void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color){};
	virtual void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color){};
	virtual void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color){};
	virtual void fillScreen(uint16_t color){};

	// Optional and probably not necessary to change
	virtual void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color){};
	virtual void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color){};

	protected:
		void charBounds(unsigned char c, int16_t *x, int16_t *y, int16_t *minx,
			int16_t *miny, int16_t *maxx, int16_t *maxy){};

		int16_t WIDTH;        ///< This is the 'raw' display width - never changes
		int16_t HEIGHT;       ///< This is the 'raw' display height - never changes
		int16_t _width;       ///< Display width as modified by current rotation
		int16_t _height;      ///< Display height as modified by current rotation
		int16_t cursor_x;     ///< x location to start print()ing text
		int16_t cursor_y;     ///< y location to start print()ing text
		uint16_t textcolor;   ///< 16-bit background color for print()
		uint16_t textbgcolor; ///< 16-bit text color for print()
		uint8_t textsize_x;   ///< Desired magnification in X-axis of text to print()
		uint8_t textsize_y;   ///< Desired magnification in Y-axis of text to print()
		uint8_t rotation;     ///< Display rotation (0 thru 3)
		bool wrap;            ///< If set, 'wrap' text at right edge of display
		bool _cp437;          ///< If set, use correct CP437 charset (default is off)
		GFXfont *gfxFont;     ///< Pointer to special font
};


// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
struct GFXcanvas8 : public MAGA_GFX {
	GFXcanvas8(uint16_t w, uint16_t h):MAGA_GFX(w, h){};
	~GFXcanvas8();

	void drawPixel(int16_t x, int16_t y, uint16_t color);

	void fillScreen(uint16_t color);
	void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
	void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
	uint8_t getPixel(int16_t x, int16_t y) const;
	uint8_t *getBuffer(void) const { return buffer; }

	protected:
		uint8_t getRawPixel(int16_t x, int16_t y) const;
		void drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
		void drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
		uint8_t *buffer;
};



struct MAGA_TFTLCD : public MAGA_GFX {
	MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0, int16_t w, int16_t h)
		: MAGA_GFX(w, h){};

	uint8_t _cs;
	uint8_t _cd;
	uint8_t _wr;
	uint8_t _rd;
	uint8_t _rst;
	uint8_t _d0;
	uint8_t _d1;
	uint8_t _d2;
	uint8_t _d3;
	uint8_t _d4;
	uint8_t _d5;
	uint8_t _d6;
	uint8_t _d7;




		/*
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
		void setWriteDir();

		write8(uint8_t value),
		
		setReadDir(void),
		writeRegister8(uint8_t a, uint8_t d),
		writeRegister16(uint16_t a, uint16_t d),
		writeRegister24(uint8_t a, uint32_t d),
		writeRegister32(uint8_t a, uint32_t d),
		writeRegisterPair(uint8_t aH, uint8_t aL, uint16_t d),
		setLR(void), flood(uint16_t color, uint32_t len);

		uint8_t driver;
		uint8_t read8fn(void);

		volatile uint8_t *csPort, *cdPort, *wrPort, *rdPort;
		uint8_t csPinSet, cdPinSet, wrPinSet, rdPinSet, csPinUnset, cdPinUnset,
			wrPinUnset, rdPinUnset, _reset;
			*/
};

#define Color565 color565

MAGA_TFTLCD::MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t reset, uint8_t d0,
	int16_t w, int16_t h) {

	_cs = cs;
	_cd = cd;
	_wr = wr;
	_rd = rd;
	_rst = reset;
	_d0 = d0;
	_d1 = d0 + 1;
	_d2 = d0 + 2;
	_d3 = d0 + 3;
	_d4 = d0 + 4;
	_d5 = d0 + 5;
	_d6 = d0 + 6;
	_d7 = d0 + 7;

	init();
};

// *************************************************************************************************
void MAGA_TFTLCD::init() {
	//setWriteDir();
	//GFXcanvas8 fish = GFXcanvas8(333, 666);
}

void MAGA_TFTLCD::setWriteDir() {
}

void MAGA_TFTLCD::yo() {

}




#define	BLACK   0x0000
#define	BLUE    0x001F
#define	RED     0xF800
#define	GREEN   0x07E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#define LCD_CS     0
#define LCD_CD     1
#define LCD_WR     2
#define LCD_RD     3
#define LCD_RESET  4
#define LCD_D0     5
#define LCD_WIDTH  320
#define LCD_HEIGHT 240

// *************************************************************************************************
void setup();
void loop();

// *************************************************************************************************
MAGA_TFTLCD tft = MAGA_TFTLCD(LCD_CS, LCD_CD, LCD_WR, LCD_RD, LCD_RESET, LCD_D0,
	LCD_WIDTH, LCD_HEIGHT);

int main() {
	stdio_usb_init();

	

	setup();
	loop();
	
	return 0;
}

// *************************************************************************************************
void setup() {
	/*
	tft.reset();

	uint16_t identifier = tft.readID();
	if(identifier == 0x9341)
		std::cout << "Found ILI9341 LCD driver\n";
	else {
		std::cout << "Unknown LCD driver chip: " << identifier << "\n";
		return;
	}

	tft.begin(identifier);
	*/
}

void loop() {
	/*
	for(;;) {
		printf("%d, %d, %d\n", tft._d0, tft._d1, tft._d2);
		sleep_ms(5000);
	}
*/
}

