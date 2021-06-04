#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    switch ( argc ) {
    case 2:
        nameOnly ( argv );
        return 0;
    case 10:
        withAttributes ( argv );
        return 0;
    }

    instruction();
    return 0;
}

// *******************************************************************************
void instruction() {
    printf ( "createHuman   NAME\n" );
    printf ( "     \"          \"    IQ ME MA PS PP PE PB Spd\n" );
}
