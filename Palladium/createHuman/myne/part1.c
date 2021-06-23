#include <stdio.h>
//#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
//#include "myne.h"

struct json_object *get_HumanTemplate();
void saveHuman ( struct json_object *, char ** );

// *******************************************************************************
void withAttributes ( char *argv[], int argc ) {
    struct json_object *Human = get_HumanTemplate();

    // ********** Graft a name.
    json_object *Name = json_object_new_string ( argv[1] );
    json_object_object_add ( Human, "Name", Name );

    // ********** Get attributes
    struct json_object *Attributes;
    json_object_object_get_ex ( Human, "Attributes", &Attributes );

    int X;
    // ******************** Set IQ
    X = atoi ( argv[2] );
    json_object_array_put_idx ( Attributes, 0, json_object_new_int ( X ) );
    // ******************** Set ME
    X = atoi ( argv[3] );
    json_object_array_put_idx ( Attributes, 1, json_object_new_int ( X ) );
    // ******************** Set MA
    X = atoi ( argv[4] );
    json_object_array_put_idx ( Attributes, 2, json_object_new_int ( X ) );
    // ******************** Set PS
    X = atoi ( argv[5] );
    json_object_array_put_idx ( Attributes, 3, json_object_new_int ( X ) );
    // ******************** Set PP
    X = atoi ( argv[6] );
    json_object_array_put_idx ( Attributes, 4, json_object_new_int ( X ) );
    // ******************** Set PE
    X = atoi ( argv[7] );
    json_object_array_put_idx ( Attributes, 5, json_object_new_int ( X ) );
    // ******************** Set PB
    X = atoi ( argv[8] );
    json_object_array_put_idx ( Attributes, 6, json_object_new_int ( X ) );
    // ******************** Set Spd
    X = atoi ( argv[9] );
    json_object_array_put_idx ( Attributes, 7, json_object_new_int ( X ) );
    // ******************** Set Gender
    if ( argc == 11 ) {
        json_object_object_add ( Human, "Gender",
                                 json_object_new_string ( argv[10] ) );
    }


    saveHuman ( Human, argv );
}

// *******************************************************************************
void nameOnly ( char *argv[] ) {
    struct json_object *Human = get_HumanTemplate();

    // ********** Graft a name.
    json_object *jstring = json_object_new_string ( argv[1] );
    json_object_object_add ( Human, "Name", jstring );


    saveHuman ( Human, argv );
}

// *******************************************************************************
void saveHuman ( struct json_object *Human, char *argv[] ) {
    char filename[100];
    strcpy ( filename, argv[1] );
    strcat ( filename, ".json" );
    FILE *fp;
    fp = fopen ( filename, "w" );
    fputs ( json_object_to_json_string_ext ( Human, 0 ), fp );
    fclose ( fp );
}

// *******************************************************************************
// *******************************************************************************
struct json_object *get_HumanTemplate() {
    char *str = "{"
                "\"Class\": \"Human\","
                "\"Gender\": \"Male\","
                "\"Attributes\":[10, 10, 10, 10, 10, 10, 10, 10],"
                "\"Tags\":[],"
                "\"Location\":[0, 0, 0],"
                "\"Facing\": \"A\","
                "\"Hands\":[\"\",\"\",\"\"]"   // Primary, Off, Both
                "}";

    return  json_tokener_parse ( str );
}
