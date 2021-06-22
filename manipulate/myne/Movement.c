#include <stdio.h>
#include <stdlib.h>

void forward ( char *TheObj, char *ActStr ) {
    // Move one hex in the facing direction
    printf ( "%s\n%s\n", TheObj, ActStr );
}

// *******************************************************************************
void shove ( char *TheObj, char *ActStr ) {
    // Move one hex in the direction given in the ActionString
    printf ( "%s\n%s\n", TheObj, ActStr );
}

