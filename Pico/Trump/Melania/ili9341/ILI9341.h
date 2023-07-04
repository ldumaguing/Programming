// *************************************************************************************** ILI9341.h
// *************************************************************************************************
typedef struct {
    uint pin_cs;
    uint pin_dc;
    uint pin_wr;
    uint pin_rd;
    uint pin_reset;
    uint pin_d0;
    uint pin_d1;
    uint pin_d2;
    uint pin_d3;
    uint pin_d4;
    uint pin_d5;
    uint pin_d6;
    uint pin_d7;
} ili9341_config_t;

void ili9341_init();
void ili9341_set_command(uint8_t cmd);
void ili9341_command_param(uint8_t data);
void ili9341_write_data(void *buffer, int bytes);
void ili9341_write_data(const uint8_t *buffer, int bytes);

// ************************************************************************************************
struct ILI9341 {
	ILI9341();

	void init();
	void set_command(uint8_t cmd);
	void command_param(uint8_t data);
	void write_data(void *buffer, int bytes);
	void write_data(const uint8_t *buffer, int bytes);

	protected:
		uint _cs, _cd, _wr, _rd, _rst, _d0;
};


