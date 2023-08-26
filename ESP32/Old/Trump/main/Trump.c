// *************** Mon Aug 21 04:50:59 PM EDT 2023
// *************************************************************************************************

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "driver/gpio.h"

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
 

// *************************************************************************************** defines.h
// *************************************************************************************************
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


// *************************************************************************************** ILI9341.h
// *************************************************************************************************
void ILI9341_init();
void ILI9341_set_command(uint8_t cmd);
void ILI9341_command_param(uint8_t data);
void ILI9341_write_data(void *buffer, int bytes);

struct ILI9341 {
	int16_t WIDTH;
	int16_t HEIGHT;
	int16_t _width;
	int16_t _height;
	uint8_t rotation;
};

struct ILI9341 ili;

// ************************************************************************************** ILI9341.c
// #define sleep_ms(a) vTaskDelay(a / portTICK_PERIOD_MS)   // defined in freertos

#define ILI9341_CS  26
#define ILI9341_CD  2
#define ILI9341_WR  4
#define ILI9341_RD  16

#define ILI9341_MISC1 27
#define ILI9341_MISC2 1 // 33

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

#define ILI9341_TFTWIDTH 240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320 ///< ILI9341 max TFT height
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C

#define controlPins 0x4010014
#define datumPins   0x2EE0020

#define CS_ACTIVE  *gpio_out_w1tc_reg = (1 << ILI9341_CS)
#define CS_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_CS)
#define CD_COMMAND *gpio_out_w1tc_reg = (1 << ILI9341_CD)
#define CD_DATA    *gpio_out_w1ts_reg = (1 << ILI9341_CD)
#define WR_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_IDLE)
#define WR_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_WR); *gpio_out_w1ts_reg = (1 << ILI9341_WR)
#define RD_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_RD); *gpio_out_w1ts_reg = (1 << ILI9341_RD)

// #define ACHTUNG1   *gpio_out_w1ts_reg = (1 << ILI9341_MISC1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << ILI9341_MISC1); sleep_ms(250)
// #define ACHTUNG2   *gpio_out1_w1ts_reg = (1 << ILI9341_MISC2); sleep_ms(250); *gpio_out1_w1tc_reg = (1 << ILI9341_MISC2); sleep_ms(250)
#define ACHTUNG1_ON   *gpio_out_w1ts_reg = (1 << ILI9341_MISC1)
#define ACHTUNG1_OFF  *gpio_out_w1tc_reg = (1 << ILI9341_MISC1)
#define ACHTUNG2_ON   *gpio_out_w1ts_reg = (1 << ILI9341_MISC2)
#define ACHTUNG2_OFF  *gpio_out_w1tc_reg = (1 << ILI9341_MISC2)

uint16_t screenbuffer[ILI9341_SIZE];

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

volatile uint32_t* gpio_out1_w1ts_reg = (volatile uint32_t*) GPIO_OUT1_W1TS_REG;
volatile uint32_t* gpio_out1_w1tc_reg = (volatile uint32_t*) GPIO_OUT1_W1TC_REG;
volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;

static inline void init_pins() {
	*gpio_enable_reg = datumPins | controlPins | (1 << ILI9341_MISC1);
	*gpio_out_w1ts_reg = datumPins | controlPins;
	*gpio_out_w1tc_reg = datumPins;
	*gpio_out_w1tc_reg = (1 << ILI9341_MISC1);

	*gpio_enable1_reg = (1 << ILI9341_MISC2);
	*gpio_out1_w1tc_reg = (1 << ILI9341_MISC2);
};

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	uint32_t datum;
	do {
		datum = 0;
		*gpio_out_w1tc_reg = datumPins;
/*
		if(*x&1) *gpio_out_w1ts_reg = (1 << ILI9341_D0);
		if(*x&2) *gpio_out_w1ts_reg = (1 << ILI9341_D1);
		if(*x&4) *gpio_out_w1ts_reg = (1 << ILI9341_D2);
		if(*x&8) *gpio_out_w1ts_reg = (1 << ILI9341_D3);
		if(*x&16) *gpio_out_w1ts_reg = (1 << ILI9341_D4);
		if(*x&32) *gpio_out_w1ts_reg = (1 << ILI9341_D5);
		if(*x&64) *gpio_out_w1ts_reg = (1 << ILI9341_D6);
		if(*x&128) *gpio_out_w1ts_reg = (1 << ILI9341_D7);

		datum |= ((*x&1) << ILI9341_D0);         // 17
		datum |= ((*x&2) << (ILI9341_D1-1));     // 5
		datum |= ((*x&4) << (ILI9341_D2-2));     // 18
		datum |= ((*x&8) << (ILI9341_D3-3));     // 19
		datum |= ((*x&16) << (ILI9341_D4-4));    // 21
		datum |= ((*x&32) << (ILI9341_D5-5));    // 22
		datum |= ((*x&64) << (ILI9341_D6-6));    // 23
		datum |= ((*x&128) << (ILI9341_D7-7));   // 25
*/
		datum |= ((*x&1) << 17);     // 17 - 0
		datum |= ((*x&2) << 4);      // 5  - 1
		datum |= ((*x&4) << 16);     // 18 - 2
		datum |= ((*x&8) << 16);     // 19 - 3
		datum |= ((*x&16) << 17);    // 21 - 4
		datum |= ((*x&32) << 17);    // 22 - 5
		datum |= ((*x&64) << 17);    // 23 - 6
		datum |= ((*x&128) << 18);   // 25 - 7

		*gpio_out_w1ts_reg = datum;
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}

