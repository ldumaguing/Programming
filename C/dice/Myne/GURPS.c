#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void roll3d6 ( int, char **, char * );
void VS_scores ( int, char **, char * );

// *******************************************************************************
void GURPS ( int argc, char *argv[] ) {
   char printString[80];

   if ( argc == 4 ) {
      VS_scores ( argc, argv, printString );
      return;
   }

   roll3d6 ( argc, argv, printString );
   printf ( "%s", printString );
}

// *******************************************************************************
void VS_scores ( int argc, char *argv[], char *aString ) {
   char printString[80];
   char *my_argv[] = {"          3        ", "        e          ", "     34             "};

puts(my_argv[1]);
   sprintf ( my_argv[1], "%s", "33" );
puts(my_argv[1]);
   //roll3d6 ( 3, my_argv, printString );
   //printf ( "%s", printString );
}

// *******************************************************************************
void roll3d6 ( int argc, char *argv[], char *aString ) {
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
      sprintf ( aString, "crit-success:%d\n", esl - rolled );
      return;
   }

   if ( ( esl - rolled ) >= 10 ) {
      sprintf ( aString, "crit-success:%d\n", esl - rolled );
      return;
   }

   if ( rolled == 18 ) {
      sprintf ( aString, "crit-fail:%d\n", esl - rolled );
      return;
   }

   if ( ( rolled == 17 ) & ( esl <= 15 ) ) {
      sprintf ( aString, "crit-fail:%d\n", esl - rolled );
      return;
   }

   if ( rolled <= esl )
      sprintf ( aString, "success:%d\n", esl - rolled );
   else
      sprintf ( aString, "fail:%d\n", esl - rolled );
}
