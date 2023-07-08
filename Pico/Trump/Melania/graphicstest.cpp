// *************************************************************************************************
void testText();

// *************************************************************************************************
int main() {
	ili.begin();

	for(;;) {
		for(uint8_t rotation=0; rotation<4; rotation++) {
			ili.setRotation(rotation);
			testText();
			sleep_ms(1000);
		}
	}

	return 0;
}



/*
void testFillScreen() {
  void start = micros();
  ili.fillScreen(ILI9341_BLACK);
  yield();
  ili.fillScreen(ILI9341_RED);
  yield();
  ili.fillScreen(ILI9341_GREEN);
  yield();
  ili.fillScreen(ILI9341_BLUE);
  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();
  
}
*/




void testText() {
	ili.fillScreen(ILI9341_BLACK);
/*
  void start = micros();
  ili.setCursor(0, 0);
  ili.setTextColor(ILI9341_WHITE);  ili.setTextSize(1);
  ili.println("Hello World!");
  ili.setTextColor(ILI9341_YELLOW); ili.setTextSize(2);
  ili.println(1234.56);
  ili.setTextColor(ILI9341_RED);    ili.setTextSize(3);
  ili.println(0xDEADBEEF, HEX);
  ili.println();
  ili.setTextColor(ILI9341_GREEN);
  ili.setTextSize(5);
  ili.println("Groop");
  ili.setTextSize(2);
  ili.println("I implore thee,");
  ili.setTextSize(1);
  ili.println("my foonting turlingdromes.");
  ili.println("And hooptiously drangle me");
  ili.println("with crinkly bindlewurdles,");
  ili.println("Or I will rend thee");
  ili.println("in the gobberwarts");
  ili.println("with my blurglecruncheon,");
  ili.println("see if I don't!");
  */
}




/*
void testLines(uint16_t color) {
  void start, t;
  int           x1, y1, x2, y2,
                w = ili.width(),
                h = ili.height();

  ili.fillScreen(ILI9341_BLACK);
  yield();
  
  x1 = y1 = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t     = micros() - start; // fillScreen doesn't count against timing

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = 0;
  y2    = h - 1;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = 0;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = w - 1;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);
  t    += micros() - start;

  yield();
  ili.fillScreen(ILI9341_BLACK);
  yield();

  x1    = w - 1;
  y1    = h - 1;
  y2    = 0;
  start = micros();
  for(x2=0; x2<w; x2+=6) ili.drawLine(x1, y1, x2, y2, color);
  x2    = 0;
  for(y2=0; y2<h; y2+=6) ili.drawLine(x1, y1, x2, y2, color);

  yield();
  
}
*/



/*
void testFastLines(uint16_t color1, uint16_t color2) {
  void start;
  int           x, y, w = ili.width(), h = ili.height();

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(y=0; y<h; y+=5) ili.drawFastHLine(0, y, w, color1);
  for(x=0; x<w; x+=5) ili.drawFastVLine(x, 0, h, color2);
}
*/



/*
void testRects(uint16_t color) {
  void start;
  int           n, i, i2,
                cx = ili.width()  / 2,
                cy = ili.height() / 2;

  ili.fillScreen(ILI9341_BLACK);
  n     = min(ili.width(), ili.height());
  start = micros();
  for(i=2; i<n; i+=6) {
    i2 = i / 2;
    ili.drawRect(cx-i2, cy-i2, i, i, color);
  }
}
*/



/*
void testFilledRects(uint16_t color1, uint16_t color2) {
  void start, t = 0;
  int           n, i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  n = min(ili.width(), ili.height());
  for(i=n; i>0; i-=6) {
    i2    = i / 2;
    start = micros();
    ili.fillRect(cx-i2, cy-i2, i, i, color1);
    t    += micros() - start;
    // Outlines are not included in timing results
    ili.drawRect(cx-i2, cy-i2, i, i, color2);
    yield();
  }

  return t;
}
*/



/*
void testFilledCircles(uint8_t radius, uint16_t color) {
  void start;
  int x, y, w = ili.width(), h = ili.height(), r2 = radius * 2;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(x=radius; x<w; x+=r2) {
    for(y=radius; y<h; y+=r2) {
      ili.fillCircle(x, y, radius, color);
    }
  }

  
}
*/



/*
void testCircles(uint8_t radius, uint16_t color) {
  void start;
  int           x, y, r2 = radius * 2,
                w = ili.width()  + radius,
                h = ili.height() + radius;

  // Screen is not cleared for this one -- this is
  // intentional and does not affect the reported time.
  start = micros();
  for(x=0; x<w; x+=r2) {
    for(y=0; y<h; y+=r2) {
      ili.drawCircle(x, y, radius, color);
    }
  }
}
*/



/*
void testTriangles() {
  void start;
  int           n, i, cx = ili.width()  / 2 - 1,
                      cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  n     = min(cx, cy);
  start = micros();
  for(i=0; i<n; i+=5) {
    ili.drawTriangle(
      cx    , cy - i, // peak
      cx - i, cy + i, // bottom left
      cx + i, cy + i, // bottom right
      ili.color565(i, i, i));
  }
}
*/



/*
void testFilledTriangles() {
  void start, t = 0;
  int           i, cx = ili.width()  / 2 - 1,
                   cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(cx,cy); i>10; i-=5) {
    start = micros();
    ili.fillTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      ili.color565(0, i*10, i*10));
    t += micros() - start;
    ili.drawTriangle(cx, cy - i, cx - i, cy + i, cx + i, cy + i,
      ili.color565(i*10, i*10, 0));
    yield();
  }

  return t;
}
*/



/*
void testRoundRects() {
  void start;
  int           w, i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  w     = min(ili.width(), ili.height());
  start = micros();
  for(i=0; i<w; i+=6) {
    i2 = i / 2;
    ili.drawRoundRect(cx-i2, cy-i2, i, i, i/8, ili.color565(i, 0, 0));
  }
}
*/



/*
void testFilledRoundRects() {
  void start;
  int           i, i2,
                cx = ili.width()  / 2 - 1,
                cy = ili.height() / 2 - 1;

  ili.fillScreen(ILI9341_BLACK);
  start = micros();
  for(i=min(ili.width(), ili.height()); i>20; i-=6) {
    i2 = i / 2;
    ili.fillRoundRect(cx-i2, cy-i2, i, i, i/8, ili.color565(0, i, 0));
    yield();
  }
}
*/