// ************************************************************************************************
void ILI9341_init() {
	init_pins();

	ILI9341_set_command(0x01); //soft reset
	// sleep_ms(1000);

	ILI9341_set_command(ILI9341_GAMMASET);
	ILI9341_command_param(0x01);

	// memory access control
	ILI9341_set_command(ILI9341_MADCTL);
	ILI9341_command_param(0x48);

	// pixel format
	ILI9341_set_command(ILI9341_PIXFMT);
	ILI9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ILI9341_set_command(ILI9341_FRMCTR1);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x1B);

	// exit sleep
	ILI9341_set_command(ILI9341_SLPOUT);

	// display on
	ILI9341_set_command(ILI9341_DISPON);

	// column address set
	ILI9341_set_command(ILI9341_CASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start column
	ILI9341_command_param(0x00);
	ILI9341_command_param(0xef);  // end column -> 239

	// page address set
	ILI9341_set_command(ILI9341_PASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start page
	ILI9341_command_param(0x01);
	ILI9341_command_param(0x3f);  // end page -> 319

	ILI9341_set_command(ILI9341_RAMWR);
	
	*gpio_out_w1tc_reg = datumPins;
	*gpio_out_w1ts_reg = controlPins;
};

void ILI9341_set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341_command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341_write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

void initGFX();

void drawPixel(int16_t x, int16_t y, uint16_t color);
void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
void drawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void drawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color);
void drawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);
void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color);
void fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color);
void fillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color);
void fillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2,	uint16_t color);

void drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
void drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color);
void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color);
void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color);
void drawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color);
void fillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t corners, int16_t delta, uint16_t color);

void renderScreenbuffer();

void initGFX() {
	ili.WIDTH = ILI9341_TFTWIDTH;
	ili.HEIGHT = ILI9341_TFTHEIGHT;
	ili._width = ILI9341_TFTWIDTH;
	ili._height = ILI9341_TFTHEIGHT;
	ili.rotation = 0;
}

void renderScreenbuffer() {
	ILI9341_write_data(screenbuffer, ILI9341_SIZE*2);
}

