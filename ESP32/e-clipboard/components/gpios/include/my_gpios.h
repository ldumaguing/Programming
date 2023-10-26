#define GPIO_FISH 666
#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020
// #define controlPins 0xC010014
#define controlPins 0x4010014
#define datumPins   0x2EE0020

#define CS_ACTIVE  *gpio_out_w1tc_reg = (1 << ILI9341_CS)
#define CS_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_CS)
#define CD_COMMAND *gpio_out_w1tc_reg = (1 << ILI9341_CD)
#define CD_DATA    *gpio_out_w1ts_reg = (1 << ILI9341_CD)
#define WR_IDLE    *gpio_out_w1ts_reg = (1 << ILI9341_IDLE)
#define WR_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_WR); *gpio_out_w1ts_reg = (1 << ILI9341_WR)
#define RD_STROBE  *gpio_out_w1tc_reg = (1 << ILI9341_RD); *gpio_out_w1ts_reg = (1 << ILI9341_RD)


