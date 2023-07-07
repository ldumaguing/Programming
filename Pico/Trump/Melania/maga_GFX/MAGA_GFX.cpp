// ************************************************************************************ MAGA_GFX.cpp
MAGA_GFX::MAGA_GFX(int16_t w, int16_t h) {
	WIDTH = w;
	HEIGHT = h;
};

/**************************************************************************/
/*!
    @brief      Set rotation setting for display
    @param  x   0 thru 3 corresponding to 4 cardinal rotations
*/
/**************************************************************************/
void MAGA_GFX::setRotation(uint8_t x) {
	rotation = (x & 3);
	switch (rotation) {
		case 0:
		case 2:
			_width = WIDTH;
			_height = HEIGHT;
			break;
		case 1:
		case 3:
			_width = HEIGHT;
			_height = WIDTH;
			break;
	}
}

