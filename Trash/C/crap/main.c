#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define X_lenMod cos(M_PI * (1.0/6.0))

float CartesianDistance(int *, int *);

int main(int argc, char *argv[]) {
   int FROM[] = {1, 1};
   int TO[] = {0, 0};
   printf("%f\n", CartesianDistance(FROM, TO));

   return 0;
}

// *******************************************************************************
float CartesianDistance(int *A, int *B) {
   if (A[1] == B[1])
      return (abs(A[0] - B[0]) * 1.0);


   float X = 0.0;
   float Y = (float)(abs(A[1] - B[1]) * X_lenMod);

   float Ax = A[0] * 1.0;
   float Bx = B[0] * 1.0;
   printf("Ax:%f   Bx:%f\n", Ax, Bx);
   if ((A[1] % 2) != 0) {
      Ax = A[0] + 0.5;
   }
   if ((B[1] % 2) != 0) {
      Bx = B[0] + 0.5;
   }
   X = Ax - Bx;

   return sqrt((X * X) + (Y * Y) * 1.0);
}
