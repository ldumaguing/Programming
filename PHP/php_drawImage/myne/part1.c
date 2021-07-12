#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <math.h>
#include "myne.h"

void printPHP ( char *filename, char *scale ) {
    char buff[100];
    sprintf ( buff, "Units/%s", filename );
    struct json_object *theObj = getJSON ( buff );

    struct json_object *Name;
    json_object_object_get_ex ( theObj, "Name", &Name );

    struct json_object *Location;
    json_object_object_get_ex ( theObj, "Location", &Location );
    struct json_object *xLoc;
    xLoc = json_object_array_get_idx ( Location, 0 );
    struct json_object *yLoc;
    yLoc = json_object_array_get_idx ( Location, 1 );


    int X = atoi ( json_object_get_string ( xLoc ) );
    double scl = strtod ( scale, NULL );
    double dbl_X = strtod ( json_object_get_string ( xLoc ), NULL );
    double dbl_Y = strtod ( json_object_get_string ( yLoc ), NULL );
    double lenX = cos ( ( 30.0 * M_PI ) / 180.0 );

    if ( ( X % 2 ) != 0 ) dbl_Y += 0.5;

    dbl_X = dbl_X * scl * lenX;
    dbl_Y *= scl;

    printf ( "context.drawImage(document.getElementById(\"" );
    printf ( "%s\"), ", json_object_get_string ( Name ) );
    printf ( "%d, %d);\n", ( int ) dbl_X, ( int ) dbl_Y );
}
