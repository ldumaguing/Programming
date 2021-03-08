#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

float getMultiplier ( char ** );
void vsDR ( int, int, float, int );

void generateDamage ( int argc, char *argv[] ) {
   int rolled = 0;
   int divisor = 1;
   float multiplier = 1;
   int DR = 0;
   int hardLVL = 0;

   char cmd[80];
   FILE *pipeDice;

   char buff1[80];

   // ********** define rolled.
   if ( 'r' == argv[1][0] ) {
      getGrep ( buff1, "[0-9].*", argv[1] );
      rolled = atoi ( buff1 );
   } else {
      strcpy ( cmd, "~/bin/dice" );

      getGrep ( buff1, "^[0-9dx+-]*", argv[1] );
      strcat ( cmd, " " );
      strcat ( cmd, buff1 );

      if ( ( pipeDice = popen ( cmd, "r" ) ) == NULL ) {
         perror ( "popen" );
         return;
      }

      fgets ( buff1, 80, pipeDice );
      fputs ( buff1, pipeDice );
      rolled = atoi ( buff1 );

      pclose ( pipeDice );
   }

   buff1[0] = 0;

   // ********** define divisor
   getGrep ( buff1, "[0-9]*)", argv[1] );
   if ( strlen ( buff1 ) > 0 ) {
      divisor = atoi ( buff1 );
   }

   // ********** define multiplier
   multiplier = getMultiplier ( argv );

   // ********** define DR
   if ( argc >= 4 ) DR = atoi ( argv[3] );

   // ********** define hardLVL
   if ( argc >= 5 ) hardLVL = atoi ( argv[4] );


   if ( ( hardLVL > 0 ) & ( divisor > 1 ) & ( DR > 0 ) ) {
      int divLVL[] = {10, 5, 3, 2, 1};
      int index = 4;
      for ( int i = 0; i < 5; i++ ) {
         if ( divisor == divLVL[i] ) {
            index = i;
            break;
         }
      }
      index += hardLVL;
      if ( index > 4 ) index = 4;
      divisor = divLVL[index];
   }

   if ( argc >= 4 )
      vsDR ( rolled, divisor, multiplier, DR );
   else {
      printf ( "%d\n", ( int ) ( rolled * multiplier ) );
   }
}

// -------------------------------------------------------------------------------
void vsDR ( int rolled, int divisor, float multiplier, int DR ) {
   DR = DR / divisor;
   rolled = rolled - DR;
   if ( rolled <= 0 )
      puts ( "0" );
   else  {
      rolled = rolled * multiplier;
      printf ( "%d\n", rolled );
   }
}

// ===============================================================================
float getMultiplier ( char *argv[] ) {
   if ( strcmp ( "cut", argv[2] ) == 0 ) return 1.5;
   if ( strcmp ( "pi+", argv[2] ) == 0 ) return 1.5;
   if ( strcmp ( "pi-", argv[2] ) == 0 ) return 0.5;
   if ( strcmp ( "p++", argv[2] ) == 0 ) return 2.0;
   if ( strcmp ( "imp", argv[2] ) == 0 ) return 2.0;

   return 1.0;
}

// *******************************************************************************
void getGrep ( char *kv, char *pattern, char *subject ) {
   regex_t regex;
   regmatch_t match;

   regcomp ( &regex, pattern, REG_EXTENDED );

   int w = 0;
   int begin, end, len;
   char *word = NULL;
   if ( regexec ( &regex, subject, 1, &match, 0 ) == 0 ) {
      begin = ( int ) match.rm_so;
      end = ( int ) match.rm_eo;
      len = end - begin;
      word = malloc ( len + 1 );

      for ( int i = begin; i < end; i++ ) {
         word[w] = subject[i];
         w++;
      }
      word[w] = 0;
   } else
      return;

   strcpy ( kv, word );

   free ( word );
   regfree ( &regex );
}
