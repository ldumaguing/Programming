// *************** Mon Jul 10 09:42:35 PM EDT 2023
// *************************************************************************************************
#include "pico/stdlib.h"
#include <stdint.h>
#include <string.h>
#include <stdio.h>

// *************************************************************************************** defines.h
// *************************************************************************************************
#define ILI9341_CS   0
#define ILI9341_CD   1
#define ILI9341_WR   2
#define ILI9341_RD   3
#define ILI9341_RST  4
#define ILI9341_D0   5
#define ILI9341_MASK 0x1fff   // 0001 1111 1111 1111

#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height
#define SWAP_BYTES(color) ((uint16_t)(color>>8) | (uint16_t)(color<<8))
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

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
#define ILI9341_INVCTR  0xB4 ///< Display Inversion Control
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
//#define ILI9341_PWCTR6     0xFC

// ********************************************************* From Adafruit
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

// Color definitions
#define ILI9341_BLACK 0x0000       ///<   0,   0,   0
#define ILI9341_NAVY 0x000F        ///<   0,   0, 123
#define ILI9341_DARKGREEN 0x03E0   ///<   0, 125,   0
#define ILI9341_DARKCYAN 0x03EF    ///<   0, 125, 123
#define ILI9341_MAROON 0x7800      ///< 123,   0,   0
#define ILI9341_PURPLE 0x780F      ///< 123,   0, 123
#define ILI9341_OLIVE 0x7BE0       ///< 123, 125,   0
#define ILI9341_LIGHTGREY 0xC618   ///< 198, 195, 198
#define ILI9341_DARKGREY 0x7BEF    ///< 123, 125, 123
#define ILI9341_BLUE 0x001F        ///<   0,   0, 255
#define ILI9341_GREEN 0x07E0       ///<   0, 255,   0
#define ILI9341_CYAN 0x07FF        ///<   0, 255, 255
#define ILI9341_RED 0xF800         ///< 255,   0,   0
#define ILI9341_MAGENTA 0xF81F     ///< 255,   0, 255
#define ILI9341_YELLOW 0xFFE0      ///< 255, 255,   0
#define ILI9341_WHITE 0xFFFF       ///< 255, 255, 255
#define ILI9341_ORANGE 0xFD20      ///< 255, 165,   0
#define ILI9341_GREENYELLOW 0xAFE5 ///< 173, 255,  41
#define ILI9341_PINK 0xFC18        ///< 255, 130, 198


// ************************************************************************************** MAGA_GFX.h
// *************************************************************************************************
struct MAGA_GFX {
	MAGA_GFX(int16_t w, int16_t h);

