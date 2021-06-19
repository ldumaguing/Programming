#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

struct json_object *getJSON ( char ** );
void saveObject ( json_object *, char ** );

void insert ( char *argv[] ) {
    struct json_object *TheObj = getJSON ( argv );

    struct json_object *Tags;
    json_object_object_get_ex ( TheObj, "Tags", &Tags );
    json_object *aTag = json_object_new_string ( argv[2] );
    json_object_array_add ( Tags, aTag );

    saveObject ( TheObj, argv );
}

// *******************************************************************************
void saveObject ( json_object *TheObj, char *argv[] ) {
    char filename[100];
    strcpy ( filename, argv[1] );
    FILE *fp;
    fp = fopen ( filename, "w" );
    fputs ( json_object_to_json_string_ext ( TheObj, 0 ), fp );
    fclose ( fp );
}

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
