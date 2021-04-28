#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main ( int argc, char *argv[] ) {
   char *names[3];

   names[0] = ( char * ) malloc ( strlen ( "John" )+1 );
   strcpy ( names[0], "John" );

   names[1] = ( char * ) malloc ( strlen ( "Paul" )+1 );
   strcpy ( names[1], "Paul" );

   names[2] = ( char * ) malloc ( strlen ( "George" )+1 );
   strcpy ( names[2], "George" );

   puts ( names[0] );
   puts ( names[1] );
   puts ( names[2] );

   free ( names[0] );
   free ( names[1] );
   free ( names[2] );

   return 0;
}
