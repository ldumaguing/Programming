// *************************************************************************************** defines.h
// *************************************************************************************************
//#define sleep_ms(a) vTaskDelay(a / portTICK_PERIOD_MS)

// ********** OLD ESP32
#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C

#define ILI9341_D0 26
#define ILI9341_D1 25
#define ILI9341_D2 5
#define ILI9341_D3 18
#define ILI9341_D4 19
#define ILI9341_D5 21
#define ILI9341_D6 22
#define ILI9341_D7 23

#define ILI9341_CS (33 - 32)
#define ILI9341_CD (32 - 32)
#define ILI9341_WR 0

/*
// ********** FOR ESP32-S3
#define GPIO_REG           0x60004000
#define GPIO_OUT_W1TS_REG  (GPIO_REG | 0x0008)
#define GPIO_OUT_W1TC_REG  (GPIO_REG | 0x000C)
#define GPIO_ENABLE_REG    (GPIO_REG | 0x0020)
*/

#define ILI9341_TFTWIDTH  240  ///< ILI9341 max TFT width
#define ILI9341_TFTHEIGHT 320  ///< ILI9341 max TFT height
#define ILI9341_ROTATION  1
#define ILI9341_SIZE (ILI9341_TFTHEIGHT * ILI9341_TFTWIDTH)

#define ILI9341_DATA_PINS (    \
	1 << ILI9341_D0    |       \
	1 << ILI9341_D1    |       \
	1 << ILI9341_D2    |       \
	1 << ILI9341_D3    |       \
	1 << ILI9341_D4    |       \
	1 << ILI9341_D5    |       \
	1 << ILI9341_D6    |       \
	1 << ILI9341_D7            \
)

#define ILI9341_CMDa_PINS (1 << ILI9341_WR)

#define ILI9341_CMDb_PINS (     \
	1 << ILI9341_CS    |        \
	1 << ILI9341_CD             \
)


#define CS_ACTIVE  *gpio_out1_w1tc_reg = (1 << ILI9341_CS)
#define CS_IDLE    *gpio_out1_w1ts_reg = (1 << ILI9341_CS)
#define CD_COMMAND *gpio_out1_w1tc_reg = (1 << ILI9341_CD)
#define CD_DATA    *gpio_out1_w1ts_reg = (1 << ILI9341_CD)
#define WR_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_WR)
#define WR_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_WR); *gpio_out_w1ts_reg = (1 << ILI9341_WR)

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


