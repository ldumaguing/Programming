static inline void pen_down(uint8_t wr) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(wr, 0);  // writing
    //asm volatile("nop \n nop \n nop");
}

static inline void pen_up(uint8_t wr) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(wr, 1);  // not writing
    //asm volatile("nop \n nop \n nop");
}

int sio_write(const uint8_t *src, size_t len, uint8_t wr) {
	do {
		gpio_put_masked((0xff << 5), (*src << 5));

		pen_down(wr);
		pen_up(wr);

		len--;
		src++;
	} while (len > 0);
	
	return 0;
}

void init_pins() {
	gpio_init_mask(0x1fff);
	gpio_set_dir_out_masked(0x1fff);
	gpio_set_mask(0x1fff);
}

static inline void cs_select(uint8_t cs) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(cs, 0);  // Active low
    //asm volatile("nop \n nop \n nop");
}

static inline void cs_deselect(uint8_t cs) {
    //asm volatile("nop \n nop \n nop");
    gpio_put(cs, 1);
    //asm volatile("nop \n nop \n nop");
}

void ili9341_set_command(uint8_t cmd, uint8_t cs, uint8_t wr, uint8_t dc) {
    cs_select(cs);
    gpio_put(dc, 0);
    sio_write(&cmd, 1, wr);
    gpio_put(dc, 1);
    cs_deselect(cs);
}

void ili9341_command_param(uint8_t data, uint8_t cs, uint8_t wr) {
    cs_select(cs);
    sio_write(&data, 1, wr);
    cs_deselect(cs);
}

void ili9341_write_data(uint8_t *buffer, int bytes, uint8_t cs, uint8_t wr) {
    cs_select(cs);
    sio_write(buffer, bytes, wr);
    cs_deselect(cs);
}

void ili9341_init(uint8_t cs, uint8_t wr, uint8_t dc) {
	init_pins();
	ili9341_set_command(0x01, cs, wr, dc); //soft reset
	sleep_ms(1000);

	ili9341_set_command(ILI9341_GAMMASET, cs, wr, dc);
	ili9341_command_param(0x01, cs, wr);

	// positive gamma correction
	ili9341_set_command(ILI9341_GMCTRP1, cs, wr, dc);
	uint8_t x1[15] = { 0x0f, 0x31, 0x2b, 0x0c, 0x0e, 0x08, 0x4e, 0xf1, 0x37, 0x07, 0x10, 0x03, 0x0e, 0x09, 0x00 };
	ili9341_write_data(x1, 15, cs, wr);

	// negative gamma correction
	ili9341_set_command(ILI9341_GMCTRN1, cs, wr, dc);
	uint8_t x2[15] = { 0x00, 0x0e, 0x14, 0x03, 0x11, 0x07, 0x31, 0xc1, 0x48, 0x08, 0x0f, 0x0c, 0x31, 0x36, 0x0f };
	ili9341_write_data(x2, 15, cs, wr);

	// memory access control
	ili9341_set_command(ILI9341_MADCTL, cs, wr, dc);
	ili9341_command_param(0x48, cs, wr);

	// pixel format
	ili9341_set_command(ILI9341_PIXFMT, cs, wr, dc);
	ili9341_command_param(0x55, cs, wr);  // 16-bit

	// frame rate; default, 70 Hz
	ili9341_set_command(ILI9341_FRMCTR1, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x1B, cs, wr);

	// exit sleep
	ili9341_set_command(ILI9341_SLPOUT, cs, wr, dc);

	// display on
	ili9341_set_command(ILI9341_DISPON, cs, wr, dc);

	// column address set
	ili9341_set_command(ILI9341_CASET, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x00, cs, wr);  // start column
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0xef, cs, wr);  // end column -> 239

	// page address set
	ili9341_set_command(ILI9341_PASET, cs, wr, dc);
	ili9341_command_param(0x00, cs, wr);
	ili9341_command_param(0x00, cs, wr);  // start page
	ili9341_command_param(0x01, cs, wr);
	ili9341_command_param(0x3f, cs, wr);  // end page -> 319

	ili9341_set_command(ILI9341_RAMWR, cs, wr, dc);


}

uint16_t swap_bytes(uint16_t color) {
    return (color>>8) | (color<<8);
}

