#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void setArrows ( double [][3] );
void printArrows ( double [][3] );
void roundupArrows ( double [][3] );
void adjustArrows ( double [][3] );
void adjustArrows_ROLL_at_LAT_p90 ( double [][3] );
void adjustArrows_ROLL_at_LAT_n90 ( double [][3] );
void adjustArrows_ROLL_at_LAT_0 ( double [][3] );
void adjustArrows_ROLL_in_Up ( double [][3] );
void adjustArrows_ROLL_in_Down ( double [][3] );

#define LAT 0
#define LON 1

#define YAW   0
#define ROLL  1
#define PITCH 2

// ****************************************************************************
int main ( int argc, char *argv[] ) {
    double Arrows [][3] = {
        {0,0},  // Yaw
        {0,0},  // Roll
        {0,0}   // Pitch
    };

    setArrows ( Arrows );
    printArrows ( Arrows );




    return 0;
}

// ****************************************************************************
void adjustArrows ( double a[][3] ) {
    roundupArrows ( a );

    if ( a[LAT][ROLL] == 0.0 ) adjustArrows_ROLL_at_LAT_0 ( a );
    if ( a[LAT][ROLL] == 90.0 ) adjustArrows_ROLL_at_LAT_p90 ( a );
    if ( a[LAT][ROLL] == -90.0 ) adjustArrows_ROLL_at_LAT_n90 ( a );

    // Upper Hemisphere
    if ( ( a[LAT][ROLL] > 0.0 ) && ( a[LAT][ROLL] < 90.0 ) ) {
        adjustArrows_ROLL_in_Up ( a );
    }

    // Low Hemisphere
    if ( ( a[LAT][ROLL] < 0.0 ) && ( a[LAT][ROLL] > -90.0 ) ) {
        adjustArrows_ROLL_in_Down ( a );
    }

}

// ============================================================================
void adjustArrows_ROLL_in_Dow ( double a[][3] ) {
}

// ============================================================================
void adjustArrows_ROLL_in_Up ( double a[][3] ) {
}

// ============================================================================
void adjustArrows_ROLL_at_LAT_0 ( double a[][3] ) {
    if ( a[LAT][YAW] == 90.0 ) {
        a[LON][YAW] = 888.0;

        a[LAT][PITCH] = 0.0;
        a[LON][PITCH] = ( ( int ) a[LON][PITCH] + 270 ) % 360;

        return;
    }

    if ( a[LAT][PITCH] == 90.0 ) {
        a[LON][PITCH] = 888.0;

        a[LAT][YAW] = 0.0;
        a[LON][YAW] = ( ( int ) a[LON][PITCH] + 90 ) % 360;

        return;
    }

    if ( a[LAT][YAW] == -90.0 ) {
        a[LON][YAW] = -888.0;

        a[LAT][PITCH] = 0.0;
        a[LON][PITCH] = ( ( int ) a[LON][PITCH] + 90 ) % 360;

        return;
    }

    if ( a[LAT][PITCH] == -90.0 ) {
        a[LON][PITCH] = -888.0;

        a[LAT][YAW] = 0.0;
        a[LON][YAW] = ( ( int ) a[LON][PITCH] + 270 ) % 360;

        return;
    }
}

// ============================================================================
void adjustArrows_ROLL_at_LAT_n90 ( double a[][3] ) {
    a[LON][ROLL] = -888.0;

    a[LAT][YAW] = 0.0;
    a[LAT][PITCH] = 0.0;

    if (
        ( a[LON][YAW] == 888.0 ) ||
        ( a[LON][YAW] == -888.0 ) ||
        ( a[LON][PITCH] == 888.0 ) ||
        ( a[LON][PITCH] == -888.0 )
    ) {
        a[LON][YAW] = 0.0;
        a[LON][PITCH] = 270.0;
        return;
    }

    a[LON][PITCH] = ( ( int ) a[LON][YAW] + 270 ) % 360;
}

// ============================================================================
void adjustArrows_ROLL_at_LAT_p90 ( double a[][3] ) {
    a[LON][ROLL] = 888.0;

    a[LAT][YAW] = 0.0;
    a[LAT][PITCH] = 0.0;

    if (
        ( a[LON][YAW] == 888.0 ) ||
        ( a[LON][YAW] == -888.0 ) ||
        ( a[LON][PITCH] == 888.0 ) ||
        ( a[LON][PITCH] == -888.0 )
    ) {
        a[LON][YAW] = 180.0;
        a[LON][PITCH] = 270.0;
        return;
    }

    a[LON][PITCH] = ( ( int ) a[LON][YAW] + 90 ) % 360;
}

// ****************************************************************************
void roundupArrows ( double a[][3] ) {
    a[LAT][YAW] = round ( a[LAT][YAW] );
    a[LON][YAW] = round ( a[LON][YAW] );

    a[LAT][ROLL] = round ( a[LAT][ROLL] );
    a[LON][ROLL] = round ( a[LON][ROLL] );

    a[LAT][PITCH] = round ( a[LAT][PITCH] );
    a[LON][PITCH] = round ( a[LON][PITCH] );
}

// ****************************************************************************
void printArrows ( double a[][3] ) {
    printf ( "%f, %f\n", a[LAT][YAW], a[LON][YAW] );
    printf ( "%f, %f\n", a[LAT][ROLL], a[LON][ROLL] );
    printf ( "%f, %f\n\n", a[LAT][PITCH], a[LON][PITCH] );
}

// ****************************************************************************
void setArrows ( double a[][3] ) {
    a[LAT][YAW] = 90.0;
    a[LON][YAW] = 888.0;

    a[LAT][ROLL] = 0.0;
    a[LON][ROLL] = 0.0;

    a[LAT][PITCH] = 0.0;
    a[LON][PITCH] = 270.0;
}

