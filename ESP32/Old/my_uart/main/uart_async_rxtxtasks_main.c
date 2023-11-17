#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_log.h"
#include "driver/uart.h"
#include "string.h"
#include "driver/gpio.h"

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

static const int RX_BUF_SIZE = 128;

#define TXD_PIN    (GPIO_NUM_10)
#define RXD_PIN    (GPIO_NUM_9)
#define UART_NUM_x (UART_NUM_1)

int getInt(uint8_t *, int);

struct PadInputs {
	int index, dpad, buttons,
		axisX, axisY, axisRX, axisRY,
		brake, throttle,
		miscButtons;
} padinputs;

int getInt(uint8_t *str, int loc) {
	uint8_t buff[16];
	int count=0;
	for(int i=loc; i<loc+4; i++) {
		buff[count] = str[i];
		count++;
	}
	buff[count] = 0;

	return atoi((char *)buff);
};

void init(void) {
    const uart_config_t uart_config = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_DEFAULT,
    };
    // We won't use a buffer for sending data.
    uart_driver_install(UART_NUM_x, RX_BUF_SIZE * 2, 0, 0, NULL, 0);
    uart_param_config(UART_NUM_x, &uart_config);
    uart_set_pin(UART_NUM_x, TXD_PIN, RXD_PIN, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
}

static void GamePad_Phase(uint8_t *data, int len) {
	// "idx   0;   0;   0;   6, -29;   0,   0;   0;   0;   0"
	// printf(">>>%s<<<\n", data);
	for(int i=0; i<len; i++) {
		if((data[i]==10) & (data[i+1]==105) & (data[i+2]==100)) {
			//printf("in %d\n", i);
			data[i+53] = 0;

			// printf("%s\n", &data[i+1]);
			padinputs.index = getInt(&data[i+1], 3);
			padinputs.dpad = getInt(&data[i+1], 8);
			padinputs.buttons = getInt(&data[i+1], 13);
			padinputs.axisX = getInt(&data[i+1], 18);
			padinputs.axisY = getInt(&data[i+1], 23);
			padinputs.axisRX = getInt(&data[i+1], 28);
			padinputs.axisRY = getInt(&data[i+1], 33);
			padinputs.brake = getInt(&data[i+1], 38);
			padinputs.throttle = getInt(&data[i+1], 43);
			padinputs.miscButtons = getInt(&data[i+1], 48);

			printf(">%4d;", padinputs.index);
			printf("%4d;", padinputs.dpad);
			printf("%4d;", padinputs.buttons);
			printf("%4d,", padinputs.axisX);
			printf("%4d;", padinputs.axisY);
			printf("%4d,", padinputs.axisRX);
			printf("%4d;", padinputs.axisRY);
			printf("%4d;", padinputs.brake);
			printf("%4d;", padinputs.throttle);
			printf("%4d;\n", padinputs.miscButtons);

			return;
		}
	}
}

static void rx_task(void *arg) {
    uint8_t* data = (uint8_t*) malloc(RX_BUF_SIZE+1);
    while (1) {
        const int rxBytes = uart_read_bytes(UART_NUM_x, data, RX_BUF_SIZE, 200 / portTICK_PERIOD_MS);
        if (rxBytes > 0) {
            data[rxBytes] = 0;
            GamePad_Phase(data, rxBytes);
        }
    }
    free(data);
}

void app_main(void)
{
    init();
    //xTaskCreate(rx_task, "uart_rx_task", 1024*2, NULL, configMAX_PRIORITIES, NULL);
    xTaskCreatePinnedToCore(rx_task, "uart_rx_task", 1024*2, NULL, configMAX_PRIORITIES, NULL, 0);
    //xTaskCreate(tx_task, "uart_tx_task", 1024*2, NULL, configMAX_PRIORITIES-1, NULL);
}


