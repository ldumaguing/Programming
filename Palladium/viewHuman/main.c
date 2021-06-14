#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    if ( argc == 2 ) {
        view ( argv );
        return 0;
    }

    instruction();
    return 0;
}

// *******************************************************************************
void instruction() {
    printf ( "viewHuman   NAME\n" );
}
