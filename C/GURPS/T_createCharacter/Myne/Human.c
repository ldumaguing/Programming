#include <stdio.h>
#include <stdlib.h>
#include <json-c/json.h>
#include <string.h>
#include "myne.h"

// *******************************************************************************
struct json_object *get_Human() {
   char *str = "{       \
	\"Name\": \"John Smith\",             \
	\"Class\": \"Human\",             \
	\"SM\": 0,             \
	\"Handiness\": \"Right\",             \
	\"Location\": [0.0, 0.0, 0.0],             \
	\"HexLoc\": [0, 0],             \
	\"PrevHexLoc\": [0, 0],             \
	\"Facing\": 90,             \
	\"HexFace\": \"A\",             \
	\"Attributes\": {             \
		\"ST\": 10, \"DX\": 10, \"IQ\": 10, \"HT\": 10             \
	},             \
	\"Secondary Characteristics\": {             \
		\"HP\": 10,             \
		\"FP\": 10,             \
		\"Per\": 10,             \
		\"Will\": 10,             \
		\"BL\": 20,             \
		\"Speed\": 5.0,             \
		\"Move\": 5,             \
		\"Dodge\": 0             \
	},             \
	\"Holding\": {             \
		\"Left Hand\": {},             \
		\"Right Hand\": {},             \
		\"Both Hands\": {}             \
	},             \
	\"InfiniteBag\": [],             \
	\"Wearing\": [],             \
	\"Advantages\": [],             \
	\"Disadvantages\": [],             \
	\"Skills\": [],             \
	\"Health\":{             \
	    \"Tags\": [],             \
	    \"Reeling\": 0.0,             \
	    \"Major Wounds\": 0.0,             \
	    \"Very Tired\": 0.0,             \
	    \"CurrHP\": 0,             \
	    \"CurrFP\": 0             \
	},             \
	\"Maneuvers\": [\"Do Nothing\", \"Move\", \"Change Posture\", \"Aim\", \"Evaluate\",             \
                      \"Attack\", \"Feint\", \"All-Out Attack\", \"Move and Attack\",              \
                      \"All-Out Defense\", \"Concentrate\", \"Ready\", \"Wait\"],             \
	\"AttackSrc\": \"PunchKick\",             \
	\"PrevManuv\": \"Ready\",             \
	\"ManuvTaken\": \"Ready\",             \
	\"Turn\": 0             \
}";

   return  json_tokener_parse(str);
}
