#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "driver/gpio.h"

#define LED_1 15
#define LED_2 2
#define LED_3 0
#define LED_4 4
#define LED_5 5
#define LED_6 18
#define LED_7 19
#define LED_8 21

#define LEDc_1 3
#define LEDc_2 1
#define LEDc_3 22
#define LEDc_4 23

void app_main(void) {
	char *ourTaskName = pcTaskGetName(NULL);
	ESP_LOGI(ourTaskName, "Yo, starting up.................");
	
	gpio_reset_pin(LED_1);
	gpio_set_direction(LED_1, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_2);
	gpio_set_direction(LED_2, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_3);
	gpio_set_direction(LED_3, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_4);
	gpio_set_direction(LED_4, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_5);
	gpio_set_direction(LED_5, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_6);
	gpio_set_direction(LED_6, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_7);
	gpio_set_direction(LED_7, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LED_8);
	gpio_set_direction(LED_8, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LEDc_1);
	gpio_set_direction(LEDc_1, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LEDc_2);
	gpio_set_direction(LEDc_2, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LEDc_3);
	gpio_set_direction(LEDc_3, GPIO_MODE_OUTPUT);

	gpio_reset_pin(LEDc_4);
	gpio_set_direction(LEDc_4, GPIO_MODE_OUTPUT);

	while(1) {
		gpio_set_level(LED_1, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_2, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_3, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_4, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_5, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_6, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_7, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_8, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);

		gpio_set_level(LEDc_1, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_2, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_3, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_4, 1);
		vTaskDelay(100 / portTICK_PERIOD_MS);



		gpio_set_level(LED_1, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_2, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_3, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_4, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_5, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_6, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_7, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LED_8, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);

		gpio_set_level(LEDc_1, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_2, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_3, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
		gpio_set_level(LEDc_4, 0);
		vTaskDelay(100 / portTICK_PERIOD_MS);
	}
}
