#include <stdio.h>
#include <string.h>
#include "myne.h"

void edge ( int argc, char *argv[] ) {
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

   if ( ( L1[0] % 2 ) == 0 ) {
      if ( strcmp ( argv[3], "D" ) == 0 ) {
         L1[1]++;
         printf ( "%.2d%.2d%s", L1[0], L1[1], "A" );
      } else {
         printf ( "%.2d%.2d%s", L1[0], L1[1], argv[3] );
      }
   } else {

   }
}
