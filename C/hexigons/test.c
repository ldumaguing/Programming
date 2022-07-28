#include <stdio.h>
#include <stdlib.h>

int main(void) {
	for (int x=0; x<360; x++) {
		if (((x >= 0) & (x <= 90)) | (x > 270))
			printf("%d\n", x);
		}
	
	return 0; }
