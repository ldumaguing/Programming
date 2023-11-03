#include <stdio.h>

void main() {
	printf("yo\n");

	int len = 184;
	char BBB[184];
	//BBB[0] = 0;
	int BBB_len = 0;
	char AAA[184];
	//AAA[0] = 0;
	int AAA_len = 0;
	char inputs[] = "FISH ads fsadf sadf sa asd fsadf dsaf sadf asdf asdf dsaf sadf adsf asd>>>\n<<<sdf asdf asdf sad fasdf asd fsadf asdf asdf sadf asdf asdf sadf asdf asdf asdf ajjsdf asdf asfasd fasLARRY";

	int mode = 0;
	int position = 0;

	for(int i=0; i<len; i++) {
		if (mode == 0) {
			if (inputs[i] == '\n') {
				mode = 1;
				position = i;
				AAA[i] = 0;
				AAA_len = i;
			}
			else
				AAA[i] = inputs[i];
		} else { // mode 1
			BBB[i-position-1] = inputs[i];
			BBB_len = i-position;
		}
	} 

	if(position>0) {
		for(int i=0; i<BBB_len; i++) {
			inputs[i] = BBB[i];
		}
		for(int i=0; i<AAA_len; i++) {
			inputs[i+BBB_len] = AAA[i];
		}

		inputs[len-1] = 0;
	}

	printf("\n%s\n\n", inputs);
}




