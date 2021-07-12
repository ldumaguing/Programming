#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include "myne.h"

void printPHP ( char *filename ) {
    char buff[100];
    sprintf ( buff, "Units/%s", filename );
    struct json_object *theObj = getJSON ( buff );

    struct json_object *Name;
    json_object_object_get_ex ( theObj, "Name", &Name );

    struct json_object *Image;
    json_object_object_get_ex ( theObj, "Image", &Image );

    printf ( "<img src=\"images/%s\" id=\"%s\">",
             json_object_get_string ( Image ),
             json_object_get_string ( Name ) );
}
