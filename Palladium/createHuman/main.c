#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
   if ( argc < 2 )
      instruction();

   if ( argc == 2 )
      nameOnly ( argv );

   if (argc == 10)
       
   return 0;
}

// *******************************************************************************
void instruction() {
   printf ( "createHuman   NAME\n" );
   printf ( "     \"          \"    IQ ME MA PS PP PE PB Spd\n" );
}
