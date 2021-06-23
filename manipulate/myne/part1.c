#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myne.h"

// *******************************************************************************
void manipulate ( char *argv[] ) {
    char buff[80];
    sprintf ( buff, "%s", argv[2] );
    char *ActionString, *ActionName;
    ActionName = strtok_r ( buff, ":", &ActionString );

    if ( strstr ( "Forward", ActionName ) != 0 ) forward ( argv[1] );
    else if ( strstr ( "Shove", ActionName ) != 0 ) shove ( argv[1], ActionString );
    else if ( strstr ( "Face", ActionName ) != 0 ) face ( argv[1], ActionString );
    else if ( strstr ( "TurnLeft", ActionName ) != 0 ) turnLeft ( argv[1] );
    else if ( strstr ( "TurnRight", ActionName ) != 0 ) turnRight ( argv[1] );
    else if ( strstr ( "Aboutface", ActionName ) != 0 ) aboutface ( argv[1] );
    else if ( strstr ( "Place", ActionName ) != 0 ) place ( argv[1], ActionString );
    else if ( strstr ( "Displace", ActionName ) != 0 ) displace ( argv[1], ActionString );
}
