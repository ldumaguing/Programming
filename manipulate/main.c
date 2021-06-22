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
    printf ( "manipulate   OBJ   ActionString\n" );
    printf ( "********************************************************************************\n" );
    printf ( "ActionString:\n" );
    printf ( "   Forward\n" );
    printf ( "   Shove:DIRECTION\n" );
}
