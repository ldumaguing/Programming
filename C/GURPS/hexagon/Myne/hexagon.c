#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "myne.h"

#define X_lenMod cos(M_PI * (1.0/6.0))

void moveA ( int * );
void moveB ( int * );
void moveC ( int * );
void moveD ( int * );
void moveE ( int * );
void moveF ( int * );
float CartesianDistance ( int *, int * );
_Bool move_closer ( int *, int * );
void moveHex ( int *, int );
_Bool isSameHexLoc ( int *, int * );
int HexDistance ( int *, int * );
void text2int ( int *, int *, char ** );


void other ( int argc, char *argv[] ) {
   if ( argc != 4 ) return;

   char from[] = "0000";

   int len = strlen ( argv[2] );
   int count = len;
   for ( int i=0; i<len; i++ ) {
      from[3 - i] = argv[2][--count];
   }

   int L1[2] = {0, 0};
   L1[0] = getX ( from );
   L1[1] = getY ( from );

   if ( strcmp ( argv[3], "A" ) == 0 ) moveHex ( L1, 0 );
   if ( strcmp ( argv[3], "B" ) == 0 ) moveHex ( L1, 1 );
   if ( strcmp ( argv[3], "C" ) == 0 ) moveHex ( L1, 2 );
   if ( strcmp ( argv[3], "D" ) == 0 ) moveHex ( L1, 3 );
   if ( strcmp ( argv[3], "E" ) == 0 ) moveHex ( L1, 4 );
   if ( strcmp ( argv[3], "F" ) == 0 ) moveHex ( L1, 5 );

   printf ( "%.2d%.2d", L1[0], L1[1] );
}

// *******************************************************************************
void deg ( int argc, char *argv[] ) {
   if ( argc != 4 ) return;

   int A[2] = {0, 0};
   int B[2] = {0, 0};

   text2int ( A, B, argv );

   if ( ( A[0] == B[0] ) & ( A[1] == B[1] ) ) {
      printf ( "same location" );
      return;
   }

   if ( A[0] == B[0] ) {
      if ( A[1] < B[1] )
         printf ( "270.0" );
      else
         printf ( "90.0" );

      return;
   }


   float X = ( float ) ( ( B[0] - A[0] ) * X_lenMod );
   float Y = 0.0;
   float Ay = A[1] * 1.0;
   float By = B[1] * 1.0;

   if ( ( A[0] % 2 ) != 0 ) {
      Ay = A[1] + 0.5;
   }
   if ( ( B[0] % 2 ) != 0 ) {
      By = B[1] + 0.5;
   }

   Y = 0 - ( By - Ay );

   float d = atan ( Y / X ) * ( 180.0 / M_PI );
   int D = round ( d );

   if ( ( D - d ) < 0.000001 ) {
      if ( ( X > 0 ) & ( Y > 0 ) )
         printf ( "%d.0", D );
      if ( ( X < 0 ) & ( Y > 0 ) )
         printf ( "%d.0", D + 180 );
      if ( ( X < 0 ) & ( Y < 0 ) )
         printf ( "%d.0", D + 180 );
      if ( ( X > 0 ) & ( Y < 0 ) )
         printf ( "%d.0", D + 360 );
   } else {
      if ( ( X > 0 ) & ( Y > 0 ) )
         printf ( "%.12lf", d );
      if ( ( X < 0 ) & ( Y > 0 ) )
         printf ( "%.12lf", d + 180.0 );
      if ( ( X < 0 ) & ( Y < 0 ) )
         printf ( "%.12lf", d + 180.0 );
      if ( ( X > 0 ) & ( Y < 0 ) )
         printf ( "%.12lf", d + 360.0 );
   }
}

// *******************************************************************************
void cdist ( int argc, char *argv[] ) {
   if ( argc != 4 ) return;

   int L1[2] = {0, 0};
   int L2[2] = {0, 0};

   text2int ( L1, L2, argv );

   printf ( "%.12lf",CartesianDistance ( L1, L2 ) );
}

// *******************************************************************************
void path ( int argc, char *argv[] ) {
   if ( argc != 4 ) return;

   int L1[2] = {0, 0};
   int L2[2] = {0, 0};

   text2int ( L1, L2, argv );

   while ( !move_closer ( L1, L2 ) ) {
      printf ( "%.2d%.2d,", L1[0],L1[1] );
   }
   printf ( "%.2d%.2d", L2[0],L2[1] );
}

// *******************************************************************************
void hdist ( int argc, char *argv[] ) {
   if ( argc != 4 ) return;

   int L1[2] = {0, 0};
   int L2[2] = {0, 0};

   text2int ( L1, L2, argv );

   printf ( "%d", HexDistance ( L1, L2 ) );
}

