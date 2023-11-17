#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_log.h"
#include "driver/uart.h"
#include "string.h"
#include "driver/gpio.h"

int count = 0;

#define TXD_PIN (GPIO_NUM_1)
#define RXD_PIN (GPIO_NUM_3)

void init(void) {
	const uart_config_t uart_config = {
		.baud_rate = 115200,
		.data_bits = UART_DATA_8_BITS,
		.parity = UART_PARITY_DISABLE,
		.stop_bits = UART_STOP_BITS_1,
		.flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
		.source_clk = UART_SCLK_APB,
	};
	// We won't use a buffer for sending data.
	uart_driver_install(UART_NUM_0, 0, 0, 0, NULL, 0);
	uart_param_config(UART_NUM_0, &uart_config);
	uart_set_pin(UART_NUM_0, TXD_PIN, RXD_PIN, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
}

void sendData(const char* data) {
	const int len = strlen(data);
	uart_write_bytes(UART_NUM_0, data, len);
}

static void tx_task(void *arg) {
	char str[80];

	while (1) {
		sprintf(str, "count: %d\n", count);
		printf("%s", str);
		sendData(str);
		vTaskDelay(2000 / portTICK_PERIOD_MS);
		count++;
		if (count > 1000) count = 0;
	}
}

void app_main(void) {
	init();
	xTaskCreate(tx_task, "uart_tx_task", 1024*2, NULL, configMAX_PRIORITIES-1, NULL);
}

