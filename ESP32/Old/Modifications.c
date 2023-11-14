#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_log.h"
#include "driver/uart.h"
#include "string.h"
#include "driver/gpio.h"

static const int RX_BUF_SIZE = 128;

#define TXD_PIN (GPIO_NUM_10)
#define RXD_PIN (GPIO_NUM_9)

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
    uart_driver_install(UART_NUM_1, RX_BUF_SIZE * 2, 0, 0, NULL, 0);
    uart_param_config(UART_NUM_1, &uart_config);
    uart_set_pin(UART_NUM_1, TXD_PIN, RXD_PIN, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE);
}

static void GamePad_Phase(uint8_t *data, int len) {
	// "idx   0;   0;   0;   6, -29;   0,   0;   0;   0;   0"
	//printf(">>>%s<<<\n", data);
	for(int i=0; i<len; i++) {
		if((data[i]==10) & (data[i+1]==105) & (data[i+2]==100)) {
			//printf("in %d\n", i);
			data[i+53] = 0;

			printf("%s\n", &data[i+1]);

			return;
		}
	}
}

static void rx_task(void *arg)
{
    uint8_t* data = (uint8_t*) malloc(RX_BUF_SIZE+1);
    while (1) {
        const int rxBytes = uart_read_bytes(UART_NUM_1, data, RX_BUF_SIZE, 200 / portTICK_PERIOD_MS);
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
    xTaskCreate(rx_task, "uart_rx_task", 1024*2, NULL, configMAX_PRIORITIES, NULL);
    //xTaskCreate(tx_task, "uart_tx_task", 1024*2, NULL, configMAX_PRIORITIES-1, NULL);
}



***************************************************************************************************************
***************************************************************************************************************
***************************************************************************************************************
***************************************************************************************************************
***************************************************************************************************************
void dumpGamepad(ControllerPtr ctl) {
    Console.printf(
        "idx%4d;%4d;%4d;%4d,%4d;%4d,%4d;%4d;%4d;%4d\n",
        ctl->index(),        // Controller Index
        ctl->dpad(),         // DPAD
        ctl->buttons(),      // bitmask of pressed buttons
        ctl->axisX(),        // (-511 - 512) left X Axis
        ctl->axisY(),        // (-511 - 512) left Y axis
        ctl->axisRX(),       // (-511 - 512) right X axis
        ctl->axisRY(),       // (-511 - 512) right Y axis
        ctl->brake(),        // (0 - 1023): brake button
        ctl->throttle(),     // (0 - 1023): throttle (AKA gas) button
        ctl->miscButtons()  // bitmak of pressed "misc" buttons
    );
}


vTaskDelay(1);














