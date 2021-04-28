#include <stdio.h>
#include <string.h>
#include <json-c/json.h>

void two(struct json_object *jobj, char *name) {
   struct json_object *jclass;
   json_object_object_get_ex(jobj, "Class", &jclass);
   if (strcmp("Human", json_object_get_string(jclass)) != 0) {
      printf("Template is not human.\n");
      exit(0);
   }

   json_object *jstring = json_object_new_string(name);
   json_object_object_add(jobj, "Name", jstring);
}

// ****************************************************************************
void six(struct json_object *jobj, char **argv) {
   struct json_object *Attributes;
   json_object_object_get_ex(jobj, "Attributes", &Attributes);

   struct json_object *ST;
   json_object_object_get_ex(Attributes, "ST", &ST);
   json_object_set_int(ST, atoi(argv[2]));

   struct json_object *IQ;
   json_object_object_get_ex(Attributes, "IQ", &IQ);
   json_object_set_int(IQ, atoi(argv[3]));

   struct json_object *DX;
   json_object_object_get_ex(Attributes, "DX", &DX);
   json_object_set_int(DX, atoi(argv[4]));

   struct json_object *HT;
   json_object_object_get_ex(Attributes, "HT", &HT);
   json_object_set_int(HT, atoi(argv[5]));
}

// ****************************************************************************
void eight(struct json_object *jobj, char **argv) {
   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *Speed;
   json_object_object_get_ex(Secondary_Characteristics, "Speed", &Speed);
   json_object_set_double(Speed, atol(argv[6]));

   struct json_object *Move;
   json_object_object_get_ex(Secondary_Characteristics, "Move", &Move);
   json_object_set_int(Move, atoi(argv[7]));
}

// ****************************************************************************
void ten(struct json_object *jobj, char **argv) {
   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *HP;
   json_object_object_get_ex(Secondary_Characteristics, "HP", &HP);
   json_object_set_int(HP, atoi(argv[6]));

   struct json_object *Per;
   json_object_object_get_ex(Secondary_Characteristics, "Per", &Per);
   json_object_set_int(Per, atoi(argv[7]));

   struct json_object *Will;
   json_object_object_get_ex(Secondary_Characteristics, "Will", &Will);
   json_object_set_int(Will, atoi(argv[8]));

   struct json_object *FP;
   json_object_object_get_ex(Secondary_Characteristics, "FP", &FP);
   json_object_set_int(FP, atoi(argv[9]));
}

// ****************************************************************************
void twelve(struct json_object *jobj, char **argv) {
   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *Speed;
   json_object_object_get_ex(Secondary_Characteristics, "Speed", &Speed);
   json_object_set_double(Speed, atol(argv[10]));

   struct json_object *Move;
   json_object_object_get_ex(Secondary_Characteristics, "Move", &Move);
   json_object_set_int(Move, atoi(argv[11]));

}


