#pragma once

// ********** part1.c
void set ( char ** );

// ********** utils1.c
struct json_object *getJSON ( char ** );
void saveObj ( struct json_object *, char ** );
int hasColon ( char * );
int hasPlusMinus ( char * );
int getIndex ( struct json_object *, char * );


