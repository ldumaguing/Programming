#include <stdio.h>
#include "foo.h"
#include "bar.h"

int main() {
	printf("yo v04\n");
	foo();
    bar();
    printf("From CMakeLists.txt: %s, %d\n", CRAP, SIXSIXSIX);
	return 0;
}