	void setRotation(uint8_t r);
	// void fillScreen(uint16_t color);


/*
	virtual void drawPixel(int16_t x, int16_t y, uint16_t color) = 0;
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

	virtual void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
	virtual void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
*/

/*
	void drawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
	void drawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color);
	void fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
	void fillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, int16_t delta, uint16_t color);
	void drawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
	void fillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
	void drawRoundRect(int16_t x0, int16_t y0, int16_t w, int16_t h, int16_t radius, uint16_t color);
	void fillRoundRect(int16_t x0, int16_t y0, int16_t w, int16_t h, int16_t radius, uint16_t color);
	void drawBitmap(int16_t x, int16_t y, const uint8_t bitmap[], int16_t w, int16_t h, uint16_t color);
	void drawBitmap(int16_t x, int16_t y, const uint8_t bitmap[], int16_t w, int16_t h, uint16_t color, uint16_t bg);
	void drawBitmap(int16_t x, int16_t y, uint8_t *bitmap, int16_t w, int16_t h, uint16_t color);
	void drawBitmap(int16_t x, int16_t y, uint8_t *bitmap, int16_t w, int16_t h, uint16_t color, uint16_t bg);
	void drawXBitmap(int16_t x, int16_t y, const uint8_t bitmap[], int16_t w, int16_t h, uint16_t color);
	void drawGrayscaleBitmap(int16_t x, int16_t y, const uint8_t bitmap[], int16_t w, int16_t h);
	void drawGrayscaleBitmap(int16_t x, int16_t y, uint8_t *bitmap, int16_t w, int16_t h);
	void drawGrayscaleBitmap(int16_t x, int16_t y, const uint8_t bitmap[], const uint8_t mask[], int16_t w, int16_t h);
	void drawGrayscaleBitmap(int16_t x, int16_t y, uint8_t *bitmap, uint8_t *mask, int16_t w, int16_t h);
	void drawRGBBitmap(int16_t x, int16_t y, const uint16_t bitmap[], int16_t w, int16_t h);
	void drawRGBBitmap(int16_t x, int16_t y, uint16_t *bitmap, int16_t w, int16_t h);
	void drawRGBBitmap(int16_t x, int16_t y, const uint16_t bitmap[], const uint8_t mask[], int16_t w, int16_t h);
	void drawRGBBitmap(int16_t x, int16_t y, uint16_t *bitmap, uint8_t *mask, int16_t w, int16_t h);
	void drawChar(int16_t x, int16_t y, unsigned char c, uint16_t color, uint16_t bg, uint8_t size);
	void drawChar(int16_t x, int16_t y, unsigned char c, uint16_t color, uint16_t bg, uint8_t size_x, uint8_t size_y);
	void getTextBounds(const char *string, int16_t x, int16_t y, int16_t *x1, int16_t *y1, uint16_t *w, uint16_t *h);
	void getTextBounds(const __FlashStringHelper *s, int16_t x, int16_t y, int16_t *x1, int16_t *y1, uint16_t *w, uint16_t *h);
	void getTextBounds(const String &str, int16_t x, int16_t y, int16_t *x1, int16_t *y1, uint16_t *w, uint16_t *h);
	void setTextSize(uint8_t s);
	void setTextSize(uint8_t sx, uint8_t sy);
	void setFont(const GFXfont *f = NULL);
*/


/*
	void setCursor(int16_t x, int16_t y) {
		cursor_x = x;
		cursor_y = y;
	}

	void setTextColor(uint16_t c) { textcolor = textbgcolor = c; }

	void setTextColor(uint16_t c, uint16_t bg) {
		textcolor = c;
		textbgcolor = bg;
	}

	void setTextWrap(bool w) { wrap = w; }

	void cp437(bool x = true) { _cp437 = x; }

	int16_t width(void) const { return _width; };

	int16_t height(void) const { return _height; }

	uint8_t getRotation(void) const { return rotation; }

	int16_t getCursorX(void) const { return cursor_x; }

	int16_t getCursorY(void) const { return cursor_y; };
*/


	protected:
		void charBounds(unsigned char c, int16_t *x, int16_t *y, int16_t *minx, int16_t *miny, int16_t *maxx, int16_t *maxy);
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
//		GFXfont *gfxFont;     ///< Pointer to special font
};

// ************************************************************************************ MAGA_GFX.cpp
uint16_t buffer[ILI9341_SIZE] = { 0 };

/**************************************************************************/
/*!
   @brief    Instatiate a GFX context for graphics! Can only be done by a
   superclass
   @param    w   Display width, in pixels
   @param    h   Display height, in pixels
*/
/**************************************************************************/
MAGA_GFX::MAGA_GFX(int16_t w, int16_t h) : WIDTH(w), HEIGHT(h) {
  _width = WIDTH;
  _height = HEIGHT;
  rotation = 0;
  cursor_y = cursor_x = 0;
  textsize_x = textsize_y = 1;
  textcolor = textbgcolor = 0xFFFF;
  wrap = true;
  _cp437 = false;
//  gfxFont = NULL;
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

// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341: public MAGA_GFX {
	ILI9341(int16_t w, int16_t h);

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);
	void pin_reset();

	// ************************************************** Adafruit base
	void begin();

	// ************************************************** Defining the virtual functions
	
};

