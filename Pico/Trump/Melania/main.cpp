// *************** Mon Jul 17 09:22:14 PM EDT 2023
// *************************************************************************************************
#include "pico/stdlib.h"
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <cstdlib>

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
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

#define CS_ACTIVE  gpio_put(ILI9341_CS, 0)
#define CS_IDLE    gpio_put(ILI9341_CS, 1)
#define CD_COMMAND gpio_put(ILI9341_CD, 0)
#define CD_DATA    gpio_put(ILI9341_CD, 1)
#define WR_IDLE    gpio_put(ILI9341_WR, 1)
#define WR_STROBE  gpio_put(ILI9341_WR, 0); gpio_put(ILI9341_WR, 1)
#define RST_ACTIVE gpio_put(ILI9341_RST, 0)
#define RST_IDLE   gpio_put(ILI9341_RST, 1)
#define _swap_int16_t(a, b)                                                    \
  {                                                                            \
    int16_t t = a;                                                             \
    a = b;                                                                     \
    b = t;                                                                     \
  }


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


uint16_t colors[] = {  // no need to swap
0x0000, 0x0500, 0x0f00, 0x1900, 0x1f00, 0xe003, 0xe503, 0xef03, 0xf903, 0xff03,
0x2004, 0x2504, 0x2f04, 0x3904, 0x3f04, 0x2005, 0x2505, 0x2f05, 0x3905, 0x3f05,
0x2006, 0x2506, 0x2f06, 0x3906, 0x3f06, 0xe007, 0xe507, 0xef07, 0xf907, 0xff07,
0x0078, 0x0578, 0x0f78, 0x1978, 0x1f78, 0xe07b, 0xe57b, 0xef7b, 0xf97b, 0xff7b,
0x207c, 0x257c, 0x2f7c, 0x397c, 0x3f7c, 0x207d, 0x257d, 0x2f7d, 0x397d, 0x3f7d,
0x207e, 0x257e, 0x2f7e, 0x397e, 0x3f7e, 0xe07f, 0xe57f, 0xef7f, 0xf97f, 0xff7f,
0x00b0, 0x05b0, 0x0fb0, 0x19b0, 0x1fb0, 0xe0b3, 0xe5b3, 0xefb3, 0xf9b3, 0xffb3,
0x20b4, 0x25b4, 0x2fb4, 0x39b4, 0x3fb4, 0x20b5, 0x25b5, 0x2fb5, 0x39b5, 0x3fb5,
0x20b6, 0x25b6, 0x2fb6, 0x39b6, 0x3fb6, 0xe0b7, 0xe5b7, 0xefb7, 0xf9b7, 0xffb7,
0x00c8, 0x05c8, 0x0fc8, 0x19c8, 0x1fc8, 0xe0cb, 0xe5cb, 0xefcb, 0xf9cb, 0xffcb,  // 100

0x20cc, 0x25cc, 0x2fcc, 0x39cc, 0x3fcc, 0x20cd, 0x25cd, 0x2fcd, 0x39cd, 0x3fcd,
0x20ce, 0x25ce, 0x2fce, 0x39ce, 0x3fce, 0xe0cf, 0xe5cf, 0xefcf, 0xf9cf, 0xffcf,
0x00f8, 0x05f8, 0x0ff8, 0x19f8, 0x1ff8, 0xe0fb, 0xe5fb, 0xeffb, 0xf9fb, 0xfffb,
0x20fc, 0x25fc, 0x2ffc, 0x39fc, 0x3ffc, 0x20fd, 0x25fd, 0x2ffd, 0x39fd, 0x3ffd,
0x20fe, 0x25fe, 0x2ffe, 0x39fe, 0x3ffe, 0xe0ff, 0xe5ff, 0xefff, 0xf9ff, 0xffff   // 150
};


// ************************************************************************************** MAGA_GFX.h
// *************************************************************************************************
struct MAGA_GFX {
	MAGA_GFX();

	void setRotation(uint8_t r);
	void fillScreen(int color);
	void drawPixel(int16_t x, int16_t y, int color);
	void drawFastRawVLine(int16_t x, int16_t y, int16_t h, int color);
	void drawFastRawHLine(int16_t x, int16_t y, int16_t w, int color);
	void drawFastVLine(int16_t x, int16_t y, int16_t h, int color);
	void drawFastHLine(int16_t x, int16_t y, int16_t w, int color);
	void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int color);
	void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int color);
	void writePixel(int16_t x, int16_t y, int color);
