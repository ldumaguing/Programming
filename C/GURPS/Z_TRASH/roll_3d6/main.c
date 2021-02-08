#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int d6();
int roll_3d6();

int main(int argc, char *argv[]) {
   int r = roll_3d6();

   char buff[256];
   sprintf(buff, ";Rolled:%d", r);
   puts(buff);

   return 0;
}

// *******************************************************************************
int roll_3d6() {
   srand((unsigned)time(NULL));

   int X = 0;
   srand((unsigned)time(NULL));
   for (int i = 0; i < 3; i++) {
      X += d6();
   }

   return X;
}

// *******************************************************************************
int d6() {
   int X = (rand() % 6) + 1;
   return X;
}
