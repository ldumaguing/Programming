// *************** Thu Jul 20 04:23:31 PM EDT 2023
// *************************************************************************************************
#include "pico/stdlib.h"
#include "pico/multicore.h"
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
#define min(a, b) (((a) < (b)) ? (a) : (b))





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


uint16_t colors[] = {  // no need to swap
0xdff7,	// TFT_ALICEBLUE
0x5aff,	// TFT_ANTIQUEWHITE
0xff07,	// TFT_AQUA
0xfa7f,	// TFT_AQUAMARINE
0xfff7,	// TFT_AZURE
0xbbf7,	// TFT_BEIGE
0x38ff,	// TFT_BISQUE
0x0000,	// TFT_BLACK
0x59ff,	// TFT_BLANCHEDALMOND
0x1f00,	// TFT_BLUE
0x5c89,	// TFT_BLUEVIOLET
0x45a1,	// TFT_BROWN
0xd0dd,	// TFT_BURLYWOOD
0xf45c,	// TFT_CADETBLUE
0xe07f,	// TFT_CHARTREUSE
0x43d3,	// TFT_CHOCOLATE
0xeafb,	// TFT_CORAL
0xbd64,	// TFT_CORNFLOWERBLUE
0xdbff,	// TFT_CORNSILK
0xa7d8,	// TFT_CRIMSON
0xff07,	// TFT_CYAN
0x1100,	// TFT_DARKBLUE
0xef03,	// TFT_DARKCYAN
0x5104,	// TFT_DARKCYAN2
0x21bc,	// TFT_DARKGOLDENROD
0x55ad,	// TFT_DARKGRAY
0x2003,	// TFT_DARKGREEN2
0xe003,	// TFT_DARKGREEN
0xef7b,	// TFT_DARKGREY
0xadbd,	// TFT_DARKKHAKI
0x1188,	// TFT_DARKMAGENTA
0x4553,	// TFT_DARKOLIVEGREEN
0x60fc,	// TFT_DARKORANGE
0x9999,	// TFT_DARKORCHID
0x0088,	// TFT_DARKRED
0xafec,	// TFT_DARKSALMON
0xf18d,	// TFT_DARKSEAGREEN
0xf149,	// TFT_DARKSLATEBLUE
0x692a,	// TFT_DARKSLATEGRAY
0x7a06,	// TFT_DARKTURQUOISE
0x1a90,	// TFT_DARKVIOLET
0xb2f8,	// TFT_DEEPPINK
0xff05,	// TFT_DEEPSKYBLUE
0x4d6b,	// TFT_DIMGRAY
0x9f1c,	// TFT_DODGERBLUE
0x04b1,	// TFT_FIREBRICK
0xdeff,	// TFT_FLORALWHITE
0x4424,	// TFT_FORESTGREEN
0x1ff8,	// TFT_FUCHSIA
0xfbde,	// TFT_GAINSBORO
0xdfff,	// TFT_GHOSTWHITE
0xa0fe,	// TFT_GOLD
0x24dd,	// TFT_GOLDENROD
0x1084,	// TFT_GRAY
0x0004,	// TFT_GREEN2
0xe007,	// TFT_GREEN
0xe5af,	// TFT_GREENYELLOW
0xfef7,	// TFT_HONEYDEW
0x56fb,	// TFT_HOTPINK
0xebca,	// TFT_INDIANRED
0x1048,	// TFT_INDIGO
0xfeff,	// TFT_IVORY
0x31f7,	// TFT_KHAKI
0x3fe7,	// TFT_LAVENDER
0x9eff,	// TFT_LAVENDERBLUSH
0xe07f,	// TFT_LAWNGREEN
0xd9ff,	// TFT_LEMONCHIFFON
0xdcae,	// TFT_LIGHTBLUE
0x10f4,	// TFT_LIGHTCORAL
0xffe7,	// TFT_LIGHTCYAN
0xdaff,	// TFT_LIGHTGOLDENRODYELLOW
0x7297,	// TFT_LIGHTGREEN
0x18c6,	// TFT_LIGHTGREY
0x9ad6,	// TFT_LIGHTGREY2
0xb8fd,	// TFT_LIGHTPINK
0x0ffd,	// TFT_LIGHTSALMON
0x9525,	// TFT_LIGHTSEAGREEN
0x7f86,	// TFT_LIGHTSKYBLUE
0x5374,	// TFT_LIGHTSLATEGRAY
0x3bb6,	// TFT_LIGHTSTEELBLUE
0xfcff,	// TFT_LIGHTYELLOW
0xe007,	// TFT_LIME
0x6636,	// TFT_LIMEGREEN
0x9cff,	// TFT_LINEN
0x1ff8,	// TFT_MAGENTA
0x0078,	// TFT_MAROON
0x0080,	// TFT_MAROON2
0x7566,	// TFT_MEDIUMAQUAMARINE
0x1900,	// TFT_MEDIUMBLUE
0xbaba,	// TFT_MEDIUMORCHID
0x9b93,	// TFT_MEDIUMPURPLE
0x8e3d,	// TFT_MEDIUMSEAGREEN
0x5d7b,	// TFT_MEDIUMSLATEBLUE
0xd307,	// TFT_MEDIUMSPRINGGREEN
0x994e,	// TFT_MEDIUMTURQUOISE
0xb0c0,	// TFT_MEDIUMVIOLETRED
0xce18,	// TFT_MIDNIGHTBLUE
0xfff7,	// TFT_MINTCREAM
0x3cff,	// TFT_MISTYROSE
0x36ff,	// TFT_MOCCASIN
0xf5fe,	// TFT_NAVAJOWHITE
0x0f00,	// TFT_NAVY
0x1000,	// TFT_NAVY2
0xbcff,	// TFT_OLDLACE
0xe07b,	// TFT_OLIVE
0x0084,	// TFT_OLIVE2
0x646c,	// TFT_OLIVEDRAB
0x20fd,	// TFT_ORANGE
0x20fa,	// TFT_ORANGERED
0x9adb,	// TFT_ORCHID
0x55ef,	// TFT_PALEGOLDENROD
0xd39f,	// TFT_PALEGREEN
0x7daf,	// TFT_PALETURQUOISE
0x92db,	// TFT_PALEVIOLETRED
0x7aff,	// TFT_PAPAYAWHIP
0xd7fe,	// TFT_PEACHPUFF
0x27cc,	// TFT_PERU
0x1ff8,	// TFT_PINK
0x19fe,	// TFT_PINK_2
0x1bdd,	// TFT_PLUM
0x1cb7,	// TFT_POWDERBLUE
0x0f78,	// TFT_PURPLE
0x1080,	// TFT_PURPLE2
0x00f8,	// TFT_RED
0x71bc,	// TFT_ROSYBROWN
0x5c43,	// TFT_ROYALBLUE
0x228a,	// TFT_SADDLEBROWN
0x0efc,	// TFT_SALMON
0x2cf5,	// TFT_SANDYBROWN
0x4a2c,	// TFT_SEAGREEN
0xbdff,	// TFT_SEASHELL
0x85a2,	// TFT_SIENNA
0x18c6,	// TFT_SILVER
0x7d86,	// TFT_SKYBLUE
0xd96a,	// TFT_SLATEBLUE
0x1274,	// TFT_SLATEGRAY
0xdfff,	// TFT_SNOW
0xef07,	// TFT_SPRINGGREEN
0x1644,	// TFT_STEELBLUE
0xb1d5,	// TFT_TAN
0x1004,	// TFT_TEAL
0xfbdd,	// TFT_THISTLE
0x08fb,	// TFT_TOMATO
0x1a47,	// TFT_TURQUOISE
0x1dec,	// TFT_VIOLET
0xf6f6,	// TFT_WHEAT
0xffff,	// TFT_WHITE
0xbef7,	// TFT_WHITESMOKE
0xe0ff,	// TFT_YELLOW
0x669e	// TFT_YELLOWGREEN
};



