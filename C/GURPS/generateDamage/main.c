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

   return 0;
}

// *******************************************************************************
void instructions() {
   puts ( "generateDamage   Dice   DamageType" );
   puts ( "       \"         \"       \"         DR*" );
   puts ( "       \"         \"       \"               HardenedLevel*" );
   puts ( "-----------------------------------------------------------------------" );
   puts ( "Examples:" );
   puts ( "   generateDamage   3d6+1      p++" );
   puts ( "   generateDamage   3d6+1(2)   p++" );
   puts ( "   generateDamage   3d6+1(2)   p++   5" );
   puts ( "   generateDamage   3d6+1(2)   p++   5   2" );
   puts ( "" );
   puts ( "* Target's damage resistance." );
}