/*

	virtual void startWrite(void);
	

	virtual void writeFillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
	virtual void writeFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
	virtual void writeFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);

	virtual void endWrite(void);
	void writeFastVLine(int16_t x, int16_t y, int16_t h, int color);
	void writeFastHLine(int16_t x, int16_t y, int16_t w, int color);

	virtual void invertDisplay(bool i);


	virtual void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);


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


//	protected:
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
   @brief    Write a pixel, overwrite in subclasses if startWrite is defined!
    @param   x   x coordinate
    @param   y   y coordinate
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::writePixel(int16_t x, int16_t y, int color) {
  drawPixel(x, y, color);
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
void MAGA_GFX::writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1,
                             int color) {
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
      writePixel(y0, x0, color);
    } else {
      writePixel(x0, y0, color);
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
   @brief    Draw a line
    @param    x0  Start point x coordinate
    @param    y0  Start point y coordinate
    @param    x1  End point x coordinate
    @param    y1  End point y coordinate
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void MAGA_GFX::drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int color) {
  // Update in subclasses if desired!
  if (x0 == x1) {
    if (y0 > y1)
      _swap_int16_t(y0, y1);
    drawFastVLine(x0, y0, y1 - y0 + 1, color);
  } else if (y0 == y1) {
    if (x0 > x1)
      _swap_int16_t(x0, x1);
    drawFastHLine(x0, y0, x1 - x0 + 1, color);
  } else {
    writeLine(x0, y0, x1, y1, color);
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
void MAGA_GFX::drawFastVLine(int16_t x, int16_t y, int16_t h,
                                int color) {
  if (h < 0) { // Convert negative heights to positive equivalent
    h *= -1;
    y -= h - 1;
    if (y < 0) {
      h += y;
      y = 0;
    }
  }

  // Edge rejection (no-draw if totally off canvas)
  if ((x < 0) || (x >= _width) || (y >= _height) || ((y + h - 1) < 0)) {
    return;
  }

  if (y < 0) { // Clip top
    h += y;
    y = 0;
  }
  if (y + h > _height) { // Clip bottom
    h = _height - y;
  }

  if (rotation == 0) {
    drawFastRawVLine(x, y, h, color);
  } else if (rotation == 1) {
    int16_t t = x;
    x = WIDTH - 1 - y;
    y = t;
    x -= h - 1;
    drawFastRawHLine(x, y, h, color);
  } else if (rotation == 2) {
    x = WIDTH - 1 - x;
    y = HEIGHT - 1 - y;

    y -= h - 1;
    drawFastRawVLine(x, y, h, color);
  } else if (rotation == 3) {
    int16_t t = x;
    x = y;
    y = HEIGHT - 1 - t;
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
void MAGA_GFX::drawFastHLine(int16_t x, int16_t y, int16_t w,
                                int color) {
  if (w < 0) { // Convert negative widths to positive equivalent
    w *= -1;
    x -= w - 1;
    if (x < 0) {
      w += x;
      x = 0;
    }
  }

  // Edge rejection (no-draw if totally off canvas)
  if ((y < 0) || (y >= _height) || (x >= _width) || ((x + w - 1) < 0)) {
    return;
  }

  if (x < 0) { // Clip left
    w += x;
    x = 0;
  }
  if (x + w >= _width) { // Clip right
    w = _width - x;
  }

  if (rotation == 0) {
    drawFastRawHLine(x, y, w, color);
  } else if (rotation == 1) {
    int16_t t = x;
    x = WIDTH - 1 - y;
    y = t;
    drawFastRawVLine(x, y, w, color);
  } else if (rotation == 2) {
    x = WIDTH - 1 - x;
    y = HEIGHT - 1 - y;

    x -= w - 1;
    drawFastRawHLine(x, y, w, color);
  } else if (rotation == 3) {
    int16_t t = x;
    x = y;
    y = HEIGHT - 1 - t;
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
void MAGA_GFX::drawFastRawVLine(int16_t x, int16_t y, int16_t h, int color) {
  // x & y already in raw (rotation 0) coordinates, no need to transform.
  uint16_t *buffer_ptr = screenbuffer + y * WIDTH + x;
  for (int16_t i = 0; i < h; i++) {
    (*buffer_ptr) = colors[color];
    buffer_ptr += WIDTH;
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
void MAGA_GFX::drawFastRawHLine(int16_t x, int16_t y, int16_t w, int color) {
  // x & y already in raw (rotation 0) coordinates, no need to transform.
  uint32_t buffer_index = y * WIDTH + x;
  for (uint32_t i = buffer_index; i < buffer_index + w; i++) {
    screenbuffer[i] = colors[color];
  }
}

/**************************************************************************/
/*!
    @brief  Draw a pixel to the canvas framebuffer
    @param  x   x coordinate
    @param  y   y coordinate
    @param  color 8-bit Color to fill with. Only lower byte of uint16_t is used.
*/
/**************************************************************************/
void MAGA_GFX::drawPixel(int16_t x, int16_t y, int color) {
	if (screenbuffer) {
		if ((x < 0) || (y < 0) || (x >= _width) || (y >= _height))
			return;

		int16_t t;
		switch (rotation) {
			case 1:
				t = x;
				x = WIDTH - 1 - y;
				y = t;
				break;
			case 2:
				x = WIDTH - 1 - x;
				y = HEIGHT - 1 - y;
				break;
			case 3:
				t = x;
				x = y;
				y = HEIGHT - 1 - t;
				break;
		}

		screenbuffer[x + y * WIDTH] = colors[color];
	}
}