// ************************************************************************************* ILI9341.cpp
static inline void init_pins() {
	gpio_init_mask(ILI9341_MASK);
	gpio_set_dir_out_masked(ILI9341_MASK);
	gpio_set_mask(ILI9341_MASK);
};

#define CS_ACTIVE  gpio_put(ILI9341_CS, 0)
#define CS_IDLE    gpio_put(ILI9341_CS, 1)
#define CD_COMMAND gpio_put(ILI9341_CD, 0)
#define CD_DATA    gpio_put(ILI9341_CD, 1)
#define WR_IDLE    gpio_put(ILI9341_WR, 1)
#define WR_STROBE  gpio_put(ILI9341_WR, 0); gpio_put(ILI9341_WR, 1)
#define RST_ACTIVE gpio_put(ILI9341_RST, 0)
#define RST_IDLE   gpio_put(ILI9341_RST, 1)

static inline void sio_write(const uint8_t *src, size_t len) {
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));
		WR_STROBE;

		len--;
		src++;
	} while (len > 0);
}

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*x << ILI9341_D0));
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}

// *************************************************************************************************
ILI9341::ILI9341(int16_t w, int16_t h):MAGA_GFX(WIDTH, HEIGHT) {
}

void ILI9341::init() {
	init_pins();

	set_command(0x01); //soft reset
	sleep_ms(1000);

	set_command(ILI9341_GAMMASET);
	command_param(0x01);

/*
	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);
*/
	// memory access control
	set_command(ILI9341_MADCTL);
	command_param(0x48);

	// pixel format
	set_command(ILI9341_PIXFMT);
	command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	set_command(ILI9341_FRMCTR1);
	command_param(0x00);
	command_param(0x1B);

	// exit sleep
	set_command(ILI9341_SLPOUT);

	// display on
	set_command(ILI9341_DISPON);

	// column address set
	set_command(ILI9341_CASET);
	command_param(0x00);
	command_param(0x00);  // start column
	command_param(0x00);
	command_param(0xef);  // end column -> 239

	// page address set
	set_command(ILI9341_PASET);
	command_param(0x00);
	command_param(0x00);  // start page
	command_param(0x01);
	command_param(0x3f);  // end page -> 319

	set_command(ILI9341_RAMWR);
};

