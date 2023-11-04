void GFX_init();
void GFX_fillScreen(uint16_t);
void GFX_refreshScreen();

void GFX_drawPixel(int16_t, int16_t, uint16_t);
void GFX_drawFastRawHLine(int16_t, int16_t, int16_t, uint16_t);
void GFX_drawFastRawVLine(int16_t, int16_t, int16_t, uint16_t);
void GFX_drawFastVLine(int16_t, int16_t, int16_t, uint16_t);
void GFX_drawFastHLine(int16_t, int16_t, int16_t, uint16_t);
void GFX_writeLine(int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_drawLine(int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_drawRect(int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_drawCircle(int16_t, int16_t, int16_t, uint16_t);
void GFX_drawTriangle(int16_t, int16_t, int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_drawCircleHelper(int16_t, int16_t, int16_t, uint8_t, uint16_t);
void GFX_drawRoundRect(int16_t, int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_fillCircleHelper(int16_t, int16_t, int16_t, uint8_t, int16_t, uint16_t);
void GFX_fillCircle(int16_t, int16_t, int16_t, uint16_t);
void GFX_fillRect(int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_fillRoundRect(int16_t, int16_t, int16_t, int16_t, int16_t, uint16_t);
void GFX_fillTriangle(int16_t, int16_t, int16_t, int16_t, int16_t, int16_t, uint16_t);
 

 
