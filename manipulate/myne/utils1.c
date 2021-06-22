#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

// *******************************************************************************
struct json_object *getJSON ( char *argv[] ) {
    FILE *fptr;

    char filename[100], c;
    char buff_64K[65536];

    strcpy ( filename, argv[1] );

    // Open file
    fptr = fopen ( filename, "r" );
    if ( fptr == NULL ) {
        printf ( "Cannot open file \n" );
        exit ( 0 );
    }

    // Read contents from file
    c = fgetc ( fptr );
    int counter = 0;
    while ( c != EOF ) {
        buff_64K[counter] = c;
        counter++;
        c = fgetc ( fptr );
    }
    buff_64K[counter] = '\0';

    fclose ( fptr );

    return json_tokener_parse ( buff_64K );
}

