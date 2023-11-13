#include <stdio.h>
#include <stdint.h>
#include <string.h>

void defineSlice(uint8_t *, uint8_t *, uint8_t, uint8_t);

struct GameInputs {
	int index;
};

void defineSlice(uint8_t *buff, uint8_t *str, uint8_t begin, uint8_t chunk) {
	printf("\n");
	int count = 0;
	if(chunk <= 0) return;
	if(chunk > (strlen(str)-begin+1)) chunk = strlen(str)-begin+1;
	for(int i=begin; i<=chunk; i++) {
		buff[count] = str[i];
		count++;
	}
	buff[count] = 0;
	printf(">%s.\n", str);
	printf(">%s.\n", buff);
};
 



int main() {
	uint8_t buffer[100];
	uint8_t X[] = "idx   1;   2;   3;   6, -29;   4,   5;   6;   7;   8";
	defineSlice(buffer, X, 2, 1);
	printf(".%s\n", buffer);
	return 0;
}

/*
void dumpGamepad(ControllerPtr ctl) {
    Console.printf(
        "idx%4d;%4d;%4d;%4d,%4d;%4d,%4d;%4d;%4d;%4d\n",
        ctl->index(),        // Controller Index
        ctl->dpad(),         // DPAD
        ctl->buttons(),      // bitmask of pressed buttons
        ctl->axisX(),        // (-511 - 512) left X Axis
        ctl->axisY(),        // (-511 - 512) left Y axis
        ctl->axisRX(),       // (-511 - 512) right X axis
        ctl->axisRY(),       // (-511 - 512) right Y axis
        ctl->brake(),        // (0 - 1023): brake button
        ctl->throttle(),     // (0 - 1023): throttle (AKA gas) button
        ctl->miscButtons()  // bitmak of pressed "misc" buttons
    );
}
*/


