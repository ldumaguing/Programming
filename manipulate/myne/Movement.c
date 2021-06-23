#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

// *******************************************************************************
void aboutface ( char *objName ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    char ActStr[80];
    sprintf ( ActStr, "%s", json_object_get_string ( Facing ) );
    json_object *X = json_object_new_string ( "x" );;
    if ( strstr ( ActStr, "A" ) > 0 ) X = json_object_new_string ( "D" );
    else if ( strstr ( ActStr, "B" ) > 0 ) X = json_object_new_string ( "E" );
    else if ( strstr ( ActStr, "C" ) > 0 ) X = json_object_new_string ( "F" );
    else if ( strstr ( ActStr, "D" ) > 0 ) X = json_object_new_string ( "A" );
    else if ( strstr ( ActStr, "E" ) > 0 ) X = json_object_new_string ( "B" );
    else X = json_object_new_string ( "C" );

    json_object_object_add ( theObj, "Facing", X );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void turnLeft ( char *objName ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    char ActStr[80];
    sprintf ( ActStr, "%s", json_object_get_string ( Facing ) );
    json_object *X = json_object_new_string ( "x" );;
    if ( strstr ( ActStr, "A" ) > 0 ) X = json_object_new_string ( "F" );
    else if ( strstr ( ActStr, "B" ) > 0 ) X = json_object_new_string ( "A" );
    else if ( strstr ( ActStr, "C" ) > 0 ) X = json_object_new_string ( "B" );
    else if ( strstr ( ActStr, "D" ) > 0 ) X = json_object_new_string ( "C" );
    else if ( strstr ( ActStr, "E" ) > 0 ) X = json_object_new_string ( "D" );
    else X = json_object_new_string ( "E" );

    json_object_object_add ( theObj, "Facing", X );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void turnRight ( char *objName ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    char ActStr[80];
    sprintf ( ActStr, "%s", json_object_get_string ( Facing ) );
    json_object *X = json_object_new_string ( "x" );;
    if ( strstr ( ActStr, "A" ) > 0 ) X = json_object_new_string ( "B" );
    else if ( strstr ( ActStr, "B" ) > 0 ) X = json_object_new_string ( "C" );
    else if ( strstr ( ActStr, "C" ) > 0 ) X = json_object_new_string ( "D" );
    else if ( strstr ( ActStr, "D" ) > 0 ) X = json_object_new_string ( "E" );
    else if ( strstr ( ActStr, "E" ) > 0 ) X = json_object_new_string ( "F" );
    else X = json_object_new_string ( "A" );

    json_object_object_add ( theObj, "Facing", X );
    saveObject ( theObj, objName );
}

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
    else moveHex ( location, 5 );

    json_object_array_put_idx ( Location, 0, json_object_new_int ( location[0] ) );
    json_object_array_put_idx ( Location, 1, json_object_new_int ( location[1] ) );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void shove ( char *objName, char *ActStr ) {
    // Move one hex in the direction given in the ActionString
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );

    if ( Location == NULL )  return;

    int location[] = {0,0};
    location[0] = json_object_get_int ( json_object_array_get_idx ( Location, 0 ) );
    location[1] = json_object_get_int ( json_object_array_get_idx ( Location, 1 ) );

    if ( strstr ( ActStr, "A" ) > 0 ) moveHex ( location, 0 );
    else if ( strstr ( ActStr, "B" ) > 0 ) moveHex ( location, 1 );
    else if ( strstr ( ActStr, "C" ) > 0 ) moveHex ( location, 2 );
    else if ( strstr ( ActStr, "D" ) > 0 ) moveHex ( location, 3 );
    else if ( strstr ( ActStr, "E" ) > 0 ) moveHex ( location, 4 );
    else moveHex ( location, 5 );

    json_object_array_put_idx ( Location, 0, json_object_new_int ( location[0] ) );
    json_object_array_put_idx ( Location, 1, json_object_new_int ( location[1] ) );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void face ( char *objName, char *ActStr ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    json_object *X = json_object_new_string ( "x" );;
    if ( strstr ( ActStr, "A" ) > 0 ) X = json_object_new_string ( "A" );
    else if ( strstr ( ActStr, "B" ) > 0 ) X = json_object_new_string ( "B" );
    else if ( strstr ( ActStr, "C" ) > 0 ) X = json_object_new_string ( "C" );
    else if ( strstr ( ActStr, "D" ) > 0 ) X = json_object_new_string ( "D" );
    else if ( strstr ( ActStr, "E" ) > 0 ) X = json_object_new_string ( "E" );
    else X = json_object_new_string ( "F" );

    json_object_object_add ( theObj, "Facing", X );
    saveObject ( theObj, objName );
}



