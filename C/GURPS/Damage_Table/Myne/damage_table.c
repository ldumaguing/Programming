#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

char damage[][20] = {"-",
                     "1d-6/1d-5", "1d-6/1d-5", "1d-5/1d-4", "1d-5/1d-4",
                     "1d-4/1d-3",  "1d-4/1d-3", "1d-3/1d-2",   "1d-3/1d-2",
                     "1d-2/1d-1",  "1d-2/1d",   "1d-1/1d+1",   "1d-1/1d+2",
                     "1d/2d-1",    "1d/2d",     "1d+1/2d+1",   "1d+1/2d+2",
                     "1d+2/3d-1",  "1d+2/3d",   "2d-1/3d+1",   "2d-1/3d+2",
                     "2d/4d-1",    "2d/4d",     "2d+1/4d+1",   "2d+1/4d+2",
                     "2d+2/5d-1",  "2d+2/5d",   "3d-1/5d+1",   "3d-1/5d+1",
                     "3d/5d+2",    "3d/5d+2",   "3d+1/6d-1",   "3d+1/6d-1",
                     "3d+2/6d",    "3d+2/6d",   "4d-1/6d+1",   "4d-1/6d+1",
                     "4d/6d+2",    "4d/6d+2",   "4d+1/7d-1",   "4d+1/7d-1",
                     "5d/7d+1",    "5d+2/8d-1", "6d/8d+1",     "7d-1/9d",
                     "7d+1/9d+2",  "8d/10d",    "8d+2/10d+2",  "9d/11d",
                     "9d+2/11d+2", "10d/12d",   "10d+2/12d+2", "11d/13d"
                    };

void getGrep ( char *, char *, char * ) ;

// *******************************************************************************
void thrust ( int argc, char *argv[] ) {
   char buff[40];

   int STR = atoi ( argv[1] );
   if ( ( STR >= 1 ) & ( STR <= 40 ) ) {
      strcpy ( buff, damage[STR] );
   } else   if ( ( STR > 40 ) & ( STR <= 100 ) ) {
      strcpy ( buff, damage[ ( ( STR - 40 ) / 5 ) + 40] );
   } else {
      sprintf ( buff, "%d%s%d%s", ( ( ( STR - 100 ) / 10 ) + 11 ), "d/",
                ( ( ( STR - 100 ) / 10 ) + 13 ), "d" );
   }

   char buff1[40];
   getGrep ( buff1, "^[0-9d+-]*", buff );

   puts ( buff1 );
}

// *******************************************************************************
void swing ( int argc, char *argv[] ) {
   char buff[40];

   int STR = atoi ( argv[1] );
   if ( ( STR >= 1 ) & ( STR <= 40 ) ) {
      strcpy ( buff, damage[STR] );
   } else   if ( ( STR > 40 ) & ( STR <= 100 ) ) {
      strcpy ( buff, damage[ ( ( STR - 40 ) / 5 ) + 40] );
   } else {
      sprintf ( buff, "%d%s%d%s", ( ( ( STR - 100 ) / 10 ) + 11 ), "d/",
                ( ( ( STR - 100 ) / 10 ) + 13 ), "d" );
   }

   char buff1[40];
   getGrep ( buff1, "[0-9d+-]*$", buff );

   puts ( buff1 );
}

// *******************************************************************************
void both ( int argc, char *argv[] ) {
   int STR = atoi ( argv[1] );
   if ( ( STR >= 1 ) & ( STR <= 40 ) ) {
      puts ( damage[STR] );
      return;
   }
   if ( ( STR > 40 ) & ( STR <= 100 ) ) {
      puts ( damage[ ( ( STR - 40 ) / 5 ) + 40] );
      return;
   }

   printf ( "%d%s%d%s\n", ( ( ( STR - 100 ) / 10 ) + 11 ), "d/",
            ( ( ( STR - 100 ) / 10 ) + 13 ), "d" );
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
