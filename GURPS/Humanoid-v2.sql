delete from Objects where Id = 5000;
insert into Objects (Id, ClassType, Name, Definition, Body) values (
5000,
'Humanoid',
'John Doe',
JSON_OBJECT(),
JSON_OBJECT()
);

-- ********************************************************************* Definition
update Objects set Definition =
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
"arms": {},
"legs": {}
}
}'
where Id = 5000;

select json_detailed(Definition), json_detailed(Body) from Objects where Id = 5000;
-- mysql GURPS -p'sasamichan[]()' < Humanoid-v3.sql | sed 's/\\n/\n/g' | sed 's/\t/\n************\n/g'





