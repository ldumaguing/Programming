#include <stdio.h>
#include <stdlib.h>

void do_round ( char *argv[] ) {
    printf ( "do_round\n" );

    FILE *file;
    char buff[80];
    file = fopen ( "requests.txt", "r" );

    while ( fgets ( buff, 80, file ) ) {
        printf ( "%s\n", buff );
    }
}

