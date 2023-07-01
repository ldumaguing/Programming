// ************************************************************************************* ILI9341.cpp
ILI9341::ILI9341(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst, uint8_t d0,
	int16_t w, int16_t h) {
	_cs = cs;
	_cd = cd;
	_wr = wr;
	_rd = rd;
	_rst = rst;
	_d0 = d0;
	_w = w;
	_h = h;
};

// ===============================================
void ILI9341::reset() {
	ili9341_set_command(0x01); //soft reset
	// sleep_ms(1000);
}

// ===============================================
void ILI9341::CD_Command() {
	MAGA_gpio_put(_cd, 0);
};

// ===============================================
void ILI9341::CD_Data() {
	MAGA_gpio_put(_cd, 1);
};
// ===============================================
void ILI9341::CS_Active() {
	MAGA_gpio_put(_cs, 0);
};

// ===============================================
void ILI9341::CS_Idle() {
	MAGA_gpio_put(_cs, 1);
};

// ===============================================
void ILI9341::WR_Idle() {
	MAGA_gpio_put(_wr, 1);
};

// ===============================================
void ILI9341::WR_Strobe() {
	MAGA_gpio_put(_wr, 0);
	MAGA_gpio_put(_wr, 1);
};

// ===============================================
void ILI9341::sio_write(const uint8_t *src, size_t len) {
	do {
		MAGA_gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));

		WR_Strobe();

		len--;
		src++;
	} while (len > 0);
};

// -----------------------------------------------
void ILI9341::sio_write(uint16_t *src, size_t len) {
	do {
		MAGA_gpio_put_masked((0xff << ILI9341_D0), (*src << ILI9341_D0));

		WR_Strobe();

		len--;
		src++;
	} while (len > 0);
};

// ===============================================
void ILI9341::init_pins() {
	MAGA_gpio_init_mask(0x1fff);
	MAGA_gpio_set_dir_out_masked(0x1fff);
	MAGA_gpio_set_mask(0x1fff);
};

// ===============================================
// ***** GPIO functions
void ILI9341::MAGA_gpio_init_mask(uint32_t aNum) {
	printf("gpio_init_mask(0x%x)\n", aNum);
};

void ILI9341::MAGA_gpio_set_dir_out_masked(uint32_t aNum) {
	printf("gpio_set_dir_out_masked(0x%x)\n", aNum);
};

void ILI9341::MAGA_gpio_set_mask(uint32_t aNum) {
	printf("gpio_set_mask(0x%x)\n", aNum);
};

void ILI9341::MAGA_gpio_put(uint32_t aPin, bool yN) {
	printf("gpio_put(0x%x, %d)\n", aPin, yN);
};

void ILI9341::MAGA_gpio_put_masked(uint32_t mask, uint32_t val) {
	printf("gpio_put_masked(0x%x, %d)\n", mask, val);
};

// ===============================================
// ***** ILI9341 stuffs
void ILI9341::ili9341_init() {
	init_pins();

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
};

void ILI9341::ili9341_set_command(uint8_t cmd) {
    CS_Active();
    CD_Command();
    sio_write(&cmd, 1);
    CD_Data();
    CS_Idle();
};

void ILI9341::ili9341_command_param(uint8_t data) {
    CS_Active();
    sio_write(&data, 1);
    CS_Idle();
};

void ILI9341::ili9341_write_data(const uint8_t *buffer, int bytes) {
    CS_Active();
    sio_write(buffer, bytes);
    CS_Idle();
};

void ILI9341::ili9341_write_data(uint16_t *buffer, int bytes) {
    CS_Active();
    sio_write(buffer, bytes);
    CS_Idle();
};

ILI9341 ili(ILI9341_CS, ILI9341_CD, ILI9341_WR, ILI9341_RD, ILI9341_RST, ILI9341_D0, ILI9341_WIDTH,
	ILI9341_HEIGHT);

