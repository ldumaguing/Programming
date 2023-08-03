// ************************************************************************************** ILI9341.c
uint16_t screenbuffer[ILI9341_SIZE] = { 0 };

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

static inline void init_pins() {
	gpio_reset_pin(ILI9341_CS);
	gpio_reset_pin(ILI9341_CD);
	gpio_reset_pin(ILI9341_WR);
	gpio_reset_pin(ILI9341_RD);

	gpio_reset_pin(ILI9341_D0);
	gpio_reset_pin(ILI9341_D1);
	gpio_reset_pin(ILI9341_D2);
	gpio_reset_pin(ILI9341_D3);
	gpio_reset_pin(ILI9341_D4);
	gpio_reset_pin(ILI9341_D5);
	gpio_reset_pin(ILI9341_D6);
	gpio_reset_pin(ILI9341_D7);

	gpio_set_direction(ILI9341_CS, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_CD, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_WR, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_RD, GPIO_MODE_OUTPUT);

	gpio_set_direction(ILI9341_D0, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D1, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D2, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D3, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D4, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D5, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D6, GPIO_MODE_OUTPUT);
	gpio_set_direction(ILI9341_D7, GPIO_MODE_OUTPUT);
	
	gpio_set_level(ILI9341_CS, 1);
	gpio_set_level(ILI9341_CD, 1);
	gpio_set_level(ILI9341_WR, 1);
	gpio_set_level(ILI9341_RD, 1);

};

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	do {
		*gpio_out_w1tc_reg = colorPins;

		if(*x&1) *gpio_out_w1ts_reg = (1 << ILI9341_D0);
		if(*x&2) *gpio_out_w1ts_reg = (1 << ILI9341_D1);
		if(*x&4) *gpio_out_w1ts_reg = (1 << ILI9341_D2);
		if(*x&8) *gpio_out_w1ts_reg = (1 << ILI9341_D3);
		if(*x&16) *gpio_out_w1ts_reg = (1 << ILI9341_D4);
		if(*x&32) *gpio_out_w1ts_reg = (1 << ILI9341_D5);
		if(*x&64) *gpio_out_w1ts_reg = (1 << ILI9341_D6);
		if(*x&128) *gpio_out_w1ts_reg = (1 << ILI9341_D7);
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

	init_pins();

	ILI9341_set_command(0x01); //soft reset
	sleep_ms(1000);

	ILI9341_set_command(ILI9341_GAMMASET);
	ILI9341_command_param(0x01);
/*
	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);
*/
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

// *********************************************************************************** Adafruit base
void ILI9341_begin() {
	ILI9341_init();
};


