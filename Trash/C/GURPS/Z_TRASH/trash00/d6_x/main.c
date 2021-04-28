#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int d6();

int main(int argc, char *argv[]) {
   int d = 1;
   if (argc > 1)
      d = atoi(argv[1]);

   srand((unsigned)time(NULL));

   int r = 0;

   for (int i = 0; i < d; i++) {
      r = r + d6();
   }

   char buff[256];
   sprintf(buff, ";Total Roll:%d", r);
   puts(buff);

   return 0;
}

// *******************************************************************************
int d6() {
   int X = (rand() % 6) + 1;
   return X;
}