#define TFT_ALICEBLUE            0
#define TFT_ANTIQUEWHITE         1
#define TFT_AQUA                 2
#define TFT_AQUAMARINE           3
#define TFT_AZURE                4
#define TFT_BEIGE                5
#define TFT_BISQUE               6
#define TFT_BLACK                7
#define TFT_BLANCHEDALMOND       8
#define TFT_BLUE                 9
#define TFT_BLUEVIOLET           10
#define TFT_BROWN                11
#define TFT_BURLYWOOD            12
#define TFT_CADETBLUE            13
#define TFT_CHARTREUSE           14
#define TFT_CHOCOLATE            15
#define TFT_CORAL                16
#define TFT_CORNFLOWERBLUE       17
#define TFT_CORNSILK             18
#define TFT_CRIMSON              19
#define TFT_CYAN                 20
#define TFT_DARKBLUE             21
#define TFT_DARKCYAN             22
#define TFT_DARKCYAN2            23
#define TFT_DARKGOLDENROD        24 
#define TFT_DARKGRAY             25
#define TFT_DARKGREEN2           26
#define TFT_DARKGREEN            27
#define TFT_DARKGREY             28
#define TFT_DARKKHAKI            29
#define TFT_DARKMAGENTA          30
#define TFT_DARKOLIVEGREEN       31 
#define TFT_DARKORANGE           32
#define TFT_DARKORCHID           33
#define TFT_DARKRED              34
#define TFT_DARKSALMON           35 
#define TFT_DARKSEAGREEN         36 
#define TFT_DARKSLATEBLUE        37
#define TFT_DARKSLATEGRAY        38
#define TFT_DARKTURQUOISE        39
#define TFT_DARKVIOLET           40
#define TFT_DEEPPINK             41
#define TFT_DEEPSKYBLUE          42 
#define TFT_DIMGRAY              43
#define TFT_DODGERBLUE           44 
#define TFT_FIREBRICK            45
#define TFT_FLORALWHITE          46
#define TFT_FORESTGREEN          47
#define TFT_FUCHSIA              48
#define TFT_GAINSBORO            49
#define TFT_GHOSTWHITE           50
#define TFT_GOLD                 51
#define TFT_GOLDENROD            52   
#define TFT_GRAY                 53
#define TFT_GREEN2               54
#define TFT_GREEN                55
#define TFT_GREENYELLOW          56
#define TFT_HONEYDEW             57
#define TFT_HOTPINK              58
#define TFT_INDIANRED            59
#define TFT_INDIGO               60
#define TFT_IVORY                61
#define TFT_KHAKI                62
#define TFT_LAVENDER             63
#define TFT_LAVENDERBLUSH        64    
#define TFT_LAWNGREEN            65
#define TFT_LEMONCHIFFON         66 
#define TFT_LIGHTBLUE            67
#define TFT_LIGHTCORAL           68
#define TFT_LIGHTCYAN            69
#define TFT_LIGHTGOLDENRODYELLOW 70
#define TFT_LIGHTGREEN           71
#define TFT_LIGHTGREY            72
#define TFT_LIGHTGREY2           73
#define TFT_LIGHTPINK            74
#define TFT_LIGHTSALMON          75
#define TFT_LIGHTSEAGREEN        76
#define TFT_LIGHTSKYBLUE         77
#define TFT_LIGHTSLATEGRAY       78
#define TFT_LIGHTSTEELBLUE       79
#define TFT_LIGHTYELLOW          80
#define TFT_LIME                 81
#define TFT_LIMEGREEN            82
#define TFT_LINEN                83
#define TFT_MAGENTA              84
#define TFT_MAROON               85
#define TFT_MAROON2              86
#define TFT_MEDIUMAQUAMARINE     87
#define TFT_MEDIUMBLUE           88
#define TFT_MEDIUMORCHID         89
#define TFT_MEDIUMPURPLE         90
#define TFT_MEDIUMSEAGREEN       91
#define TFT_MEDIUMSLATEBLUE      92
#define TFT_MEDIUMSPRINGGREEN    93
#define TFT_MEDIUMTURQUOISE      94
#define TFT_MEDIUMVIOLETRED      95
#define TFT_MIDNIGHTBLUE         96
#define TFT_MINTCREAM            97
#define TFT_MISTYROSE            98
#define TFT_MOCCASIN             99
#define TFT_NAVAJOWHITE          100
#define TFT_NAVY                 101
#define TFT_NAVY2                102
#define TFT_OLDLACE              103
#define TFT_OLIVE                104
#define TFT_OLIVE2               105
#define TFT_OLIVEDRAB            106
#define TFT_ORANGE               107
#define TFT_ORANGERED            108
#define TFT_ORCHID               109
#define TFT_PALEGOLDENROD        110
#define TFT_PALEGREEN            111
#define TFT_PALETURQUOISE        112
#define TFT_PALEVIOLETRED        113
#define TFT_PAPAYAWHIP           114
#define TFT_PEACHPUFF            115
#define TFT_PERU                 116
#define TFT_PINK                 117
#define TFT_PINK_2               118
#define TFT_PLUM                 119
#define TFT_POWDERBLUE           120
#define TFT_PURPLE               121
#define TFT_PURPLE2              122
#define TFT_RED                  123
#define TFT_ROSYBROWN            124
#define TFT_ROYALBLUE            125
#define TFT_SADDLEBROWN          126
#define TFT_SALMON               127
#define TFT_SANDYBROWN           128
#define TFT_SEAGREEN             129
#define TFT_SEASHELL             130
#define TFT_SIENNA               131
#define TFT_SILVER               132
#define TFT_SKYBLUE              133
#define TFT_SLATEBLUE            134
#define TFT_SLATEGRAY            135
#define TFT_SNOW                 136
#define TFT_SPRINGGREEN          137
#define TFT_STEELBLUE            138
#define TFT_TAN                  139
#define TFT_TEAL                 140
#define TFT_THISTLE              141
#define TFT_TOMATO               142
#define TFT_TURQUOISE            143
#define TFT_VIOLET               144
#define TFT_WHEAT                145
#define TFT_WHITE                146
#define TFT_WHITESMOKE           147
#define TFT_YELLOW               148
#define TFT_YELLOWGREEN          149  
 

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
	void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, int color);
	void writeFastVLine(int16_t x, int16_t y, int16_t h, int color);
	void writeFastHLine(int16_t x, int16_t y, int16_t w, int color);
	void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, int color);
	void drawCircle(int16_t x0, int16_t y0, int16_t r, int color);
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
   @brief    Draw a circle outline
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void MAGA_GFX::drawCircle(int16_t x0, int16_t y0, int16_t r, int color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	writePixel(x0, y0 + r, color);
	writePixel(x0, y0 - r, color);
	writePixel(x0 + r, y0, color);
	writePixel(x0 - r, y0, color);

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		writePixel(x0 + x, y0 + y, color);
		writePixel(x0 - x, y0 + y, color);
		writePixel(x0 + x, y0 - y, color);
		writePixel(x0 - x, y0 - y, color);
		writePixel(x0 + y, y0 + x, color);
		writePixel(x0 - y, y0 + x, color);
		writePixel(x0 + y, y0 - x, color);
		writePixel(x0 - y, y0 - x, color);
	}

}

