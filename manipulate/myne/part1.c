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

    if ( strstr ( "Forward", ActionName ) != 0 ) {
        forward ( argv[1] );
        return;
    }
}
