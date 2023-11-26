#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/gpio.h"

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

#define ILI9341_CS 27
#define ILI9341_CD (33 - 32)
#define ILI9341_WR 0
#define ILI9341_RD (32 - 32)

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

#define ILI9341_CMDa_PINS (     \
	1 << ILI9341_CS    |        \
	1 << ILI9341_WR             \
)


#define ILI9341_CMDb_PINS (     \
	1 << ILI9341_CD    |        \
	1 << ILI9341_RD             \
)










void app_main(void) {
	
	
	
	
	/*
	char *ourTaskName = pcTaskGetName(NULL);
	ESP_LOGI(ourTaskName, "Yo, starting up.................");
	
	gpio_reset_pin(ILI9341_D0);
	gpio_set_direction(ILI9341_D0, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D1);
	gpio_set_direction(ILI9341_D1, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D2);
	gpio_set_direction(ILI9341_D2, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D3);
	gpio_set_direction(ILI9341_D3, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D4);
	gpio_set_direction(ILI9341_D4, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D5);
	gpio_set_direction(ILI9341_D5, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D6);
	gpio_set_direction(ILI9341_D6, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_D7);
	gpio_set_direction(ILI9341_D7, GPIO_MODE_OUTPUT);


	gpio_reset_pin(ILI9341_CS);
	gpio_set_direction(ILI9341_CS, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_CD);
	gpio_set_direction(ILI9341_CD, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_WR);
	gpio_set_direction(ILI9341_WR, GPIO_MODE_OUTPUT);

	gpio_reset_pin(ILI9341_RD);
	gpio_set_direction(ILI9341_RD, GPIO_MODE_OUTPUT);

	while(1) {
		gpio_set_level(ILI9341_D0, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D1, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D2, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D3, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D4, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D5, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D6, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D7, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);



		gpio_set_level(ILI9341_CS, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_CD, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_WR, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_RD, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);



		gpio_set_level(ILI9341_D0, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D1, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D2, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D3, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D4, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D5, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D6, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_D7, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);



	
		gpio_set_level(ILI9341_CS, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_CD, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_WR, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(ILI9341_RD, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);

	}
	*/
}
