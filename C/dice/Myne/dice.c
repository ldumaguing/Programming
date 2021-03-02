#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <time.h>
#include "myne.h"

void getGrep ( char *, char *, char * );

void rollDice ( int argc, char *argv[] ) {
   char diceStr[40];
   strcpy ( diceStr, argv[1] );
   printf ( "%d\n", getRoll ( argc, diceStr ) );
}

// *******************************************************************************
int getRoll ( int argc, char *diceStr ) {
   char pattern[40];
   char modif[10];
   char base[10];
   char dicenum[10];

   // ***** modifier
   strcpy ( pattern, "[+x-][0-9].*" );
   getGrep ( modif, pattern, diceStr );
   if ( strlen ( modif ) == 0 ) strcpy ( modif, "0" );

   // ***** base die
   strcpy ( pattern, "d[0-9]*" );
   getGrep ( base, pattern, diceStr );
   strcpy ( pattern, "[0-9].*" );
   getGrep ( base, pattern, base );

   // ***** number of dice
   strcpy ( pattern, "^[0-9]*" );
   getGrep ( dicenum, pattern, diceStr );
   if ( strlen ( dicenum ) == 0 ) strcpy ( dicenum, "1" );

   // ***** roll the dice
   srand ( ( unsigned ) time ( NULL ) );
   int baseVal = atoi ( base );
   int dicenumVal = atoi ( dicenum );
   int total = 0;
   for ( int i = 0; i < dicenumVal; i++ ) {
      total += ( rand() % baseVal ) + 1;
   }

   int result = 0;

   // ***** modify dice result
   char anyX[10];
   strcpy ( pattern, "x" );
   getGrep ( anyX, pattern, diceStr );
   if ( strcmp ( anyX, "x" ) == 0 ) {
      char aString[10];
      getGrep ( aString, "[0-9].*", modif );
      int multip = atoi ( aString );
      result = total * multip;
   } else {
      total += atoi ( modif );
      result = total;
   }

   return result;
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
