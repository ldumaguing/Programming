#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

void list ( char *argv[] ) {
    struct json_object *theObj = getJSON ( argv );
    struct json_object *Tags;
    json_object_object_get_ex ( theObj, "Tags", &Tags );

    struct json_object *aTag;
    int len = json_object_array_length ( Tags );
    int x = len - 1;
    for ( int i = 0; i < len; i++ ) {
        aTag = json_object_array_get_idx ( Tags, i );
        printf ( "%s", json_object_get_string ( aTag ) );
        if ( i < x ) printf ( ";" );
    }
}
