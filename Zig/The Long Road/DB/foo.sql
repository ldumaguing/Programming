
***********************************************
create view v_combatant as
select
   DDD.id,
   DDD.descrip,
   DDD.file0,
   DDD.file1,
   DDD.file2,
   DDD.file3,
   img.file       wreck
from (
select
   CCC.id,
   CCC.descrip,
   CCC.file0,
   CCC.file1,
   CCC.file2,
   img.file       file3,
   CCC.wreck
from (
select
   BBB.id,
   BBB.descrip,
   BBB.file0,
   BBB.file1,
   img.file       file2,
   BBB.state3,
   BBB.wreck
from (
select 
   AAA.id,
   AAA.descrip,
   AAA.file0,
   img.file       file1,
   AAA.state2,
   AAA.state3,
   AAA.wreck
from (
select
   combatant.id,
   combatant.descrip,
   img.file       file0,
   combatant.state1,
   combatant.state2,
   combatant.state3,
   combatant.wreck
from
   combatant, img
where
   combatant.state0 = img.id
) AAA, img
where
   AAA.state1 = img.id
) BBB, img
where
   BBB.state2 = img.id
) CCC, img
where
   CCC.state3 = img.id
) DDD, img
where
   DDD.wreck = img.id
;


***********************************************
select
   BBB.id,
   BBB.descrip,
   BBB.file0,
   BBB.file1,
   img.file       file2,
   BBB.state3
from (
select 
   AAA.id,
   AAA.descrip,
   AAA.file0,
   img.file       file1,
   AAA.state2,
   AAA.state3
from (
select
   combatant.id,
   combatant.descrip,
   img.file       file0,
   combatant.state1,
   combatant.state2,
   combatant.state3
from
   combatant, img
where
   combatant.state0 = img.id
) AAA, img
where
   AAA.state1 = img.id
) BBB, img
where
   BBB.state2 = img.id
;






***********************************************
select 
   AAA.id,
   AAA.descrip,
   AAA.file0,
   img.file       file1,
   AAA.state2,
   AAA.state3
from (
select
   combatant.id,
   combatant.descrip,
   img.file       file0,
   combatant.state1,
   combatant.state2,
   combatant.state3
from
   combatant, img
where
   combatant.state0 = img.id
) AAA, img
where
   AAA.state1 = img.id
;


***********************************************
select
   combatant.id,
   combatant.descrip,
   img.file,
   combatant.state1,
   combatant.state2,
   combatant.state3
from
   combatant, img
where
   chit.state0 = img.id;
