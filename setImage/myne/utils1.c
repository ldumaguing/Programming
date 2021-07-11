#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include <regex.h>
#include "myne.h"

// *******************************************************************************
void saveObject ( struct json_object *TheObj, char *objName ) {
    char filename[100];
    strcpy ( filename, objName );
    FILE *fp;
    fp = fopen ( filename, "w" );
    fputs ( json_object_to_json_string_ext ( TheObj, 0 ), fp );
    fclose ( fp );
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

// *******************************************************************************
struct json_object *getJSON ( char *objName ) {
    FILE *fptr;

    char filename[100], c;
    char buff_64K[65536];

    strcpy ( filename, objName );

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

