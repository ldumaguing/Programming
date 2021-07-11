#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    if ( argc == 3 ) {
        setimage ( argv );
        return 0;
    }

    instruction();
}

// *******************************************************************************
void instruction() {
    printf ( "\nsetImage   JSON   IDString\n\n" );
}