/**************************************************************************/
/*!
   @brief     Draw a triangle with color-fill
    @param    x0  Vertex #0 x coordinate
    @param    y0  Vertex #0 y coordinate
    @param    x1  Vertex #1 x coordinate
    @param    y1  Vertex #1 y coordinate
    @param    x2  Vertex #2 x coordinate
    @param    y2  Vertex #2 y coordinate
    @param    color 16-bit 5-6-5 Color to fill/draw with
*/
/**************************************************************************/
void fillTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2,
	uint16_t color) {

	int16_t a, b, y, last;

	// Sort coordinates by Y order (y2 >= y1 >= y0)
	if (y0 > y1) {
		_swap_int16_t(y0, y1);
		_swap_int16_t(x0, x1);
	}
	if (y1 > y2) {
		_swap_int16_t(y2, y1);
		_swap_int16_t(x2, x1);
	}
	if (y0 > y1) {
		_swap_int16_t(y0, y1);
		_swap_int16_t(x0, x1);
	}

  if (y0 == y2) { // Handle awkward all-on-same-line case as its own thing
    a = b = x0;
    if (x1 < a)
      a = x1;
    else if (x1 > b)
      b = x1;
    if (x2 < a)
      a = x2;
    else if (x2 > b)
      b = x2;
    drawFastHLine(a, y0, b - a + 1, color);
    return;
  }

  int16_t dx01 = x1 - x0, dy01 = y1 - y0, dx02 = x2 - x0, dy02 = y2 - y0,
          dx12 = x2 - x1, dy12 = y2 - y1;
  int32_t sa = 0, sb = 0;

  // For upper part of triangle, find scanline crossings for segments
  // 0-1 and 0-2.  If y1=y2 (flat-bottomed triangle), the scanline y1
  // is included here (and second loop will be skipped, avoiding a /0
  // error there), otherwise scanline y1 is skipped here and handled
  // in the second loop...which also avoids a /0 error here if y0=y1
  // (flat-topped triangle).
  if (y1 == y2)
    last = y1; // Include y1 scanline
  else
    last = y1 - 1; // Skip it

  for (y = y0; y <= last; y++) {
    a = x0 + sa / dy01;
    b = x0 + sb / dy02;
    sa += dx01;
    sb += dx02;
    /* longhand:
    a = x0 + (x1 - x0) * (y - y0) / (y1 - y0);
    b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
    */
    if (a > b)
      _swap_int16_t(a, b);
    drawFastHLine(a, y, b - a + 1, color);
  }

  // For lower part of triangle, find scanline crossings for segments
  // 0-2 and 1-2.  This loop is skipped if y1=y2.
  sa = (int32_t)dx12 * (y - y1);
  sb = (int32_t)dx02 * (y - y0);
  for (; y <= y2; y++) {
    a = x1 + sa / dy12;
    b = x0 + sb / dy02;
    sa += dx12;
    sb += dx02;
    /* longhand:
    a = x1 + (x2 - x1) * (y - y1) / (y2 - y1);
    b = x0 + (x2 - x0) * (y - y0) / (y2 - y0);
    */
    if (a > b)
      _swap_int16_t(a, b);
    drawFastHLine(a, y, b - a + 1, color);
  }
}

/**************************************************************************/
/*!
   @brief   Draw a rounded rectangle with fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    r   Radius of corner rounding
    @param    color 16-bit 5-6-5 Color to draw/fill with
*/
/**************************************************************************/
void fillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color) {
	int16_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
	if (r > max_radius)
		r = max_radius;
	// smarter version
	fillRect(x + r, y, w - 2 * r, h, color);
	// draw four corners
	fillCircleHelper(x + w - r - 1, y + r, r, 1, h - 2 * r - 1, color);
	fillCircleHelper(x + r, y + r, r, 2, h - 2 * r - 1, color);
}

/**************************************************************************/
/*!
   @brief    Draw a circle with filled color
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    color 16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void fillCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color) {
	drawFastVLine(x0, y0 - r, 2 * r + 1, color);
	fillCircleHelper(x0, y0, r, 3, 0, color);
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
void fillRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
	for (int16_t i = x; i < x + w; i++) {
		drawFastVLine(i, y, h, color);
	}
}

/**************************************************************************/
/*!
    @brief  Quarter-circle drawer with fill, used for circles and roundrects
    @param  x0       Center-point x coordinate
    @param  y0       Center-point y coordinate
    @param  r        Radius of circle
    @param  corners  Mask bits indicating which quarters we're doing
    @param  delta    Offset from center-point, used for round-rects
    @param  color    16-bit 5-6-5 Color to fill with
*/
/**************************************************************************/
void fillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t corners, int16_t delta,
	uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;
	int16_t px = x;
	int16_t py = y;

	delta++; // Avoid some +1's in the loop

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		// These checks avoid double-drawing certain lines, important
		// for the SSD1306 library which has an INVERT drawing mode.
		if (x < (y + 1)) {
			if (corners & 1) drawFastVLine(x0 + x, y0 - y, 2 * y + delta, color);
			if (corners & 2) drawFastVLine(x0 - x, y0 - y, 2 * y + delta, color);
		}
		if (y != py) {
			if (corners & 1) drawFastVLine(x0 + py, y0 - px, 2 * px + delta, color);
			if (corners & 2) drawFastVLine(x0 - py, y0 - px, 2 * px + delta, color);
			py = y;
		}
		px = x;
	}
}

