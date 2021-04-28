#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "myne.h"

int d6();

// *******************************************************************************
int roll_d6_X_times(int X) {
   srand((unsigned)time(NULL));

   int count = 0;
   for (int i = 0; i < X; i++) {
      count = count + d6();
   }

   return count;
}

// *******************************************************************************
int roll_3d6() {
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

