#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <json-c/json.h>
#include "myne.h"

struct json_object *get_HumanTemplate();
void saveHuman ( json_object *, char ** );

// *******************************************************************************
void withAttributes ( char *argv[] ) {
    printf ( "withAttributes\n" );
    struct json_object *Human = get_HumanTemplate();

    // ********** Graft a name.
    json_object *Name = json_object_new_string ( argv[1] );
    json_object_object_add ( Human, "Name", Name );

    // ********** Get attributes.
    struct json_object *Attributes;
    json_object_object_get_ex ( Human, "Attributes", &Attributes );

    // ******************** Set IQ
    int IQ = atoi(argv[2]);
    json_object_array_put_idx(Attributes, 0, json_object_new_int(IQ));

    saveHuman(Human, argv);
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
void saveHuman ( json_object *Human, char *argv[] ) {
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
                "\"Attributes\":[10, 10, 10, 10, 10, 10, 10, 10]"
                "}";

    return  json_tokener_parse ( str );
}
