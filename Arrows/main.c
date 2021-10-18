#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void resetArrows ( double [][3] );
void printArrows ( double [][3] );
void twistRoll ( double [][3], int );

// ****************************************************************************
int main ( int argc, char *argv[] ) {
    double Arrows [][3] = {
        {0,0},
        {0,0},
        {0,0}
    };

    resetArrows ( Arrows );
    printArrows ( Arrows );

    twistRoll(Arrows, 1);
    printArrows ( Arrows );
    
    
    
    return 0;
}

// ****************************************************************************
void twistRoll ( double r[][3], int angle ) {
    if (r[0][1] == 0.0){
        printf("Lat is 0.\n");
    }
}

// ****************************************************************************
void printArrows ( double a[][3] ) {
    // yaw (lat, long)
    printf ( "%f, %f\n", a[0][0], a[1][0] );

    // roll (lat, long)
    printf ( "%f, %f\n", a[0][1], a[1][1] );

    // pitch (lat, long)
    printf ( "%f, %f\n\n", a[0][2], a[1][2] );
}

// ****************************************************************************
void resetArrows ( double a[][3] ) {
    // yaw
    a[0][0] = 90.0;
    a[1][0] = 888.0;  // positive infinity

    // roll
    a[0][1] = 0.0;  // lat
    a[1][1] = 0.0;  // long

    // pitch
    a[0][2] = 0.0;
    a[1][2] = 270.0;
}
