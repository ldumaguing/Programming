#pragma once

// ***** hexagoncol.c
void hdist ( int, char ** );
void cdist ( int, char ** );
void path ( int, char ** );
void deg ( int, char ** );
void other ( int, char ** );
void moveHex ( int *, int );

// ********** part1.c
void manipulate ( char ** );

// ********** utils1.c
struct json_object *getJSON ( char * );
void getGrep ( char *, char *, char * );
void saveObject ( struct json_object *, char * );

// ********** Movement.c
void forward ( char * );
void stepBack ( char * );
void shove ( char *, char * );
void face ( char *, char * );
void turnLeft ( char * );
void turnRight ( char * );
void aboutface ( char * );
void place ( char *, char * );
void displace ( char *, char * );
void sideslipLeft ( char * );
void sideslipRight ( char * );


