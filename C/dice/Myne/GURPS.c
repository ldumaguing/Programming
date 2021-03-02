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

   printf ( "rolled:%d;", rolled );
   if ( rolled <= 4 ) {
      printf ( "crit-success:%d\n", esl - rolled );
      return;
   }

   if ( ( esl - rolled ) >= 10 ) {
      printf ( "crit-success:%d\n", esl - rolled );
      return;
   }

   if ( rolled == 18 ) {
      printf ( "crit-fail:%d\n", esl - rolled );
      return;
   }

   if ( ( rolled == 17 ) & ( esl <= 15 ) ) {
      printf ( "crit-fail %d\n", esl - rolled );
      return;
   }

   if ( rolled <= esl )
      printf ( "success:%d\n", esl - rolled );
   else
      printf ( "fail:%d\n", esl - rolled );
}
