#include <stdio.h>
#include <stdlib.h>
#include "myne.h"
#include <json-c/json.h>

void setid ( char *argv[] )
{
    struct json_object *Id;
    struct json_object *TheObj = getJSON ( argv[1] );
    json_object_object_get_ex ( TheObj, "Id", &Id );

    if ( Id == NULL ) return;

    printf("setId\n");

    json_object *X = json_object_new_string ( argv[2] );

    json_object_object_add ( TheObj, "Id", X );
    saveObject ( TheObj, argv[1] );
}