/**************************************************************************/
/*!
   @brief    Fill a rectangle completely with one color. Update in subclasses if
   desired!
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::fillRect(int16_t x, int16_t y, int16_t w, int16_t h, int color) {
	for (int16_t i = x; i < x + w; i++) {
		writeFastVLine(i, y, h, color);
	}
}

/**************************************************************************/
/*!
   @brief    Write a perfectly vertical line, overwrite in subclasses if
   startWrite is defined!
    @param    x   Top-most x coordinate
    @param    y   Top-most y coordinate
    @param    h   Height in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::writeFastVLine(int16_t x, int16_t y, int16_t h, int color) {
	drawFastVLine(x, y, h, color);
}

/**************************************************************************/
/*!
   @brief    Write a perfectly horizontal line, overwrite in subclasses if
   startWrite is defined!
    @param    x   Left-most x coordinate
    @param    y   Left-most y coordinate
    @param    w   Width in pixels
   @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void MAGA_GFX::writeFastHLine(int16_t x, int16_t y, int16_t w, int color) {
	drawFastHLine(x, y, w, color);
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
   @brief   Draw a rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void MAGA_GFX::drawRect(int16_t x, int16_t y, int16_t w, int16_t h, int color) {
	writeFastHLine(x, y, w, color);
	writeFastHLine(x, y + h - 1, w, color);
	writeFastVLine(x, y, h, color);
	writeFastVLine(x + w - 1, y, h, color);
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
void MAGA_GFX::writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int color) {
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
void MAGA_GFX::drawFastVLine(int16_t x, int16_t y, int16_t h, int color) {
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
void MAGA_GFX::drawFastHLine(int16_t x, int16_t y, int16_t w, int color) {
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
#define BUTTON_UP    15
#define BUTTON_DOWN  16

void testText();

void dotTest();
void fillScreenTest();
void lineTest(int);
void listColors();
void testFastLines(int, int);
void testRects(int);
void testFilledRects(int, int);
void testCircles(uint8_t, int);
void testRects_v2();

void yield() {
	ili.render();
	sleep_ms(500);
};

void initButtons() {
	gpio_init(BUTTON_UP);
   gpio_set_dir(BUTTON_UP, GPIO_IN);
   gpio_pull_up(BUTTON_UP);

	gpio_init(BUTTON_DOWN);
   gpio_set_dir(BUTTON_DOWN, GPIO_IN);
   gpio_pull_up(BUTTON_DOWN); 
}

int currColor = 0;

// *************************************************************************************************
void main2() {
	for(;;) {
      if(!gpio_get(BUTTON_UP)) {
			currColor++;
			if (currColor >= 150) currColor = 0;
		}
      if(!gpio_get(BUTTON_DOWN)) {
			currColor--;
			if (currColor < 0) currColor = 149;
		}
		sleep_ms(200);
	}
}

// *************************************************************************************************
int main() {
	initButtons();
   multicore_launch_core1(main2);

	ili.begin();

	//ili.fillScreen(TFT_RED);
	//ili.render();
	//dotTest();

	// for (int i=0; i<150; i++) {
	//	lineTest(i);
	//}

	listColors();
	
	//for (int c1=0; c1<150; c1++) {
	//	for (int c2=149; c2>=0; c2--) {
	//		testFastLines(c1, c2);
	//		ili.render();
	//	}
	//}

	//testRects(TFT_RED);
	//testFilledRects(74, 9);
	//testCircles(10, 147);

	//for(;;) {
	//	testRects_v2();
	//	ili.render();
	//	sleep_ms(10);
	//}

	return 0;
}

void testRects_v2() {
	ili.fillScreen(currColor);
	ili.drawLine(41, currColor, 44, currColor, TFT_BLACK);

}




void testCircles(uint8_t radius, int color) {
  int           x, y, r2 = radius * 2,
                w = ili._width  + radius,
                h = ili._height + radius;


  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      ili.drawCircle(x, y, radius, color);
    }
  }

}























void testFilledRects(int color1, int color2) {
  int           n, i, i2,
                cx = ili._width  / 2 - 1,
                cy = ili._height / 2 - 1;

  ili.fillScreen(0);
  n = min(ili._width, ili._height);
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    ili.fillRect(cx-i2, cy-i2, i, i, color1);
    // Outlines are not included in timing results
    ili.drawRect(cx-i2, cy-i2, i, i, color2);
  }

}

void testRects(int color) {
  int           n, i, i2,
                cx = ili._width  / 2,
                cy = ili._height / 2;

  ili.fillScreen(0);
  n     = min(ili._width, ili._height);
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    ili.drawRect(cx-i2, cy-i2, i, i, color);
  }

}

void testFastLines(int color1, int color2) {
  int           x, y, w = ili._width, h = ili._height;

  ili.fillScreen(0);
  for(y=0; y<h; y+=5) ili.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ili.drawFastVLine(x, 0, h, color2);

}

void listColors() {
	for (int i=0; i<30; i++) {
		ili.drawLine(0, i*7, 40, i*7, i);
		ili.drawLine(0, (i*7)+1, 40, (i*7)+1, i);
		ili.drawLine(0, (i*7)+2, 40, (i*7)+2, i);
		ili.drawLine(0, (i*7)+3, 40, (i*7)+3, i);
		ili.drawLine(0, (i*7)+4, 40, (i*7)+4, i);
		ili.drawLine(0, (i*7)+5, 40, (i*7)+5, i);
		ili.drawLine(0, (i*7)+6, 40, (i*7)+6, 7);
	}
	for (int i=0; i<30; i++) {
		ili.drawLine(42, i*7, 82, i*7, i+30);
		ili.drawLine(42, (i*7)+1, 82, (i*7)+1, i+30);
		ili.drawLine(42, (i*7)+2, 82, (i*7)+2, i+30);
		ili.drawLine(42, (i*7)+3, 82, (i*7)+3, i+30);
		ili.drawLine(42, (i*7)+4, 82, (i*7)+4, i+30);
		ili.drawLine(42, (i*7)+5, 82, (i*7)+5, i+30);
		ili.drawLine(42, (i*7)+6, 82, (i*7)+6, 7);
	}
	for (int i=0; i<30; i++) {
		ili.drawLine(84, i*7, 122, i*7, i+60);
		ili.drawLine(84, (i*7)+1, 122, (i*7)+1, i+60);
		ili.drawLine(84, (i*7)+2, 122, (i*7)+2, i+60);
		ili.drawLine(84, (i*7)+3, 122, (i*7)+3, i+60);
		ili.drawLine(84, (i*7)+4, 122, (i*7)+4, i+60);
		ili.drawLine(84, (i*7)+5, 122, (i*7)+5, i+60);
		ili.drawLine(84, (i*7)+6, 122, (i*7)+6, 7);
	}
	for (int i=0; i<30; i++) {
		ili.drawLine(124, i*7, 162, i*7, i+90);
		ili.drawLine(124, (i*7)+1, 162, (i*7)+1, i+90);
		ili.drawLine(124, (i*7)+2, 162, (i*7)+2, i+90);
		ili.drawLine(124, (i*7)+3, 162, (i*7)+3, i+90);
		ili.drawLine(124, (i*7)+4, 162, (i*7)+4, i+90);
		ili.drawLine(124, (i*7)+5, 162, (i*7)+5, i+90);
		ili.drawLine(124, (i*7)+6, 162, (i*7)+6, 7);
	}
	for (int i=0; i<30; i++) {
		ili.drawLine(164, i*7, 202, i*7, i+120);
		ili.drawLine(164, (i*7)+1, 202, (i*7)+1, i+120);
		ili.drawLine(164, (i*7)+2, 202, (i*7)+2, i+120);
		ili.drawLine(164, (i*7)+3, 202, (i*7)+3, i+120);
		ili.drawLine(164, (i*7)+4, 202, (i*7)+4, i+120);
		ili.drawLine(164, (i*7)+5, 202, (i*7)+5, i+120);
		ili.drawLine(164, (i*7)+6, 202, (i*7)+6, 7);
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


