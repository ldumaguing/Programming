#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

// *******************************************************************************
void forward ( char *objName ) {
    // Move one hex in the facing direction
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );
    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );

    if ( ( Facing == NULL ) | ( Location == NULL ) ) return;

    int location[] = {0,0};
    location[0] = json_object_get_int ( json_object_array_get_idx ( Location, 0 ) );
    location[1] = json_object_get_int ( json_object_array_get_idx ( Location, 1 ) );

    if ( strstr ( json_object_get_string ( Facing ), "A" ) > 0 ) moveHex ( location, 0 );
    else if ( strstr ( json_object_get_string ( Facing ), "B" ) > 0 ) moveHex ( location, 1 );
    else if ( strstr ( json_object_get_string ( Facing ), "C" ) > 0 ) moveHex ( location, 2 );
    else if ( strstr ( json_object_get_string ( Facing ), "D" ) > 0 ) moveHex ( location, 3 );
    else if ( strstr ( json_object_get_string ( Facing ), "E" ) > 0 ) moveHex ( location, 4 );
    else if ( strstr ( json_object_get_string ( Facing ), "F" ) > 0 ) moveHex ( location, 5 );

    json_object_array_put_idx ( Location, 0, json_object_new_int ( location[0] ) );
    json_object_array_put_idx ( Location, 1, json_object_new_int ( location[1] ) );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void shove ( char *objName, char *ActStr ) {
    // Move one hex in the direction given in the ActionString
    printf ( "%s\n%s\n", objName, ActStr );
}

