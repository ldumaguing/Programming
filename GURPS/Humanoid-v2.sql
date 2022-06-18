delete from Objects where Id = 5000;
insert into Objects (Id, ClassType, Name, Definition, Body) values (
5000,
'Humanoid',
'John Doe',
JSON_OBJECT(),
JSON_OBJECT()
);

-- ********************************************************************* Definition
update Objects set  Definition =
'{
"basic attributes": {
"ST": 10,
"DX": 10,
"IQ": 10,
"HT": 10
},
"secondary characteristics": {
"damage": {
"thrust": "",
"swing": ""
},
"basic lift": 0,
"HP": 0,
"Will": 0,
"Per": 0,
"FP": 0,
"basic speed": 0,
"basic move": 0
}
}'
where Id = 5000;

-- ********************************************************************* Body
update Objects set  Body =
'{
"head": {
"skull": {},
"eyes": {},
"face": {}
},
"body": {
"neck": {},
"torso": {},
"groin": {}
},
"limbs": {
"arms": {
"hands": {}
},
"legs": {
"feet": {}
}
}
}'
where Id = 5000;

select json_detailed(Definition), json_detailed(Body) from Objects where Id = 5000;
-- mysql GURPS -p'sasamichan[]()' < Humanoid-v3.sql | sed 's/\\n/\n/g' | sed 's/\t/\n************\n/g'