// ===============================================================================
void text2int ( int *L1, int *L2, char *argv[] ) {
   char from[] = "0000";
   char to[] = "0000";

   int len = strlen ( argv[2] );
   int count = len;
   for ( int i=0; i<len; i++ ) {
      from[3 - i] = argv[2][--count];
   }
   len = strlen ( argv[3] );
   count = len;
   for ( int i=0; i<len; i++ ) {
      to[3 - i] = argv[3][--count];
   }

   L1[0] = getX ( from );
   L1[1] = getY ( from );
   L2[0] = getX ( to );
   L2[1] = getY ( to );
}

// ===============================================================================
int getY ( char *location ) {
   if ( strlen ( location ) != 4 ) return 0;
   char Y[2];
   Y[0] = location[2];
   Y[1] = location[3];
   return atoi ( Y );
}

// -------------------------------------------------------------------------------
int getX ( char *location ) {
   if ( strlen ( location ) != 4 ) return 0;
   char X[2];
   X[0] = location[0];
   X[1] = location[1];
   return atoi ( X );
}

// *******************************************************************************
int HexDistance ( int *L1, int *L2 ) {
   if ( isSameHexLoc ( L1, L2 ) ) return 0;

   int P[] = {L1[0], L1[1]};

   int count = 0;

   for ( ;; ) {
      if ( move_closer ( P, L2 ) ) {
         count++;
         break;
      }
      count++;
   }

   return count;
}

// -------------------------------------------------------------------------------
_Bool move_closer ( int *U, int *destination ) {
   if ( isSameHexLoc ( U, destination ) ) return 1;

   int X[] = {U[0], U[1]};
   int Y[] = {0, 0};

   float dist = 0;
   float distX = 0.0;

   dist = CartesianDistance ( X, destination ) + 5;

   // if ((U[0] % 2) == 0) {         **** uncomment to modify path ****
   if ( U[0] % 2 ) {
      for ( int i = 0; i < 6; i++ ) {
         moveHex ( X, i );
         distX = CartesianDistance ( X, destination );
         if ( distX < dist ) {
            dist = distX;
            Y[0] = X[0];
            Y[1] = X[1];
            if ( ( dist + distX ) == 0.0 ) {
               U[0] = Y[0];
               U[1] = Y[1];
               return 1;
            }
         }

         // reset X
         X[0] = U[0];
         X[1] = U[1];
      }
   } else {
      for ( int i = 0; i < 6; i++ ) {
         moveHex ( X, i );
         distX = CartesianDistance ( X, destination );
         if ( distX <= dist ) {
            dist = distX;
            Y[0] = X[0];
            Y[1] = X[1];
            if ( ( dist + distX ) == 0.0 ) {
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
_Bool isSameHexLoc ( int *A, int *B ) {
   return ( A[0] == B[0] ) & ( A[1] == B[1] );
}

// *******************************************************************************
void moveHex ( int *L, int direction ) {
   switch ( direction ) {
   case 0:
      moveA ( L );
      break;
   case 1:
      moveB ( L );
      break;
   case 2:
      moveC ( L );
      break;
   case 3:
      moveD ( L );
      break;
   case 4:
      moveE ( L );
      break;
   default:
      moveF ( L );
   }
}

// *******************************************************************************
float CartesianDistance ( int *A, int *B ) {
   if ( A[0] == B[0] ) {
      return ( abs ( A[1] - B[1] ) * 1.0 );
   }

   float X = ( float ) ( abs ( A[0] - B[0] ) * X_lenMod );
   float Y = 0.0;
   float Ay = A[1] * 1.0;
   float By = B[1] * 1.0;

   if ( ( A[0] % 2 ) != 0 ) {
      Ay = A[1] + 0.5;
   }
   if ( ( B[0] % 2 ) != 0 ) {
      By = B[1] + 0.5;
   }

   Y = ( Ay - By );

   return sqrt ( ( X * X ) + ( Y * Y ) * 1.0 );
}

// *******************************************************************************
void moveA ( int *L ) {
   L[1] -= 1;
}
void moveB ( int *L ) {
   L[0]++;
   if ( L[0] % 2 )
      L[1]--;
}
void moveC ( int *L ) {
   L[0]++;
   if ( ! ( L[0] % 2 ) )
      L[1]++;
}
void moveD ( int *L ) {
   L[1] += 1;
}
void moveE ( int *L ) {
   L[0]--;
   if ( ! ( L[0] % 2 ) )
      L[1]++;
}
void moveF ( int *L ) {
   L[0]--;
   if ( L[0] % 2 )
      L[1]--;
}



