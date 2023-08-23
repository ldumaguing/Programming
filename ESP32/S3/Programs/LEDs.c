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