/**************************************************************************/
/*!
   @brief   Draw a triangle with no fill color
    @param    x0  Vertex #0 x coordinate
    @param    y0  Vertex #0 y coordinate
    @param    x1  Vertex #1 x coordinate
    @param    y1  Vertex #1 y coordinate
    @param    x2  Vertex #2 x coordinate
    @param    y2  Vertex #2 y coordinate
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2,
	uint16_t color) {
	drawLine(x0, y0, x1, y1, color);
	drawLine(x1, y1, x2, y2, color);
	drawLine(x2, y2, x0, y0, color);
}

/**************************************************************************/
/*!
   @brief   Draw a rounded rectangle with no fill color
    @param    x   Top left corner x coordinate
    @param    y   Top left corner y coordinate
    @param    w   Width in pixels
    @param    h   Height in pixels
    @param    r   Radius of corner rounding
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, uint16_t color) {
	int16_t max_radius = ((w < h) ? w : h) / 2; // 1/2 minor axis
	if (r > max_radius) r = max_radius;

	// smarter version
	drawFastHLine(x + r, y, w - 2 * r, color);         // Top
	drawFastHLine(x + r, y + h - 1, w - 2 * r, color); // Bottom
	drawFastVLine(x, y + r, h - 2 * r, color);         // Left
	drawFastVLine(x + w - 1, y + r, h - 2 * r, color); // Right
	// draw four corners
	drawCircleHelper(x + r, y + r, r, 1, color);
	drawCircleHelper(x + w - r - 1, y + r, r, 2, color);
	drawCircleHelper(x + w - r - 1, y + h - r - 1, r, 4, color);
	drawCircleHelper(x + r, y + h - r - 1, r, 8, color);
}

/**************************************************************************/
/*!
    @brief    Quarter-circle drawer, used to do circles and roundrects
    @param    x0   Center-point x coordinate
    @param    y0   Center-point y coordinate
    @param    r   Radius of circle
    @param    cornername  Mask bit #1 or bit #2 to indicate which quarters of
   the circle we're doing
    @param    color 16-bit 5-6-5 Color to draw with
*/
/**************************************************************************/
void drawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		if (cornername & 0x4) {
			drawPixel(x0 + x, y0 + y, color);
			drawPixel(x0 + y, y0 + x, color);
		}
		if (cornername & 0x2) {
			drawPixel(x0 + x, y0 - y, color);
			drawPixel(x0 + y, y0 - x, color);
		}
		if (cornername & 0x8) {
			drawPixel(x0 - y, y0 + x, color);
			drawPixel(x0 - x, y0 + y, color);
		}
		if (cornername & 0x1) {
			drawPixel(x0 - y, y0 - x, color);
			drawPixel(x0 - x, y0 - y, color);
		}
	}
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
void drawCircle(int16_t x0, int16_t y0, int16_t r, uint16_t color) {
	int16_t f = 1 - r;
	int16_t ddF_x = 1;
	int16_t ddF_y = -2 * r;
	int16_t x = 0;
	int16_t y = r;

	drawPixel(x0, y0 + r, color);
	drawPixel(x0, y0 - r, color);
	drawPixel(x0 + r, y0, color);
	drawPixel(x0 - r, y0, color);

	while (x < y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;

		drawPixel(x0 + x, y0 + y, color);
		drawPixel(x0 - x, y0 + y, color);
		drawPixel(x0 + x, y0 - y, color);
		drawPixel(x0 - x, y0 - y, color);
		drawPixel(x0 + y, y0 + x, color);
		drawPixel(x0 - y, y0 + x, color);
		drawPixel(x0 + y, y0 - x, color);
		drawPixel(x0 - y, y0 - x, color);
	}
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
void drawRect(int16_t x, int16_t y, int16_t w, int16_t h, uint16_t color) {
	drawFastHLine(x, y, w, color);
	drawFastHLine(x, y + h - 1, w, color);
	drawFastVLine(x, y, h, color);
	drawFastVLine(x + w - 1, y, h, color);
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
void drawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
	// Update in subclasses if desired!
	if (x0 == x1) {
		if (y0 > y1) _swap_int16_t(y0, y1);
		drawFastVLine(x0, y0, y1 - y0 + 1, color);
	} else if (y0 == y1) {
		if (x0 > x1) _swap_int16_t(x0, x1);
		drawFastHLine(x0, y0, x1 - x0 + 1, color);
	} else {
		//startWrite();
		writeLine(x0, y0, x1, y1, color);
		//endWrite();
	}
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
void writeLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, uint16_t color) {
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
			drawPixel(y0, x0, color);
		} else {
			drawPixel(x0, y0, color);
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
   @brief    Speed optimized vertical line drawing
   @param    x   Line horizontal start point
   @param    y   Line vertical start point
   @param    h   length of vertical line to be drawn, including first point
   @param    color   color 16-bit 5-6-5 Color to draw line with
*/
/**************************************************************************/
void drawFastVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	if (h < 0) { // Convert negative heights to positive equivalent
		h *= -1;
		y -= h - 1;
		if (y < 0) {
			h += y;
			y = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((x < 0) || (x >= ili._width) || (y >= ili._height) || ((y + h - 1) < 0)) {
		return;
	}

	if (y < 0) { // Clip top
		h += y;
		y = 0;
	}
	if (y + h > ili._height) { // Clip bottom
		h = ili._height - y;
	}

	if (ili.rotation == 0) {
		drawFastRawVLine(x, y, h, color);
	} else if (ili.rotation == 1) {
		int16_t t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		x -= h - 1;
		drawFastRawHLine(x, y, h, color);
	} else if (ili.rotation == 2) {
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;

		y -= h - 1;
		drawFastRawVLine(x, y, h, color);
	} else if (ili.rotation == 3) {
		int16_t t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
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
void drawFastHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
	if (w < 0) { // Convert negative widths to positive equivalent
		w *= -1;
		x -= w - 1;
		if (x < 0) {
			w += x;
			x = 0;
		}
	}

	// Edge rejection (no-draw if totally off canvas)
	if ((y < 0) || (y >= ili._height) || (x >= ili._width) || ((x + w - 1) < 0)) {
		return;
	}

	if (x < 0) { // Clip left
		w += x;
		x = 0;
	}
	if (x + w >= ili._width) { // Clip right
		w = ili._width - x;
	}

	if (ili.rotation == 0) {
		drawFastRawHLine(x, y, w, color);
	} else if (ili.rotation == 1) {
		int16_t t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		drawFastRawVLine(x, y, w, color);
	} else if (ili.rotation == 2) {
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;

		x -= w - 1;
		drawFastRawHLine(x, y, w, color);
	} else if (ili.rotation == 3) {
		int16_t t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
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
void drawFastRawVLine(int16_t x, int16_t y, int16_t h, uint16_t color) {
	// x & y already in raw (rotation 0) coordinates, no need to transform.
	uint16_t *buffer_ptr = screenbuffer + y * ili.WIDTH + x;
	for (int16_t i = 0; i < h; i++) {
		(*buffer_ptr) = color;
		buffer_ptr += ili.WIDTH;
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
void drawFastRawHLine(int16_t x, int16_t y, int16_t w, uint16_t color) {
	// x & y already in raw (rotation 0) coordinates, no need to transform.
	uint32_t buffer_index = y * ili.WIDTH + x;
	for (uint32_t i = buffer_index; i < buffer_index + w; i++) {
		screenbuffer[i] = color;
	}
}

/**************************************************************************/
/*!
    @brief  Draw a pixel to the canvas screenbuffer
    @param  x   x coordinate
    @param  y   y coordinate
    @param  color 16-bit Color to fill with.
*/
/**************************************************************************/
void drawPixel(int16_t x, int16_t y, uint16_t color) {
	if ((x < 0) || (y < 0) || (x >= ili._width) || (y >= ili._height)) return;

	int16_t t;
	switch (ili.rotation) {
	case 1:
		t = x;
		x = ili.WIDTH - 1 - y;
		y = t;
		break;
	case 2:
		x = ili.WIDTH - 1 - x;
		y = ili.HEIGHT - 1 - y;
		break;
	case 3:
		t = x;
		x = y;
		y = ili.HEIGHT - 1 - t;
		break;
	}

	screenbuffer[x + y * ili.WIDTH] = color;
}

// *************************************************************************************************
void app_main() {
	ILI9341_init();
	initGFX();

	uint16_t c1 = 0xdff7;

	fillTriangle(10, 10, 30, 30, 60, 20, c1);

	renderScreenbuffer();
}

