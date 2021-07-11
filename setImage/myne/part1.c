#include <stdio.h>
#include <stdlib.h>
#include "myne.h"
#include <json-c/json.h>

void setimage ( char *argv[] )
{
    struct json_object *Image;
    struct json_object *TheObj = getJSON ( argv[1] );
    json_object_object_get_ex ( TheObj, "Image", &Image );

    if ( Image == NULL ) return;

    json_object *X = json_object_new_string ( argv[2] );

    json_object_object_add ( TheObj, "Image", X );
    saveObject ( TheObj, argv[1] );
}
