#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define PI 3.14159265358979323846
#define X_lenMod cos(PI * (1.0/6.0))

float CartesianDistance(int *, int *);

int main(int argc, char *argv[]) {
   int a[] = {-2, -1};
   int L1a[] = {-1, -1};
   int L1[] = {-2, 0};
   int L1b[] = {-1, 0};
   int d[] = {-2, 1};
   int e[] = {-3, 0};
   int f[] = {-3, -1};

// uhiuhlkjh kj k
   int L2[] = {3, 0};
   printf(".......%f\n", CartesianDistance(a, L2));
   printf(".......%f\n", CartesianDistance(L1a, L2));
   //printf(".......%f\n", CartesianDistance(L1, L2));
   printf(".......%f\n", CartesianDistance(L1b, L2));
   printf(".......%f\n", CartesianDistance(d, L2));
   printf(".......%f\n", CartesianDistance(e, L2));
   printf(".......%f\n", CartesianDistance(f, L2));

   return 0;
}

// *******************************************************************************
float CartesianDistance(int *A, int *B) {
   float X = (float)(abs(A[0] - B[0]) * X_lenMod);
   float Y = 0.0;
   float Ay = 0;
   float By = 0;

   // printf("> %d\n", A[0]);

   if ((A[0] % 2) != 0) {
      //  puts("A is odd");
      Ay = A[1] + 0.5;
   }
   if ((B[0] % 2) != 0) {
      //   puts("B is odd");
      By = B[1] + 0.5;
   }

   Y = (Ay - By);
   return sqrt((X * X) + (Y * Y) * 1.0);
}
