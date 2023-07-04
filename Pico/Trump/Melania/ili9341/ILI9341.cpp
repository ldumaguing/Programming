// ************************************************************************************* ILI9341.cpp
static inline void pen_down();
static inline void pen_up();

int sio_write(const uint8_t *src, size_t len) {
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));

		pen_down();
		pen_up();

		len--;
		src++;
	} while (len > 0);
	
	return 0;
}

int sio_write(void *src, size_t len) {
	char *x = (char *)src;
	do {
		gpio_put_masked((0xff << ILI9341_D0), (*x << ILI9341_D0));

		pen_down();
		pen_up();

		len--;
		x++;
	} while (len > 0);
	
	return 0;
}

















void init_pins() {
	gpio_init_mask(0x1fff);
	gpio_set_dir_out_masked(0x1fff);
	gpio_set_mask(0x1fff);
}

static inline void cs_select() {
    //asm volatile("nop \n nop \n nop");
    gpio_put(ILI9341_CS, 0);  // Active low
    //asm volatile("nop \n nop \n nop");
}

static inline void cs_deselect() {
    //asm volatile("nop \n nop \n nop");
    gpio_put(ILI9341_CS, 1);
    //asm volatile("nop \n nop \n nop");
}

static inline void pen_down() {
    //asm volatile("nop \n nop \n nop");
    gpio_put(ILI9341_WR, 0);  // writing
    //asm volatile("nop \n nop \n nop");
}

static inline void pen_up() {
    //asm volatile("nop \n nop \n nop");
    gpio_put(ILI9341_WR, 1);  // not writing
    //asm volatile("nop \n nop \n nop");
}

void ili9341_set_command(uint8_t cmd) {
    cs_select();
    gpio_put(ILI9341_CD, 0);
    sio_write(&cmd, 1);
    gpio_put(ILI9341_CD, 1);
    cs_deselect();
}

void ili9341_command_param(uint8_t data) {
    cs_select();
    sio_write(&data, 1);
    cs_deselect();
}

void ili9341_write_data(void *buffer, int bytes) {
	// printf("buf: %x\n", buffer);
    cs_select();
    sio_write(buffer, bytes);
    cs_deselect();
}

void ili9341_write_data(const uint8_t *buffer, int bytes) {
	// printf("buf: %x\n", buffer);
    cs_select();
    sio_write(buffer, bytes);
    cs_deselect();
}

void ili9341_init() {
	init_pins();
	ili9341_set_command(0x01); //soft reset
	sleep_ms(1000);

	ili9341_set_command(ILI9341_GAMMASET);
	ili9341_command_param(0x01);

	// positive gamma correction
	ili9341_set_command(ILI9341_GMCTRP1);
    ili9341_write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	ili9341_set_command(ILI9341_GMCTRN1);
	ili9341_write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);

	// memory access control
	ili9341_set_command(ILI9341_MADCTL);
	ili9341_command_param(0x48);

	// pixel format
	ili9341_set_command(ILI9341_PIXFMT);
	ili9341_command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	ili9341_set_command(ILI9341_FRMCTR1);
	ili9341_command_param(0x00);
	ili9341_command_param(0x1B);

	// exit sleep
	ili9341_set_command(ILI9341_SLPOUT);

	// display on
	ili9341_set_command(ILI9341_DISPON);

	// column address set
	ili9341_set_command(ILI9341_CASET);
	ili9341_command_param(0x00);
	ili9341_command_param(0x00);  // start column
	ili9341_command_param(0x00);
	ili9341_command_param(0xef);  // end column -> 239

	// page address set
	ili9341_set_command(ILI9341_PASET);
	ili9341_command_param(0x00);
	ili9341_command_param(0x00);  // start page
	ili9341_command_param(0x01);
	ili9341_command_param(0x3f);  // end page -> 319

	ili9341_set_command(ILI9341_RAMWR);


}

uint16_t swap_bytes(uint16_t color) {
    return (color>>8) | (color<<8);
}

// *************************************************************************************************
void ILI9341::init() {
	init_pins();
	set_command(0x01); //soft reset
	sleep_ms(1000);

	set_command(ILI9341_GAMMASET);
	command_param(0x01);

	// positive gamma correction
	set_command(ILI9341_GMCTRP1);
    write_data((const uint8_t[15]){ 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 }, 15);

	// negative gamma correction
	set_command(ILI9341_GMCTRN1);
	write_data((const uint8_t[15]){ 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f }, 15);

	// memory access control
	set_command(ILI9341_MADCTL);
	command_param(0x48);

	// pixel format
	set_command(ILI9341_PIXFMT);
	command_param(0x55);  // 16-bit

	// frame rate; default, 70 Hz
	set_command(ILI9341_FRMCTR1);
	command_param(0x00);
	command_param(0x1B);

	// exit sleep
	set_command(ILI9341_SLPOUT);

	// display on
	set_command(ILI9341_DISPON);

	// column address set
	set_command(ILI9341_CASET);
	command_param(0x00);
	command_param(0x00);  // start column
	command_param(0x00);
	command_param(0xef);  // end column -> 239

	// page address set
	set_command(ILI9341_PASET);
	command_param(0x00);
	command_param(0x00);  // start page
	command_param(0x01);
	command_param(0x3f);  // end page -> 319

	set_command(ILI9341_RAMWR);


};

void ILI9341::set_command(uint8_t cmd) {
	cs_select();
    gpio_put(ILI9341_CD, 0);
    sio_write(&cmd, 1);
    gpio_put(ILI9341_CD, 1);
    cs_deselect();
};

void ILI9341::command_param(uint8_t data) {
	cs_select();
	sio_write(&data, 1);
	cs_deselect();
};

void ILI9341::write_data(void *buffer, int bytes) {
	cs_select();
	sio_write(buffer, bytes);
	cs_deselect();
};

void ILI9341::write_data(const uint8_t *buffer, int bytes) {
	cs_select();
	sio_write(buffer, bytes);
	cs_deselect();
};




ILI9341 ili = ILI9341();














