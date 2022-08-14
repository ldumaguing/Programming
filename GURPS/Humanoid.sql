delete from Stuffs where Id = 5000;
insert into Stuffs (Id, ClassType, Name, Definition) values (
5000,
'Humanoid',
'John Doe',
JSON_OBJECT()
);

-- ********************************************************************* Definition
update Stuffs set  Definition =
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
"basic move": 0,
"dodge": 0
},
"anatomy": {
"head": {
"skull": {},
"left eye": {},
"right eye": {},
"face": {}
},
"body": {
"neck": {},
"torso": {},
"groin": {}
},
"limbs": {
"left arm": {},
"right arm": {},
"left hand": {},
"right hand": {},
"left leg": {},
"right leg": {},
"left foot": {},
"right foot": {}
}
}
}'
where Id = 5000;

