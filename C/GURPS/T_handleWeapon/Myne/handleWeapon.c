#include <json-c/json.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <regex.h>
#include "myne.h"

struct json_object *otherHand(struct json_object *, int, int, int,
                              struct json_object *,
                              struct json_object *,
                              struct json_object *,
                              struct json_object *);
struct json_object *bothHands(struct json_object *, int, int, int,
                              struct json_object *,
                              struct json_object *,
                              struct json_object *,
                              struct json_object *);
struct json_object *toRight(struct json_object *, int, int, int,
                            struct json_object *,
                            struct json_object *,
                            struct json_object *,
                            struct json_object *);
struct json_object *toLeft(struct json_object *, int, int, int,
                           struct json_object *,
                           struct json_object *,
                           struct json_object *,
                           struct json_object *);
void removeCopyFrom(struct json_object *, char *);
struct json_object *set2Thrust(struct json_object *, int, int, int,
                               struct json_object *,
                               struct json_object *,
                               struct json_object *,
                               struct json_object *);

// ********************************************************************************
struct json_object *handleWeapon(struct json_object *Unit, char *setting) {
   if (isEmptyHanded(Unit))
      printf("No weapon to set.\n");

   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   struct json_object *Left_Hand;
   json_object_object_get_ex(Holding, "Left Hand", &Left_Hand);

   struct json_object *Right_Hand;
   json_object_object_get_ex(Holding, "Right Hand", &Right_Hand);

   struct json_object *Both_Hands;
   json_object_object_get_ex(Holding, "Both Hands", &Both_Hands);

   int rh = json_object_object_length(Right_Hand);
   int lh = json_object_object_length(Left_Hand);
   int bh = json_object_object_length(Both_Hands);


   if (strcmp(setting, "OtherHand") == 0)
      return otherHand(Unit, rh, lh, bh, Holding, Right_Hand, Left_Hand, Both_Hands);
   if (strcmp(setting, "BothHands") == 0)
      return bothHands(Unit, rh, lh, bh, Holding, Right_Hand, Left_Hand, Both_Hands);
   if (strcmp(setting, "toLeft") == 0)
      return toLeft(Unit, rh, lh, bh, Holding, Right_Hand, Left_Hand, Both_Hands);
   if (strcmp(setting, "toRight") == 0)
      return toRight(Unit, rh, lh, bh, Holding, Right_Hand, Left_Hand, Both_Hands);


   return Unit;
}

// ================================================================================
struct json_object *toRight(struct json_object *Unit, int X, int Y, int Z,
                            struct json_object *Holding,
                            struct json_object *Right_Hand,
                            struct json_object *Left_Hand,
                            struct json_object *Both_Hands) {
   char buff[65536];

   if (X < Y) {
      json_object_object_add_ex(Holding, "Right Hand", Left_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Left");
      return NewUnit;
   }

   if (Z > 0) {
      json_object_object_add_ex(Holding, "Right Hand", Both_Hands, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Both2R");
      return NewUnit;
   }

   return Unit;
}
// ================================================================================
struct json_object *toLeft(struct json_object *Unit, int X, int Y, int Z,
                           struct json_object *Holding,
                           struct json_object *Right_Hand,
                           struct json_object *Left_Hand,
                           struct json_object *Both_Hands) {
   char buff[65536];

   if (X > Y) {
      json_object_object_add_ex(Holding, "Left Hand", Right_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Right");
      return NewUnit;
   }

   if (Z > 0) {
      json_object_object_add_ex(Holding, "Left Hand", Both_Hands, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Both2L");
      return NewUnit;
   }

   return Unit;
}

// ================================================================================
struct json_object *bothHands(struct json_object *Unit, int X, int Y, int Z,
                              struct json_object *Holding,
                              struct json_object *Right_Hand,
                              struct json_object *Left_Hand,
                              struct json_object *Both_Hands) {
   char buff[65536];

   if (X > Y) {
      json_object_object_add_ex(Holding, "Both Hands", Right_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Both_v2");
      return NewUnit;
   }

   if (X < Y) {
      json_object_object_add_ex(Holding, "Both Hands", Left_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Both_v2");
      return NewUnit;
   }


   return Unit;
}

// ================================================================================
struct json_object *otherHand(struct json_object *Unit, int X, int Y, int Z,
                              struct json_object *Holding,
                              struct json_object *Right_Hand,
                              struct json_object *Left_Hand,
                              struct json_object *Both_Hands) {

   char buff[65536];

   if (X > Y) {
      json_object_object_add_ex(Holding, "Left Hand", Right_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Right");
      return NewUnit;
   }

   if (X < Y) {
      json_object_object_add_ex(Holding, "Right Hand", Left_Hand, 0);
      strcpy(buff, json_object_to_json_string(Unit));
      struct json_object *NewUnit = json_tokener_parse(buff);
      removeCopyFrom(NewUnit, "Left");
      return NewUnit;
   }

   return Unit;
}

// ================================================================================
void removeCopyFrom(struct json_object *Unit, char *hand) {
   struct json_object *Holding;
   json_object_object_get_ex(Unit, "Holding", &Holding);

   struct json_object *Left_Hand;
   json_object_object_get_ex(Holding, "Left Hand", &Left_Hand);

   struct json_object *Right_Hand;
   json_object_object_get_ex(Holding, "Right Hand", &Right_Hand);

   struct json_object *Both_Hands;
   json_object_object_get_ex(Holding, "Both Hands", &Both_Hands);


   json_object *jobj = json_object_new_object();

   json_object *rh = json_object_new_string("Right");
   json_object *lh = json_object_new_string("Left");
   json_object *bh = json_object_new_string("Both");

   if (strcmp(hand, "Right") == 0) {
      json_object_object_add_ex(Holding, "Right Hand", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", lh, 0);
   }
   if (strcmp(hand, "Left") == 0) {
      json_object_object_add_ex(Holding, "Left Hand", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", rh, 0);
   }
   if (strcmp(hand, "Both") == 0) {
      json_object_object_add_ex(Holding, "Both Hands", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", bh, 0);
   }
   if (strcmp(hand, "Both2R") == 0) {
      json_object_object_add_ex(Holding, "Both Hands", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", rh, 0);
   }
   if (strcmp(hand, "Both2L") == 0) {
      json_object_object_add_ex(Holding, "Both Hands", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", lh, 0);
   }
   if (strcmp(hand, "Both_v2") == 0) {
      json_object_object_add_ex(Holding, "Right Hand", jobj, 0);
      json_object_object_add_ex(Holding, "Left Hand", jobj, 0);
      json_object_object_add_ex(Unit, "AttackSrc", bh, 0);
   }
}








