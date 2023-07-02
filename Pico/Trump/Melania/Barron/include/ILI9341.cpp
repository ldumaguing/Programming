// ************************************************************************************ ILI9341.cpp
ILI9341::ILI9341() {
	_cs = ILI9341_CS;
	_cd = ILI9341_CD;
	_wr = ILI9341_WR;
	_rd = ILI9341_RD;
	_rst = ILI9341_RST;
	_d0 = ILI9341_D0;
	_w = LCD_WIDTH;
	_h = LCD_HEIGHT;
};

void ILI9341::init() {
};

void ILI9341::set_command(uint8_t cmd) {
};

void ILI9341::command_param(uint8_t data) {
};

void write_data(void *buffer, int bytes) {
};

ILI9341 ili = ILI9341();

