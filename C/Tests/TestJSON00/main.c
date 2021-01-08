#include <json-c/json.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    json_object *jobj = json_object_new_object();
    json_object *jstring = json_object_new_string("Joys of Programming");
    json_object *jint = json_object_new_int(10);
    json_object *jboolean = json_object_new_boolean(1);
    json_object *jdouble = json_object_new_double(2.14);
    json_object *jarray = json_object_new_array();

    json_object *jstring1 = json_object_new_string("c");
    json_object *jstring2 = json_object_new_string("c++");
    json_object *jstring3 = json_object_new_string("php");

    json_object_array_add(jarray, jstring1);
    json_object_array_add(jarray, jstring2);
    json_object_array_add(jarray, jstring3);


    json_object_object_add(jobj, "Site Name", jstring);
    json_object_object_add(jobj, "Technical blog", jboolean);
    json_object_object_add(jobj, "Average posts per day", jdouble);
    json_object_object_add(jobj, "Number of posts", jint);
    json_object_object_add(jobj, "Categories", jarray);


    printf("%s\n", json_object_to_json_string(jobj));

    return 0;
}
