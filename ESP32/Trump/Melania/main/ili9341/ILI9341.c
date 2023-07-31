// ************************************************************************************** ILI9341.c
#define controlPins 0x4010014
#define colorPins  0x2EE0020

uint16_t screenbuffer[ILI9341_SIZE] = { 0 };

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;

	do {
		*gpio_out_w1tc_reg = colorPins;
		*gpio_out_w1ts_reg = (1 << ILI9341_D0);
		*gpio_out_w1ts_reg = (1 << ILI9341_D1);
		*gpio_out_w1ts_reg = (1 << ILI9341_D2);
		*gpio_out_w1ts_reg = (1 << ILI9341_D3);
		*gpio_out_w1ts_reg = (1 << ILI9341_D4);
		*gpio_out_w1ts_reg = (1 << ILI9341_D5);
		*gpio_out_w1ts_reg = (1 << ILI9341_D6);
		*gpio_out_w1ts_reg = (1 << ILI9341_D7);
		WR_STROBE;

		len--;
		x++;
	} while (len > 0);
}


// ************************************************************************************************
void ILI9341_init() {
	ili.WIDTH    = ILI9341_TFTWIDTH;
	ili.HEIGHT   = ILI9341_TFTHEIGHT;
	ili._width   = ILI9341_TFTWIDTH;
	ili._height  = ILI9341_TFTHEIGHT;
	ili.rotation = 0;
	
	// init pins
	*gpio_enable_reg = colorPins | controlPins;
	*gpio_out_w1tc_reg = colorPins | controlPins;
	sleep_ms(3000);
	*gpio_out_w1ts_reg = controlPins; sleep_ms(500);
	*gpio_out_w1ts_reg = colorPins; sleep_ms(500);
	*gpio_out_w1tc_reg = colorPins; sleep_ms(500);
	//sleep_ms(5000);
	for (;;) {
		RD_STROBE;
	}
	
/*
	ILI9341_set_command(0x01); //soft reset
	sleep_ms(1000);

	ILI9341_set_command(ILI9341_GAMMASET);
	ILI9341_command_param(0x01);

	// memory access control
	ILI9341_set_command(ILI9341_MADCTL);
	ILI9341_command_param(0x48);

	// pixel format
	ILI9341_set_command(ILI9341_PIXFMT);
	ILI9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ILI9341_set_command(ILI9341_FRMCTR1);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x1B);

	// exit sleep
	ILI9341_set_command(ILI9341_SLPOUT);

	// display on
	ILI9341_set_command(ILI9341_DISPON);

	// column address set
	ILI9341_set_command(ILI9341_CASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start column
	ILI9341_command_param(0x00);
	ILI9341_command_param(0xef);  // end column -> 239

	// page address set
	ILI9341_set_command(ILI9341_PASET);
	ILI9341_command_param(0x00);
	ILI9341_command_param(0x00);  // start page
	ILI9341_command_param(0x01);
	ILI9341_command_param(0x3f);  // end page -> 319

	ILI9341_set_command(ILI9341_RAMWR);
	*/
};

void ILI9341_render() {
	ILI9341_write_data(screenbuffer, ILI9341_SIZE*2);
}

void ILI9341_set_command(uint8_t cmd) {
	CS_ACTIVE;
	CD_COMMAND;
	sio_write(&cmd, 1);
	CD_DATA;
	CS_IDLE;
};

void ILI9341_command_param(uint8_t data) {
	CS_ACTIVE;
	sio_write(&data, 1);
	CS_IDLE;
};

void ILI9341_write_data(void *buffer, int bytes) {
	CS_ACTIVE;
	sio_write(buffer, bytes);
	CS_IDLE;
};

