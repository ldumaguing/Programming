// *************** Tue Aug 22 03:55:05 PM EDT 2023
// *************************************************************************************************

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

#define GPIO_REG           0x60004000

#define GPIO_OUT_W1TS_REG  (GPIO_REG | 0x0008)
#define GPIO_OUT_W1TC_REG  (GPIO_REG | 0x000C)
#define GPIO_ENABLE_REG    (GPIO_REG | 0x0020)

/*
#define GPIO_OUT1_W1TS_REG (GPIO_REG | 0x0014)
#define GPIO_OUT1_W1TC_REG (GPIO_REG | 0x0018)
#define GPIO_ENABLE1_REG   (GPIO_REG | 0x002C)
*/

#define ILI9341_CS 4
#define ILI9341_CD 5
#define ILI9341_WR 6
#define ILI9341_RD 7

#define ILI9341_D0 8
#define ILI9341_D1 3
#define ILI9341_D2 9
#define ILI9341_D3 10
#define ILI9341_D4 11
#define ILI9341_D5 12
#define ILI9341_D6 13
#define ILI9341_D7 14

#define sleep_ms(x) vTaskDelay(x / portTICK_PERIOD_MS)

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

int pins[] = {
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

uint16_t pads = 0;

static inline void init_pins() {
	for(int i=0; i<12; i++) {
		pads |= (1 << pins[i]);
	}
	
	*gpio_enable_reg = pads;
	*gpio_out_w1tc_reg = pads;
};

void app_main(void) {
	init_pins();

	while(1) {
		for(int i=0; i<12; i++) {
			*gpio_out_w1ts_reg = (1 << pins[i]);
			sleep_ms(500);
		}
		*gpio_out_w1tc_reg = pads;
		sleep_ms(500);
	}


/*
while(1) {
	uint16_t pin_pads = 0;
	for(int i=0; i<12; i++) {
		pin_pads |= (1 << pins[i]);
		*gpio_out_w1ts_reg = pin_pads;
		sleep_ms(500);
	}
	*gpio_out_w1tc_reg = pads;
	sleep_ms(500);
}
*/
}

