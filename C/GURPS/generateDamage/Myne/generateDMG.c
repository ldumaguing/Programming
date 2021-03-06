#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

void generateDamage ( int argc, char *argv[] ) {
//   3d6+1(2)   p++   5   2
   int rolled;
   char buff[80];
   FILE *pipeDice;
   char readbuf[80];

   if ( ( pipeDice = popen ( "~/bin/dice 3d6", "r" ) ) == NULL ) {
      perror ( "popen" );
      return;
   }

   while ( fgets ( readbuf, 80, pipeDice ) ) {
      fputs ( readbuf, pipeDice );
      puts ( readbuf );
   }

   pclose ( pipeDice );

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