void ILI9341::set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341::command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341::write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void ILI9341::write_data(const uint8_t *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void ILI9341::pin_reset() {
	RST_ACTIVE;
	sleep_ms(1000);
	RST_IDLE;
};

// *********************************************************************************** Adafruit base
void ILI9341::begin() {
	init();
};

// ***********************************************
ILI9341 ili = ILI9341(ILI9341_TFTWIDTH, ILI9341_TFTHEIGHT);

// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
void testText();

// *************************************************************************************************
int main() {
	ili.begin();

	for(;;) {
		for(uint8_t rotation=0; rotation<4; rotation++) {
			ili.setRotation(rotation);
			testText();
			sleep_ms(1000);
		}
	}

	return 0;
}



/*
void testFillScreen() {
  void start = micros();
  ili.fillScreen(ILI9341_BLACK);
  yield();
  ili.fillScreen(ILI9341_RED);
  yield();
  ili.fillScreen(ILI9341_GREEN);
  yield();
  ili.fillScreen(ILI9341_BLUE);
  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();
  
}
*/




void testText() {
	ili.fillScreen(ILI9341_BLACK);
/*
  void start = micros();
  ili.setCursor(0, 0);
  ili.setTextColor(ILI9341_WHITE);  ili.setTextSize(1);
  ili.println("Hello World!");
  ili.setTextColor(ILI9341_YELLOW); ili.setTextSize(2);
  ili.println(1234.56);
  ili.setTextColor(ILI9341_RED);    ili.setTextSize(3);
  ili.println(0xDEADBEEF, HEX);
  ili.println();
  ili.setTextColor(ILI9341_GREEN);
  ili.setTextSize(5);
  ili.println("Groop");
  ili.setTextSize(2);
  ili.println("I implore thee,");
  ili.setTextSize(1);
  ili.println("my foonting turlingdromes.");
  ili.println("And hooptiously drangle me");
  ili.println("with crinkly bindlewurdles,");
  ili.println("Or I will rend thee");
  ili.println("in the gobberwarts");
  ili.println("with my blurglecruncheon,");
  ili.println("see if I don't!");
  */
}




/*
void testLines(uint16_t color) {
  void start, t;
  int           x1, y1, x2, y2,
                w = ili.width(),
                h = ili.height();

  ili.fillScreen(ILI9341_BLACK);
  yield();
  
  x1 = y1 = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t     = micros() - start; // fillScreen doesn't count against timing

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = 0;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);

  yield();
  
}
*/



/*
void testFastLines(uint16_t color1, uint16_t color2) {
  void start;
  int           x, y, w = ili.width(), h = ili.height();

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(y=0; y<h; y+=5) ili.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ili.drawFastVLine(x, 0, h, color2);
}
*/



/*
void testRects(uint16_t color) {
  void start;
  int           n, i, i2,
                cx = ili.width()  / 2,
                cy = ili.height() / 2;

  ili.fillScreen(ILI9341_BLACK);
  n     = min(ili.width(), ili.height());
  start = micros();
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    ili.drawRect(cx-i2, cy-i2, i, i, color);
  }
}
*/



/*
void testFilledRects(uint16_t color1, uint16_t color2) {
  void start, t = 0;
  int           n, i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  n = min(ili.width(), ili.height());
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    start = micros();
    ili.fillRect(cx-i2, cy-i2, i, i, color1);
    t    += micros() - start;
    // Outlines are not included in timing results
    ili.drawRect(cx-i2, cy-i2, i, i, color2);
    yield();
  }

  return t;
}
*/



/*
void testFilledCircles(uint8_t radius, uint16_t color) {
  void start;
  int x, y, w = ili.width(), h = ili.height(), r2 = radius * 2;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      ili.fillCircle(x, y, radius, color);
    }
  }

  
}
*/



/*
void testCircles(uint8_t radius, uint16_t color) {
  void start;
  int           x, y, r2 = radius * 2,
                w = ili.width()  + radius,
                h = ili.height() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  start = micros();
  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      ili.drawCircle(x, y, radius, color);
    }
  }
}
*/



/*
void testTriangles() {
  void start;
  int           n, i, cx = ili.width()  / 2 - 1,
                      cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  n     = min(cx, cy);
  start = micros();
  for(i=0; i<n; i+=5) {
    ili.drawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      ili.color565(i, i, i));
  }
}
*/



/*
void testFilledTriangles() {
  void start, t = 0;
  int           i, cx = ili.width()  / 2 - 1,
                   cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(cx,cy); i>10; i-=5) {
    start = micros();
    ili.fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      ili.color565(0, i*10, i*10));
    t += micros() - start;
    ili.drawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      ili.color565(i*10, i*10, 0));
    yield();
  }

  return t;
}
*/



/*
void testRoundRects() {
  void start;
  int           w, i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  w     = min(ili.width(), ili.height());
  start = micros();
  for(i=0; i<w; i+=6) {
    i2 = i / 2;
    ili.drawRoundRect(cx-i2, cy-i2, i, i, i/8, ili.color565(i, 0, 0));
  }
}
*/



/*
void testFilledRoundRects() {
  void start;
  int           i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(ili.width(), ili.height()); i>20; i-=6) {
    i2 = i / 2;
    ili.fillRoundRect(cx-i2, cy-i2, i, i, i/8, ili.color565(0, i, 0));
    yield();
  }
}
*/

