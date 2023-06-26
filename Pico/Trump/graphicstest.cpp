#include "pico/stdlib.h"
#include <stdio.h>
#include <cstdlib>
#include <cstring>

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



// from https://github.com/shawnhyam/pico
#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height

#define ILI9341_NOP 0x00     ///< No-op register
#define ILI9341_SWRESET 0x01 ///< Software reset register
#define ILI9341_RDDID 0x04   ///< Read display identification information
#define ILI9341_RDDST 0x09   ///< Read Display Status

#define ILI9341_SLPIN 0x10  ///< Enter Sleep Mode
#define ILI9341_SLPOUT 0x11 ///< Sleep Out
#define ILI9341_PTLON 0x12  ///< Partial Mode ON
#define ILI9341_NORON 0x13  ///< Normal Display Mode ON

#define ILI9341_RDMODE 0x0A     ///< Read Display Power Mode
#define ILI9341_RDMADCTL 0x0B   ///< Read Display MADCTL
#define ILI9341_RDPIXFMT 0x0C   ///< Read Display Pixel Format
#define ILI9341_RDIMGFMT 0x0D   ///< Read Display Image Format
#define ILI9341_RDSELFDIAG 0x0F ///< Read Display Self-Diagnostic Result

#define ILI9341_INVOFF 0x20   ///< Display Inversion OFF
#define ILI9341_INVON 0x21    ///< Display Inversion ON
#define ILI9341_GAMMASET 0x26 ///< Gamma Set
#define ILI9341_DISPOFF 0x28  ///< Display OFF
#define ILI9341_DISPON 0x29   ///< Display ON

#define ILI9341_CASET 0x2A ///< Column Address Set
#define ILI9341_PASET 0x2B ///< Page Address Set
#define ILI9341_RAMWR 0x2C ///< Memory Write
#define ILI9341_RAMRD 0x2E ///< Memory Read

#define ILI9341_PTLAR 0x30    ///< Partial Area
#define ILI9341_VSCRDEF 0x33  ///< Vertical Scrolling Definition
#define ILI9341_MADCTL 0x36   ///< Memory Access Control
#define ILI9341_VSCRSADD 0x37 ///< Vertical Scrolling Start Address
#define ILI9341_PIXFMT 0x3A   ///< COLMOD: Pixel Format Set

#define ILI9341_FRMCTR1 0xB1 ///< Frame Rate Control (In Normal Mode/Full Colors)
#define ILI9341_FRMCTR2 0xB2 ///< Frame Rate Control (In Idle Mode/8 colors)
#define ILI9341_FRMCTR3 0xB3 ///< Frame Rate control (In Partial Mode/Full Colors)
#define ILI9341_INVCTR 0xB4  ///< Display Inversion Control
#define ILI9341_DFUNCTR 0xB6 ///< Display Function Control

#define ILI9341_PWCTR1 0xC0 ///< Power Control 1
#define ILI9341_PWCTR2 0xC1 ///< Power Control 2
#define ILI9341_PWCTR3 0xC2 ///< Power Control 3
#define ILI9341_PWCTR4 0xC3 ///< Power Control 4
#define ILI9341_PWCTR5 0xC4 ///< Power Control 5
#define ILI9341_VMCTR1 0xC5 ///< VCOM Control 1
#define ILI9341_VMCTR2 0xC7 ///< VCOM Control 2

#define ILI9341_RDID1 0xDA ///< Read ID 1
#define ILI9341_RDID2 0xDB ///< Read ID 2
#define ILI9341_RDID3 0xDC ///< Read ID 3
#define ILI9341_RDID4 0xDD ///< Read ID 4

#define ILI9341_GMCTRP1 0xE0 ///< Positive Gamma Correction
#define ILI9341_GMCTRN1 0xE1 ///< Negative Gamma Correction


static inline void pen_down(uint8_t wr) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(wr, 0);  // writing
    //asm volatile("nop \n nop \n nop");
}

static inline void pen_up(uint8_t wr) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(wr, 1);  // not writing
    //asm volatile("nop \n nop \n nop");
}

int sio_write(const uint8_t *src, size_t len, uint8_t wr) {
	do {
		gpio_put_masked((0xff << 5), (*src << 5));

		pen_down(wr);
		pen_up(wr);

		len--;
		src++;
	} while (len > 0);
	
	return 0;
}

void init_pins() {
	gpio_init_mask(0x1fff);
	gpio_set_dir_out_masked(0x1fff);
	gpio_set_mask(0x1fff);
}

static inline void cs_select(uint8_t cs) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(cs, 0);  // Active low
    //asm volatile("nop \n nop \n nop");
}

