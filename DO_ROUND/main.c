#include <stdio.h>
#include <stdlib.h>
#include "myne/myne.h"

void instruction();

int main ( int argc, char *argv[] ) {
    switch ( argc ) {
    case 2:
        do_round ( argv );
        return 0;
    }

    instruction();
}

// *******************************************************************************
void instruction() {
    printf ( "\nDO_ROUND   now\n" );
}
