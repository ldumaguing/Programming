#include <stdio.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

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


// *******************************************************************************
int getIndex ( struct json_object *Tags, char *argv[] ) {
    int X = -1;

    int len = json_object_array_length ( Tags );
    if ( len == 0 ) return X;

    char *scratch, *tagName, *delimiter = ":";
    int count = 0;
    char *tagString;
    struct json_object *aTag;
    int i;
    for ( i = 0; i < len; i++ ) {
        aTag = json_object_array_get_idx ( Tags, i );
        asprintf ( &tagString, "%s", json_object_get_string ( aTag ) );
        tagName = strtok_r ( tagString, delimiter, &scratch );
        if ( strcmp ( tagName, argv[2] ) == 0 ) {
            X = count;
            free ( tagString );
            return X;
        }
        free ( tagString );
        count++;
    }

    return X;
}

