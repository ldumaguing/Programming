#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    if ( argc == 3 ) {
        manipulate ( argv );
        return 0;
    }

    instruction();
}

// *******************************************************************************
void instruction() {
    printf ( "\nmanipulate   OBJ   ActionString\n\n" );
    printf ( "********************************************************************************\n" );
    printf ( "DIRECTION: A, B, C, D, E, or F\n" );
    printf ( "ActionString:\n" );
    printf ( "   Forward\n" );
    printf ( "   Shove:DIRECTION\n" );
    printf ( "   Face:DIRECTION\n" );
    printf ( "   TurnLeft\n" );
    printf ( "   TurnRight\n" );
    printf ( "   Aboutface\n" );
}
