#include <stdio.h>
#include "foo.h"
#include "bar.h"

int main() {
	printf("yo v04\n");
	foo();
    bar();
    printf("From CMakeLists.txt: %s, %d\n", CRAP, SIXSIXSIX);
	#ifdef ESP32S3
	printf("s3 mode\n");
	#else
	printf("Normal mode\n");
	#endif
	return 0;
}

