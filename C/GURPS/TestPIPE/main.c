#include <stdio.h>

#define MAXSTRS 5

// ***** Pipe string array into the sort command.

int main ( void ) {
   int  cntr;
   FILE *pipe_fp;
   char *strings[MAXSTRS] = { "echo", "bravo", "alpha",
                              "charlie", "delta"
                            };

   /* Create one way pipe line with call to popen() */
   if ( ( pipe_fp = popen ( "sort", "w" ) ) == NULL ) {
      perror ( "popen" );
      return ( 1 );
   }

   /* Processing loop */
   for ( cntr=0; cntr<MAXSTRS; cntr++ ) {
      fputs ( strings[cntr], pipe_fp );
      fputc ( '\n', pipe_fp );
   }

   /* Close the pipe */
   pclose ( pipe_fp );

   return ( 0 );
}
