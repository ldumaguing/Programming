#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include "myne.h"

void forward ( char *objName, char *ActStr ) {
    // Move one hex in the facing direction
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );
    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );

    if ( ( Facing == NULL ) | ( Location == NULL ) | ( ActStr == NULL ) ) return;

    printf ( "%s\n%s\n", objName, ActStr );
}

// *******************************************************************************
void shove ( char *objName, char *ActStr ) {
    // Move one hex in the direction given in the ActionString
    printf ( "%s\n%s\n", objName, ActStr );
}

