// *************************************************************************************** ILI9341.h
// *************************************************************************************************
struct ILI9341 {
	int16_t WIDTH;
	int16_t HEIGHT;
	int16_t _width;
	int16_t _height;
	uint8_t rotation;
};

void ILI9341_init();
void ILI9341_set_command(uint8_t cmd);
void ILI9341_command_param(uint8_t data);
void ILI9341_write_data(void *buffer, int bytes);

// *************************************************************************************************
struct ILI9341 ili;

