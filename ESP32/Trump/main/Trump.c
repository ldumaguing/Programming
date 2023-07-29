#include <stdio.h>
#include <stdint.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#define sleep_ms(a) vTaskDelay(a / portTICK_PERIOD_MS)

#define ILI9341_CS  15
#define ILI9341_CD  2
#define ILI9341_WR  4
#define ILI9341_RD  16

#define ILI9341_D0 17
#define ILI9341_D1 5
#define ILI9341_D2 18
#define ILI9341_D3 19
#define ILI9341_D4 21
#define ILI9341_D5 22
#define ILI9341_D6 23
#define ILI9341_D7 25

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020


uint8_t pins[] = {
	ILI9341_CS,
	ILI9341_CD,
	ILI9341_WR,
	ILI9341_RD,
	ILI9341_D0,
	ILI9341_D1,
	ILI9341_D2,
	ILI9341_D3,
	ILI9341_D4,
	ILI9341_D5,
	ILI9341_D6,
	ILI9341_D7
};


void app_main(void) {
	volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
	volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
	volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

	*gpio_enable_reg = 0x2EF8034;

	while(1) {
		for(int i=0; i<12; i++) {
			*gpio_out_w1ts_reg = (1 << pins[i]);
			sleep_ms(500);
			*gpio_out_w1tc_reg = (1 << pins[i]);
			sleep_ms(500);
		}
	}
}

