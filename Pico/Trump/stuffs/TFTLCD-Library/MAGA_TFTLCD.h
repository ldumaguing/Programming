#include "MAGA_GFX.h"

class MAGA_TFTLCD : public MAGA_GFX {
	public:
		MAGA_TFTLCD(uint8_t cs, uint8_t cd, uint8_t wr, uint8_t rd, uint8_t rst);
		MAGA_TFTLCD(void);
	
	private:
		void init();
		void setWriteDir(void);
};


