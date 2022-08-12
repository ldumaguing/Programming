#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

// ***************************************************************************************
int main(int argc, char* argv[]) {
	int x;
  struct timespec spec;
  if (clock_gettime(1, &spec) == -1) { /* 1 is CLOCK_MONOTONIC */
    abort();
  }

  x = spec.tv_sec * 1000 + spec.tv_nsec / 1e6;
printf("%d\n", x % 6);
	return 0;
}

