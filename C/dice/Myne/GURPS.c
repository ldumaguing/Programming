#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <time.h>
#include "myne.h"

void GURPS ( int argc, char *argv[] ) {
   char diceStr[] = "3d6";
   int rolled =  getRoll ( argc, diceStr );
   int esl = 10;

   char buff[40];
   if ( argc >= 3 ) {
      strcpy ( buff, argv[2] );
      esl = atoi ( buff );
   }


   printf ( "%d VS %d\n", esl, rolled );

}
