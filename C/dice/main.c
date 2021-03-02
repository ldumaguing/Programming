#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Myne/myne.h"

void instructions();

int main ( int argc, char *argv[] ) {
   if ( argc == 1 ) {
      instructions();
      return 0;
   }

   if ( strlen ( argv[1] ) > 0 ) {
      rollDice ( argc, argv );
      return 0;
   }

   return 0;
}

// *******************************************************************************
void instructions() {
   puts ( "dice   DiceString" );
   puts ( "---------------------------------------------------" );
   puts ( "DiceString:   e.g. d6, d8+1, 3d6, 3d6x2, d100, etc." );

}
