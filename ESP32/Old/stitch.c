#include <stdio.h>

void main() {
	printf("yo\n");

	int len = 184;
	char BBB[184];
	int BBB_len = 0;
	char AAA[184];
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
			printf("%c %d\n", inputs[i], i-position-1);
			BBB_len = i-position-1;





		}
	} 

	printf("%s. %d\n", AAA, AAA_len);
	printf("\n");
	printf("%s! %d %d\n", BBB, BBB_len, position);

	for(int i=0; i<len; i++) {
		if (i > position) {
			printf(".%c\n", BBB[i - position -1]);
		}
	}
}




