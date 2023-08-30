#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"

// *************** WO
#define ILI9341_CS 26
#define ILI9341_CD 2
#define ILI9341_WR 4
#define ILI9341_RD 16

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

#define sleep_ms(x) vTaskDelay(x / portTICK_PERIOD_MS)

// #define ACHTUNG1 *gpio_out_w1ts_reg = (1 << LED_1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << LED_1); sleep_ms(250)


volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;


#define SEGA_SEL 27
#define SEGA_D0  36
#define SEGA_D1  39
#define SEGA_D2  34
#define SEGA_D3  35
#define SEGA_D4  32
#define SEGA_D5  33

#define GPIO_ENABLE1_REG   0x3FF4402C
#define GPIO_IN1_REG       0x3FF44040


volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;
volatile uint32_t* gpio_in1_reg = (volatile uint32_t*) GPIO_IN1_REG;

uint32_t controlPins = 0;
uint32_t dataPins = 0;

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

static inline void init_pins() {
	controlPins = (1 << ILI9341_CS)
		| (1 << ILI9341_CD)
		| (1 << ILI9341_RD)
		| (1 << ILI9341_WR);

	dataPins = (1 << ILI9341_D0)
		| (1 << ILI9341_D1)
		| (1 << ILI9341_D2)
		| (1 << ILI9341_D3)
		| (1 << ILI9341_D4)
		| (1 << ILI9341_D5)
		| (1 << ILI9341_D6)
		| (1 << ILI9341_D7);

	*gpio_enable_reg = (controlPins | dataPins | (1 << SEGA_SEL));
	*gpio_out_w1tc_reg = (controlPins | dataPins);

	*gpio_out_w1ts_reg = (1 << SEGA_SEL);

/*
	*gpio_enable_reg = ((1 << SEGA_SEL)
		| (1 << SEGA_UP));
	*gpio_out_w1ts_reg = (1 << SEGA_SEL);

	*gpio_out_w1tc_reg = (1 << SEGA_UP);

	gpio_set_direction(SEGA_D0, GPIO_MODE_INPUT);
*/
};

void app_main(void) {
	init_pins();



	while(1) {
		for(int i=0; i<12; i++) {
			*gpio_out_w1ts_reg = (1 << pins[i]);
			sleep_ms(250);
		}
		*gpio_out_w1tc_reg = (controlPins | dataPins);
		sleep_ms(250);
/*
		int x = GPIO_IN1_REG & 0x80;
		if(x) {
			*gpio_out_w1tc_reg = (1 << LED_1);
		} else {
			*gpio_out_w1ts_reg = (1 << LED_1);
		}

		if(gpio_get_level(SEGA_D0) == 1) {
			*gpio_out_w1tc_reg = (1 << ILI9341_CS);
		} else {
			*gpio_out_w1ts_reg = (1 << ILI9341_CS);
		}
*/
	}
}

/*
#define LED_1 27
#define LED_2 1 // 33

#define GPIO_OUT_W1TS_REG 0x3FF44008
#define GPIO_OUT_W1TC_REG 0x3FF4400C
#define GPIO_ENABLE_REG   0x3FF44020

#define GPIO_OUT1_W1TS_REG 0x3FF44014
#define GPIO_OUT1_W1TC_REG 0x3FF44018
#define GPIO_ENABLE1_REG   0x3FF4402C

#define sleep_ms(x) vTaskDelay(x / portTICK_PERIOD_MS)

#define ACHTUNG1 *gpio_out_w1ts_reg = (1 << LED_1); sleep_ms(250); *gpio_out_w1tc_reg = (1 << LED_1); sleep_ms(250)
#define ACHTUNG2 *gpio_out1_w1ts_reg = (1 << LED_2); sleep_ms(250); *gpio_out1_w1tc_reg = (1 << LED_2); sleep_ms(250)

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

volatile uint32_t* gpio_out1_w1ts_reg = (volatile uint32_t*) GPIO_OUT1_W1TS_REG;
volatile uint32_t* gpio_out1_w1tc_reg = (volatile uint32_t*) GPIO_OUT1_W1TC_REG;
volatile uint32_t* gpio_enable1_reg = (volatile uint32_t*) GPIO_ENABLE1_REG;

static inline void init_pins() {
	*gpio_enable_reg = (1 << LED_1);
	*gpio_out1_w1tc_reg = (1 << LED_1);

	*gpio_enable1_reg = (1 << LED_2);
	*gpio_out1_w1tc_reg = (1 << LED_2);
};

void app_main(void) {
	init_pins();

	while(1) {
		ACHTUNG1;
		ACHTUNG2;
	}
}
*/

