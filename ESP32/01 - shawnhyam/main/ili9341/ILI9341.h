// *************************************************************************************** ILI9341.h
// *************************************************************************************************
void ILI9341_init();
void ILI9341_set_command(uint8_t cmd);
void ILI9341_command_param(uint8_t data);
void ILI9341_write_data(void *buffer, int bytes);
void ILI9341_write_data(const uint8_t *buffer, int bytes);
void ILI9341_pin_reset();
void ILI9341_render();

// ************************************************** Adafruit base
void ILI9341_begin();