static inline void cs_deselect(uint8_t cs) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(cs, 1);
    //asm volatile("nop \n nop \n nop");
}

void ili9341_set_command(uint8_t cmd, uint8_t cs, uint8_t wr, uint8_t dc) {
    cs_select(cs);
    gpio_put(dc, 0);
    sio_write(&cmd, 1, wr);
    gpio_put(dc, 1);
    cs_deselect(cs);
}

void ili9341_command_param(uint8_t data, uint8_t cs, uint8_t wr) {
    cs_select(cs);
    sio_write(&data, 1, wr);
    cs_deselect(cs);
}

void ili9341_write_data(uint8_t *buffer, int bytes, uint8_t cs, uint8_t wr) {
    cs_select(cs);
    sio_write(buffer, bytes, wr);
    cs_deselect(cs);
}

void ili9341_init(uint8_t cs, uint8_t wr, uint8_t dc) {
	init_pins();
	ili9341_set_command(0x01, cs, wr, dc); //soft reset
	sleep_ms(1000);

	ili9341_set_command(ILI9341_GAMMASET, cs, wr, dc);
	ili9341_command_param(0x01, cs, wr);

	// positive gamma correction
	ili9341_set_command(ILI9341_GMCTRP1, cs, wr, dc);
	uint8_t x1[15] = { 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 };
	ili9341_write_data(x1, 15, cs, wr);



//    ili9341_write_data((uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15, cs, wr);
	

	// negative gamma correction
	ili9341_set_command(ILI9341_GMCTRN1, cs, wr, dc);
//	ili9341_write_data((uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15, cs, wr);
	uint8_t x2[15] = { 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f };
	ili9341_write_data(x2, 15, cs, wr);



	// memory access control
	ili9341_set_command(ILI9341_MADCTL, cs, wr, dc);
	ili9341_command_param(0x48, cs, wr);

	// pixel format
	ili9341_set_command(ILI9341_PIXFMT, cs, wr, dc);
	ili9341_command_param(0x55, cs, wr);  // 16-bit

	// frame rate; default, 70 Hz
	ili9341_set_command(ILI9341_FRMCTR1, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x1B, cs, wr);

	// exit sleep
	ili9341_set_command(ILI9341_SLPOUT, cs, wr, dc);

	// display on
	ili9341_set_command(ILI9341_DISPON, cs, wr, dc);

	// column address set
	ili9341_set_command(ILI9341_CASET, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x00, cs, wr);  // start column
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0xef, cs, wr);  // end column -> 239

	// page address set
	ili9341_set_command(ILI9341_PASET, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x00, cs, wr);  // start page
	ili9341_command_param(0x01, cs, wr);
	ili9341_command_param(0x3f, cs, wr);  // end page -> 319

	ili9341_set_command(ILI9341_RAMWR, cs, wr, dc);


}

uint16_t swap_bytes(uint16_t color) {
    return (color>>8) | (color<<8);
}

struct MAGA_GFX {
	MAGA_GFX(int16_t w, int16_t h);

	virtual void drawPixel(int16_t x, int16_t y, uint16_t color);

	protected:
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

/*
	virtual void startWrite(void);
	virtual void writePixel(int16_t x, int16_t y, uint16_t color);
	virtual void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
	virtual void writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
	virtual void writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
	virtual void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
	virtual void endWrite(void);

	virtual void setRotation(uint8_t r);
	virtual void invertDisplay(bool i);

	virtual void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
	virtual void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
	virtual void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
	virtual void fillScreen(uint16_t color);

	// Optional and probably not necessary to change
	virtual void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
	virtual void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
*/



/*
	protected:
		void charBounds(unsigned char c, int16_t *x, int16_t *y, int16_t *minx,
			int16_t *miny, int16_t *maxx, int16_t *maxy);

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
*/
};


// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
struct GFXcanvas8 : public MAGA_GFX {
	GFXcanvas8(int16_t x, int16_t y, uint16_t color, uint16_t w, uint16_t h);
	~GFXcanvas8();

	void drawPixel(int16_t x, int16_t y, uint16_t color);

	protected:
		uint8_t *buffer;
/*
	

	protected:
		uint8_t *buffer;

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
*/

};
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
struct MAGA_TFTLCD : public MAGA_GFX {
	MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0, int16_t w, int16_t h);



	void drawPixel(int16_t x, int16_t y, uint16_t color);
	void reset(void);

	uint8_t _cs;
	uint8_t _cd;
	uint8_t _wr;
	uint8_t _rd;
	uint8_t _rst;
	uint8_t _d0;




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
#define LCD_WIDTH  240
#define LCD_HEIGHT 320

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
	tft.reset();
	/*
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

