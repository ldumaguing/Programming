typedef struct {
    spi_inst_t *port;
    uint pin_miso;
    uint pin_cs;
    uint pin_sck;
    uint pin_mosi;
    uint pin_reset;
    uint pin_dc;
} ili9341_config_t;

extern ili9341_config_t ili9341_config;




extern const uint8_t font6x8[];

void ili9341_init();
void ili9341_set_command(uint8_t cmd);
void ili9341_command_param(uint8_t data);
void ili9341_write_data(void *buffer, int bytes);
void ili9341_start_writing();
void ili9341_stop_writing();
void ili9341_write_data_continuous(void *biffer, int bytes);



