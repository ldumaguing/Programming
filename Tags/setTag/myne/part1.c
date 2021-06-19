#include <stdio.h>
#include <json-c/json.h>
#include "myne.h"

// *******************************************************************************
void set ( char *argv[] ) {
    struct json_object *theObj = getJSON ( argv );
    struct json_object *Tags;
    json_object_object_get_ex ( theObj, "Tags", &Tags );

    printf ( "%d\n", hasColon ( argv ) );
}




