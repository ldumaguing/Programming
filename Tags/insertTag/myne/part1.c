#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

void insert ( char *argv[] ) {
    struct json_object *TheObj = getJSON ( argv );

    struct json_object *Tags;
    json_object_object_get_ex ( TheObj, "Tags", &Tags );

    if ( hasTag ( Tags, argv[2] ) >= 0 ) return;

    json_object *aTag = json_object_new_string ( argv[2] );
    json_object_array_add ( Tags, aTag );

    saveObject ( TheObj, argv );
}


