#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include <math.h>
#include "myne.h"

void printPHP ( char *filename, char *scale ) {
    char buff[100];
    sprintf ( buff, "Units/%s", filename );
    struct json_object *theObj = getJSON ( buff );

    struct json_object *Name;
    json_object_object_get_ex ( theObj, "Name", &Name );

    struct json_object *Facing;
    json_object_object_get_ex ( theObj, "Facing", &Facing );

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

    // 58 is half of the width and half of the height of the image square I'm using.
    double rad = 0.0;
    printf ( "context.translate(%d, %d);\n", ( int ) ( dbl_X + 58.0 ), ( int ) ( dbl_Y + 58.0 ) );
    
    if ( strcmp ( json_object_get_string ( Facing ), "B" ) == 0 )
        rad = M_PI / 3.0;
    else if ( strcmp ( json_object_get_string ( Facing ), "C" ) == 0 )
        rad = ( M_PI * 2.0 ) / 3.0;
    else if ( strcmp ( json_object_get_string ( Facing ), "D" ) == 0 )
        rad = M_PI;
    else if ( strcmp ( json_object_get_string ( Facing ), "E" ) == 0 )
        rad = ( M_PI * 4.0 ) / 3.0;
    else if ( strcmp ( json_object_get_string ( Facing ), "F" ) == 0 )
        rad = ( M_PI * 5.0 ) / 3.0;
    printf ( "context.rotate(%f);\n", rad );
    
    printf ( "context.drawImage(document.getElementById(\"" );
    printf ( "%s\"), ", json_object_get_string ( Name ) );
    printf ( "-58, -58);\n" );
    
    printf ( "context.rotate(-%f);\n", rad );
    
    printf ( "context.translate(-%d, -%d);\n", ( int ) ( dbl_X + 58.0 ), ( int ) ( dbl_Y + 58.0 ) );
}
