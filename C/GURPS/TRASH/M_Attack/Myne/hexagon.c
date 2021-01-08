// #define FUNC_NAME
// #define DEBUG_PRINT

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "hexagon.h"

#define PI 3.14159265358979323846
#define X_lenMod cos(PI * (1.0/6.0))

void moveA(int *);
void moveB(int *);
void moveC(int *);
void moveD(int *);
void moveE(int *);
void moveF(int *);
float CartesianDistance(int *, int *);
_Bool move_closer(int *, int *);
void moveHex(int *, int);
_Bool isSameHexLoc(int *, int *);

// *******************************************************************************
int HexDistance(int *L1, int *L2) {
#ifdef FUNC_NAME
   puts("HexDistance");
   printf("   f: %d, %d\n", L1[0], L1[1]);
   printf("   t: %d, %d\n", L2[0], L2[1]);
#endif

   if (isSameHexLoc(L1, L2)) return 0;

   int P[] = {L1[0], L1[1]};

   int count = 0;
#ifdef DEBUG_PRINT
   printf("---> (%d,%d)\n", P[0], P[1]);
#endif
   for (;;) {
#ifdef DEBUG_PRINT
      printf("   count: %d\n", count);
#endif
      if (move_closer(P, L2)) {
         count++;
         break;
      }
      count++;
#ifdef DEBUG_PRINT
      printf("(%d,%d)\n", P[0], P[1]);
#endif
   }
#ifdef DEBUG_PRINT
   printf("---> (%d,%d)\n", P[0], P[1]);
#endif

   return count;
}

// -------------------------------------------------------------------------------
_Bool move_closer(int *U, int *destination) {
#ifdef FUNC_NAME
   puts("move_closer");
#endif
#ifdef DEBUG_PRINT
   printf("   u: %d, %d\n", U[0], U[1]);
   printf("   d: %d, %d\n", destination[0], destination[1]);
#endif

   if (isSameHexLoc(U, destination)) return 1;

   int X[] = {U[0], U[1]};
   int Y[] = {0, 0};

   float dist = 0;
   float distX = 0.0;

   dist = CartesianDistance(X, destination) + 5;

   // if ((U[0] % 2) == 0) {         **** uncomment to modify path ****
   if (U[0] % 2) {
      for (int i = 0; i < 6; i++) {
#ifdef DEBUG_PRINT
         printf("   0> %d\n", i);
#endif
         moveHex(X, i);
         distX = CartesianDistance(X, destination);
         if (distX < dist) {
            dist = distX;
            Y[0] = X[0];
            Y[1] = X[1];
            if ((dist + distX) == 0.0) {
               U[0] = Y[0];
               U[1] = Y[1];
               return 1;
            }
         }

         // reset X
         X[0] = U[0];
         X[1] = U[1];
      }
   }
   else {
      for (int i = 0; i < 6; i++) {
#ifdef DEBUG_PRINT
         printf("   1> %d\n", i);
#endif
         moveHex(X, i);
         distX = CartesianDistance(X, destination);
         if (distX <= dist) {
            dist = distX;
            Y[0] = X[0];
            Y[1] = X[1];
            if ((dist + distX) == 0.0) {
               U[0] = Y[0];
               U[1] = Y[1];
               return 1;
            }
         }

         // reset X
         X[0] = U[0];
         X[1] = U[1];
      }
   }

   U[0] = Y[0];
   U[1] = Y[1];

   return 0;
}

// *******************************************************************************
_Bool isSameHexLoc(int *A, int *B) {
#ifdef FUNC_NAME
   puts("isSameHexLoc");
#endif
#ifdef DEBUG_PRINT
   printf("   A: %d, %d\n", A[0], A[1]);
   printf("   B: %d, %d\n", B[0], B[1]);
#endif
   return (A[0] == B[0]) & (A[1] == B[1]);
}

// *******************************************************************************
void moveHex(int *L, int direction) {
#ifdef FUNC_NAME
   puts("moveHex");
#endif
#ifdef DEBUG_PRINT
   printf("   %d, %d -> %d\n", L[0], L[1], direction);
#endif

   switch (direction) {
      case 0:
         moveA(L);
         break;
      case 1:
         moveB(L);
         break;
      case 2:
         moveC(L);
         break;
      case 3:
         moveD(L);
         break;
      case 4:
         moveE(L);
         break;
      default:
         moveF(L);
   }
}

// *******************************************************************************
float CartesianDistance(int *A, int *B) {
#ifdef FUNC_NAME
   puts("CartesianDistance");
#endif
#ifdef DEBUG_PRINT
   printf("   A: %d, %d\n", A[0], A[1]);
   printf("   B: %d, %d\n", B[0], B[1]);
#endif

   if (A[0] == B[0]) {
#ifdef DEBUG_PRINT
      printf("   %d == %d  %f\n", A[0], B[0], abs(A[1] - B[1]) * 1.0);
#endif
      return (abs(A[1] - B[1]) * 1.0);
   }

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
#ifdef DEBUG_PRINT
   printf("   (%f,%f)  %f.\n", X, Y, sqrt((X * X) + (Y * Y) * 1.0));
#endif

   return sqrt((X * X) + (Y * Y) * 1.0);
}

// *******************************************************************************
void moveA(int *L) {
   L[1] -= 1;
}
void moveB(int *L) {
   L[0]++;
   if (L[0] % 2)
      L[1]--;
}
void moveC(int *L) {
   L[0]++;
   if (!(L[0] % 2))
      L[1]++;
}
void moveD(int *L) {
   L[1] += 1;
}
void moveE(int *L) {
   L[0]--;
   if (!(L[0] % 2))
      L[1]++;
}
void moveF(int *L) {
   L[0]--;
   if (L[0] % 2)
      L[1]--;
}


