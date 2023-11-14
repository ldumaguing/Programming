#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

int getInt(uint8_t *, int);

struct PadInputs {
	int index, dpad, buttons,
		axisX, axisY, axisRX, axisRY,
		brake, throttle,
		miscButtons;
} padinputs;

int getInt(uint8_t *str, int loc) {
	if(str[loc] == ' ') {
		uint8_t buff[16];
		int count=0;
		for(int i=loc; i<loc+4; i++) {
			buff[count] = str[i];
			count++;
		}
		buff[count] = 0;

		return atoi(buff);
	}

	return 0;
};



int main() {
	uint8_t X[] = "idx   1;   2;   3;   6, -29;   4,   5;   6;   7;   8";

	padinputs.index = getInt(X, 3);
	padinputs.dpad = getInt(X, 8);
	padinputs.buttons = getInt(X, 13);
	padinputs.axisX = getInt(X, 18);
	padinputs.axisY = getInt(X, 23);
	padinputs.axisRX = getInt(X, 28);
	padinputs.axisRY = getInt(X, 33);
	padinputs.brake = getInt(X, 38);
	padinputs.throttle = getInt(X, 43);
	padinputs.miscButtons = getInt(X, 48);

	printf(">%d\n", padinputs.index);
	printf(">%d\n", padinputs.dpad);
	printf(">%d\n", padinputs.buttons);
	printf(">%d\n", padinputs.axisX);
	printf(">%d\n", padinputs.axisY);
	printf(">%d\n", padinputs.axisRX);
	printf(">%d\n", padinputs.axisRY);
	printf(">%d\n", padinputs.brake);
	printf(">%d\n", padinputs.throttle);
	printf(">%d\n", padinputs.miscButtons);

	return 0;
}



