#include <stdio.h>
#include <stdlib.h>
#include <math.h>

float CartesianDistance(int *, int *);

int main(int argc, char *argv[]) {
   int FROM[] = {0, 0};
   int TO[] = {3, 3};
   printf("%d\n", CartesianDistance(FROM, TO));

   return 0;
}

// *******************************************************************************
float CartesianDistance(int *A, int *B) {
   if (A[1] == B[1])
      return (abs(A[0] - B[0]) * 1.0);

   float X = 0;
   float Y = 0;

   /*
   float X = (float)(abs(A[0] - B[0]) * X_lenMod);
   float Y = 0.0;
   float Ay = A[1] * 1.0;
   float By = B[1] * 1.0;

   if ((A[0] % 2) != 0) {
    Ay = A[1] + 0.5;
   }
   if ((B[0] % 2) != 0) {
    By = B[1] + 0.5;
   }

   Y = (Ay - By);
   */

   return sqrt((X * X) + (Y * Y) * 1.0);
}
