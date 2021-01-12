#include <json-c/json.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

void set_Addendum(struct json_object *jobj) {
   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *HP;
   json_object_object_get_ex(Secondary_Characteristics, "HP", &HP);
   int hp = json_object_get_int(HP);

   struct json_object *FP;
   json_object_object_get_ex(Secondary_Characteristics, "FP", &FP);
   int fp = json_object_get_int(FP);


   struct json_object *Health;
   json_object_object_get_ex(jobj, "Health", &Health);
      
   struct json_object *Reeling;
   json_object_object_get_ex(Health, "Reeling", &Reeling);
   json_object_set_double(Reeling, hp / 3.0);

   struct json_object *Major_Wounds;
   json_object_object_get_ex(Health, "Major Wounds", &Major_Wounds);
   json_object_set_double(Major_Wounds, hp / 2.0);

   struct json_object *Very_Tired;
   json_object_object_get_ex(Health, "Very Tired", &Very_Tired);
   json_object_set_double(Very_Tired, fp / 3.0);

   struct json_object *CurrHP;
   json_object_object_get_ex(Health, "CurrHP", &CurrHP);
   json_object_set_int(CurrHP, hp);

   struct json_object *CurrFP;
   json_object_object_get_ex(Health, "CurrFP", &CurrFP);
   json_object_set_int(CurrFP, fp);
}

// *****************************************************************************
void set_SpeedMoveDodge(struct json_object *jobj) {
   struct json_object *Attributes;
   json_object_object_get_ex(jobj, "Attributes", &Attributes);

   struct json_object *DX;
   json_object_object_get_ex(Attributes, "DX", &DX);
   int dx = json_object_get_int(DX);

   struct json_object *HT;
   json_object_object_get_ex(Attributes, "HT", &HT);
   int ht = json_object_get_int(HT);


   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *Speed;
   json_object_object_get_ex(Secondary_Characteristics, "Speed", &Speed);
   json_object_set_double(Speed, (dx + ht) / 4.0);

   struct json_object *Move;
   json_object_object_get_ex(Secondary_Characteristics, "Move", &Move);
   json_object_set_int(Move, (dx + ht) / 4);

   struct json_object *Dodge;
   json_object_object_get_ex(Secondary_Characteristics, "Dodge", &Dodge);
   json_object_set_int(Dodge, ((dx + ht) / 4) + 3);
}

// *****************************************************************************
void set_secondaries(struct json_object *jobj) {
   struct json_object *Attributes;
   json_object_object_get_ex(jobj, "Attributes", &Attributes);

   struct json_object *ST;
   json_object_object_get_ex(Attributes, "ST", &ST);
   int st = json_object_get_int(ST);

   struct json_object *IQ;
   json_object_object_get_ex(Attributes, "IQ", &IQ);
   int iq = json_object_get_int(IQ);

   struct json_object *DX;
   json_object_object_get_ex(Attributes, "DX", &DX);
   int dx = json_object_get_int(DX);

   struct json_object *HT;
   json_object_object_get_ex(Attributes, "HT", &HT);
   int ht = json_object_get_int(HT);



   struct json_object *Secondary_Characteristics;
   json_object_object_get_ex(jobj, "Secondary Characteristics", &Secondary_Characteristics);

   struct json_object *HP;
   json_object_object_get_ex(Secondary_Characteristics, "HP", &HP);
   json_object_set_int(HP, st);

   struct json_object *FP;
   json_object_object_get_ex(Secondary_Characteristics, "FP", &FP);
   json_object_set_int(FP, ht);

   struct json_object *Per;
   json_object_object_get_ex(Secondary_Characteristics, "Per", &Per);

   struct json_object *Will;
   json_object_object_get_ex(Secondary_Characteristics, "Will", &Will);

   json_object_set_int(Per, iq);
   json_object_set_int(Will, iq);

   struct json_object *BL;
   json_object_object_get_ex(Secondary_Characteristics, "BL", &BL);
   json_object_set_int(BL, round((st * st) / 5));
}