/**************************************************************************/
/*!
    @brief  Fill the framebuffer completely with one color
    @param  color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::fillScreen(int color) {
	if (screenbuffer)
		memset(screenbuffer, colors[color], ILI9341_SIZE*2);
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
	ILI9341();

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);
	void pin_reset();
	void render();

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
ILI9341::ILI9341() {
}

void ILI9341::init() {
	WIDTH    = ILI9341_TFTWIDTH;
	HEIGHT   = ILI9341_TFTHEIGHT;
	_width   = ILI9341_TFTWIDTH;
	_height  = ILI9341_TFTHEIGHT;
	rotation = 0;

	init_pins();

	set_command(0x01); //soft reset
	sleep_ms(1000);

	set_command(ILI9341_GAMMASET);
	command_param(0x01);

	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);

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

void ILI9341::render() {
	write_data(screenbuffer, ILI9341_SIZE*2);
}

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
ILI9341 ili = ILI9341();

// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
// *************************************************************************************************
void testText();

void dotTest();
void fillScreenTest();
void lineTest(int);
void listColors();
void testFastLines(int, int);

void yield() {
	ili.render();
	sleep_ms(500);
};

// *************************************************************************************************
int main() {
	ili.begin();

	//fillScreen();

	//dotTest();

	// for (int i=0; i<150; i++) {
	//	lineTest(i);
	//}

	//listColors();
	
	for (int c1=0; c1<150; c1++) {
		for (int c2=149; c2>=0; c2--) {
			testFastLines(c1, c2);
			ili.render();
		}
	}



	return 0;
}


void testFastLines(int color1, int color2) {
  int           x, y, w = ili._width, h = ili._height;

  ili.fillScreen(0);
  for(y=0; y<h; y+=5) ili.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ili.drawFastVLine(x, 0, h, color2);

}


















void listColors() {
	for (int i=0; i<150; i++) {
		ili.drawLine(0, i, 40, i, i);
		if ((i%10) == 0) ili.drawLine(41, i, 44, i, 149);
	}
	ili.render();
}

void dotTest() {
	ili.fillScreen(90);

	ili.setRotation(0);
	ili.drawPixel(100, 120, 25);

	ili.setRotation(1);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(101, 120, 25);
	ili.drawPixel(102, 120, 25);

	ili.setRotation(2);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(102, 120, 25);
	ili.drawPixel(104, 120, 25);

	ili.setRotation(3);
	ili.drawPixel(100, 120, 25);
	ili.drawPixel(102, 120, 25);
	ili.drawPixel(104, 120, 25);
	ili.drawPixel(105, 120, 25);
	ili.drawPixel(106, 120, 25);
	ili.drawPixel(107, 120, 25);


	ili.render();
}

void fillScreenTest() {
	for (int i=0; i<150; i++) {
		ili.fillScreen(i);
		ili.render();
		sleep_ms(10);
	}
}

void testText() {

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

void lineTest(int color) {
  int           x1, y1, x2, y2,
                w = ili._width,
                h = ili._height;

  ili.fillScreen(0);

  
  x1 = y1 = 0;
  y2    = h - 1;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = 0;
  y1    = h - 1;
  y2    = 0;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


yield();
  ili.fillScreen(0);


  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;

  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);


  
}


