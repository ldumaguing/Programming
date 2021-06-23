#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    if ( argc == 3 ) {
        delete ( argv );
        return 0;
    }

    instruction();
}

// *******************************************************************************
void instruction() {
    printf ( "\ndeleteTag   OBJ   TAG\n" );
    printf ( "     \"       \"    all\n" );
}
