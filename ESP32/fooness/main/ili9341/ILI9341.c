// ************************************************************************************** ILI9341.c
uint16_t screenbuffer[ILI9341_SIZE];

volatile uint32_t* gpio_out_w1ts_reg = (volatile uint32_t*) GPIO_OUT_W1TS_REG;
volatile uint32_t* gpio_out_w1tc_reg = (volatile uint32_t*) GPIO_OUT_W1TC_REG;
volatile uint32_t* gpio_enable_reg = (volatile uint32_t*) GPIO_ENABLE_REG;

static inline void init_pins() {
	*gpio_enable_reg = datumPins | controlPins;
	*gpio_out_w1ts_reg = datumPins | controlPins;   // 1111 1111 : 11 11
	sleep_ms(250);
	*gpio_out_w1tc_reg = datumPins;                 // 0000 0000 : 11 11
	*gpio_out_w1tc_reg = ILI9341_MISC;
	sleep_ms(250);
};

static inline void sio_write(void *src, size_t len) {
	char *x = (char *)src;
	uint32_t datum;
	do {
		datum = 0;
		*gpio_out_w1tc_reg = datumPins;
/*
		if(*x&1) *gpio_out_w1ts_reg = (1 << ILI9341_D0);
		if(*x&2) *gpio_out_w1ts_reg = (1 << ILI9341_D1);
		if(*x&4) *gpio_out_w1ts_reg = (1 << ILI9341_D2);
		if(*x&8) *gpio_out_w1ts_reg = (1 << ILI9341_D3);
		if(*x&16) *gpio_out_w1ts_reg = (1 << ILI9341_D4);
		if(*x&32) *gpio_out_w1ts_reg = (1 << ILI9341_D5);
		if(*x&64) *gpio_out_w1ts_reg = (1 << ILI9341_D6);
		if(*x&128) *gpio_out_w1ts_reg = (1 << ILI9341_D7);

		datum |= ((*x&1) << ILI9341_D0);         // 17
		datum |= ((*x&2) << (ILI9341_D1-1));     // 5
		datum |= ((*x&4) << (ILI9341_D2-2));     // 18
		datum |= ((*x&8) << (ILI9341_D3-3));     // 19
		datum |= ((*x&16) << (ILI9341_D4-4));    // 21
		datum |= ((*x&32) << (ILI9341_D5-5));    // 22
		datum |= ((*x&64) << (ILI9341_D6-6));    // 23
		datum |= ((*x&128) << (ILI9341_D7-7));   // 25
*/
		datum |= ((*x&1) << 17);     // 17 - 0
		datum |= ((*x&2) << 4);      // 5  - 1
		datum |= ((*x&4) << 16);     // 18 - 2
		datum |= ((*x&8) << 16);     // 19 - 3
		datum |= ((*x&16) << 17);    // 21 - 4
		datum |= ((*x&32) << 17);    // 22 - 5
		datum |= ((*x&64) << 17);    // 23 - 6
		datum |= ((*x&128) << 18);   // 25 - 7

		*gpio_out_w1ts_reg = datum;
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

