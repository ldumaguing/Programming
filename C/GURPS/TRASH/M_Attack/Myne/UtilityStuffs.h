#pragma once

_Bool hasCross(struct json_object *, char *);
_Bool hasDagger(struct json_object *, char *);
_Bool is_OneHand_BothHands(struct json_object *, struct json_object *, char *);
int getFirstIntVal(char *);
int getLastIntVal(char *);
int is_InArray(char *, struct json_object *);
int WeaponRequiredST(struct json_object *, char *);
_Bool isEmptyHanded(struct json_object *);
_Bool isMatch(char *, char *);
int roundNum(double);
void addTag(struct json_object *, char *);
void defineReachDmg(struct json_object *, struct json_object *, char *, char *, char *, int);
void defineRangeDmg(struct json_object *, char *, char *);
void define_Damage(char *, int);



