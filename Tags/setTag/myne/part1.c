#include <stdio.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

int hasTag ( struct json_object *, char * );

// *******************************************************************************
void set ( char *argv[] ) {
    struct json_object *theObj = getJSON ( argv );
    struct json_object *Tags;
    json_object_object_get_ex ( theObj, "Tags", &Tags );

    char *tag = argv[2];
    if ( hasColon ( tag ) ) {
        int i = hasTag ( Tags, tag );
        if ( i >= 0 ) {
            char buff[80];
            sprintf ( buff, "%s", argv[2] );

            char *key, *value;
            char *buff_p = buff;
            key = strtok_r ( buff_p, ":", &buff_p );
            value = strtok_r ( buff_p, ":", &buff_p );
            if ( value == NULL ) return;

            if ( hasPlusMinus ( value ) ) {
                printf ( "hasPlusMinus\n" );
                return;
            }

            sprintf ( buff, "%s:%s", key, value );
            json_object_array_put_idx ( Tags, i, json_object_new_string ( buff ) );

            saveObj ( theObj, argv );
        }
    }
}

// *******************************************************************************
int hasTag ( struct json_object *Tags, char *tag ) {
    char buff[80];
    sprintf ( buff, "%s", tag );
    char *scratch, *tagName;
    tagName = strtok_r ( buff, ":", &scratch );

    return getIndex ( Tags, tagName );
}


