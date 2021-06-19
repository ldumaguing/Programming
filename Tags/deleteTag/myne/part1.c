#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

int getIndex ( struct json_object *, char ** );

// *******************************************************************************
void delete ( char *argv[] ) {
    struct json_object *theObj = getJSON ( argv );
    struct json_object *Tags;
    json_object_object_get_ex ( theObj, "Tags", &Tags );

    int i = getIndex ( Tags, argv );
    if ( i < 0 ) return;

    json_object_array_del_idx ( Tags, i, 1 );

    saveObj ( theObj, argv );
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

