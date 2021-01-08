#pragma once

struct json_object *get_Unit(char *);
struct json_object *get_Weapon(struct json_object *, int, int *);
struct json_object *get_Skills(struct json_object *, struct json_object *);
struct json_object *get_PunchOrKick(char *);
void Attack(struct json_object *, struct json_object *, char **, int);
void mod_Weapon_Usage(struct json_object *, char **, int, int *, char *);
void using_One_Hand(struct json_object *, int *, char *, struct json_object *, char *, int);
void using_Both_Hands(struct json_object *, int *, char *, struct json_object *, char *);
void mod_ST(struct json_object *, int *, char *, struct json_object *, char *, int);
void mod_Skill(struct json_object *, int *, char *, struct json_object *, char *, int, char *);
void do_Shoot(struct json_object *, struct json_object *, char *, int *, char *);
void do_Bash(struct json_object *, struct json_object *, char *, int *, char *);
void do_Strike(struct json_object *, struct json_object *, char *, int *, char *);
void mod_Distance(struct json_object *, struct json_object *, char *, char **, int, int *);



