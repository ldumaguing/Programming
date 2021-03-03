#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main ( int argc, char *argv[] ) {
   char *names[] = {"John", "Paul    ", "George", "Ringo"};
   printf ( "%s\n",  names[1] );

   //char *X = names[1];
   char X[] = "Paul    ";
   printf ( "1 %s\n",  X );
   printf ( "2:0 %c\n",  X[0] );
   printf ( "2:1 %c\n",  X[1] );

   X[0] = 'g';
   puts("...");
   char fish[] = "Fish";

   printf ( "%d\n",  strlen ( fish ) );
   // for ( int i=0; i<strlen ( fish ); i++ ) {
   // X[0] = fish[0];
//  X[0] = 75;
   // }
   printf ( "%s\n",  X );

   return 0;
}
