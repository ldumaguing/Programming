#pragma once

// ********** part1.c
void insert ( char ** );

// ********** utils1.c
int getIndex ( struct json_object *, char ** );
struct json_object *getJSON ( char ** );
void saveObject ( struct json_object *, char ** );

