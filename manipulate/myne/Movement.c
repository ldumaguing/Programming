#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

void shove2 ( struct json_object *, char *, char * );

// *******************************************************************************
void sideslipRight ( char *objName ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    if ( strstr ( json_object_get_string ( Facing ), "A" ) > 0 ) shove2 ( theObj, "B", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "B" ) > 0 ) shove2 ( theObj, "C", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "C" ) > 0 ) shove2 ( theObj, "D", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "D" ) > 0 ) shove2 ( theObj, "E", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "E" ) > 0 ) shove2 ( theObj, "F", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "F" ) > 0 ) shove2 ( theObj, "A", objName );
}

// *******************************************************************************
void sideslipLeft ( char *objName ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

    if ( Facing == NULL ) return;

    if ( strstr ( json_object_get_string ( Facing ), "A" ) > 0 ) shove2 ( theObj, "F", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "B" ) > 0 ) shove2 ( theObj, "A", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "C" ) > 0 ) shove2 ( theObj, "B", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "D" ) > 0 ) shove2 ( theObj, "C", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "E" ) > 0 ) shove2 ( theObj, "D", objName );
    else if ( strstr ( json_object_get_string ( Facing ), "F" ) > 0 ) shove2 ( theObj, "E", objName );
}

// ===============================================================================
void shove2 ( struct json_object *theObj, char *ActStr, char *objName ) {
    // Move one hex in the direction given in the ActionString
    //struct json_object *theObj = getJSON ( objName );
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
void displace ( char *objName, char *ActStr ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );

    if ( Location == NULL )  return;

    int L[] = {0,0,0};
    L[0] = json_object_get_int ( json_object_array_get_idx ( Location, 0 ) );
    L[1] = json_object_get_int ( json_object_array_get_idx ( Location, 1 ) );

    char buff[80];
    sprintf ( buff, "%s", ActStr );
    char *X, *Y;
    X = strtok_r ( buff, ",", &Y );

    L[0] += atoi ( X );
    L[1] += atoi ( Y );

    json_object_array_put_idx ( Location, 0, json_object_new_int ( L[0] ) );
    json_object_array_put_idx ( Location, 1, json_object_new_int ( L[1] ) );
    saveObject ( theObj, objName );
}

// *******************************************************************************
void place ( char *objName, char *ActStr ) {
    struct json_object *theObj = getJSON ( objName );
    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );

    if ( Location == NULL )  return;

    char buff[80];
    sprintf ( buff, "%s", ActStr );
    char *X, *Y;
    X = strtok_r ( buff, ",", &Y );

    json_object_array_put_idx ( Location, 0, json_object_new_int ( atoi ( X ) ) );
    json_object_array_put_idx ( Location, 1, json_object_new_int ( atoi ( Y ) ) );
    saveObject ( theObj, objName );
}

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
    json_object *X = json_object_new_string ( "x" );
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



