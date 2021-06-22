#include <stdio.h>
#include <stdlib.h>

void forward ( char *TheObj, char *ActStr ) {
    // use facing
    printf ( "%s\n%s\n", TheObj, ActStr );
}

// *******************************************************************************
void shove ( char *TheObj, char *ActStr ) {
    // facing doesn't matter
    printf ( "%s\n%s\n", TheObj, ActStr );
}

