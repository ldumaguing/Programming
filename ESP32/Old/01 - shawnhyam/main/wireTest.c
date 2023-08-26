void app_main(void) {
	ILI9341_init();
	uint8_t pins[] = {
		ILI9341_MISC,
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
	while(1) {
		*gpio_out_w1ts_reg = 0xC010014 | 0x2EE0020;
		sleep_ms(3000);
		*gpio_out_w1tc_reg = 0xC010014 | 0x2EE0020;
		sleep_ms(3000);
		*gpio_out_w1ts_reg = 0xC010014;
		sleep_ms(3000);
		*gpio_out_w1ts_reg = 0x2EE0020;
		sleep_ms(3000);
		*gpio_out_w1tc_reg = 0xC010014;
		sleep_ms(3000);
		*gpio_out_w1tc_reg = 0x2EE0020;
		sleep_ms(3000);
		
		for(int i=0; i<13; i++) {
			*gpio_out_w1ts_reg = (1 << pins[i]);
			sleep_ms(250);
			*gpio_out_w1tc_reg = (1 << pins[i]);
			sleep_ms(250);
		}
	}
}

