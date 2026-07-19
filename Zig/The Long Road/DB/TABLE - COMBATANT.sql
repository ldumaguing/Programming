DROP TABLE IF EXISTS combatant;
CREATE TABLE combatant (
    id        INTEGER PRIMARY KEY,
    descrip   TEXT,
    state0    INTEGER,  -- img ID
    state1    INTEGER,  -- img ID
    state2    INTEGER,  -- img ID
    state3    INTEGER,  -- img ID
    wreck     INTEGER,  -- img ID
    faction   TEXT,
    version   INTEGER,
    stateType TEXT
);

-- drop view if exists v_combatant;
-- create view v_combatant as
-- select
--    DDD.id,
--    DDD.descrip,
--    DDD.file0,
--    DDD.file1,
--    DDD.file2,
--    DDD.file3,
--    img.file       wreck,
--    DDD.faction
-- from (
-- select
--    CCC.id,
--    CCC.descrip,
--    CCC.file0,
--    CCC.file1,
--    CCC.file2,
--    img.file       file3,
--    CCC.wreck,
--    CCC.faction
-- from (
-- select
--    BBB.id,
--    BBB.descrip,
--    BBB.file0,
--    BBB.file1,
--    img.file       file2,
--    BBB.state3,
--    BBB.wreck,
--    BBB.faction
-- from (
-- select 
--    AAA.id,
--    AAA.descrip,
--    AAA.file0,
--    img.file       file1,
--    AAA.state2,
--    AAA.state3,
--    AAA.wreck,
--    AAA.faction
-- from (
-- select
--    combatant.id,
--    combatant.descrip,
--    img.file       file0,
--    combatant.state1,
--    combatant.state2,
--    combatant.state3,
--    combatant.wreck,
--    combatant.faction
-- from
--    combatant, img
-- where
--    combatant.state0 = img.id
-- ) AAA, img
-- where
--    AAA.state1 = img.id
-- ) BBB, img
-- where
--    BBB.state2 = img.id
-- ) CCC, img
-- where
--    CCC.state3 = img.id
-- ) DDD, img
-- where
--    DDD.wreck = img.id
-- ;


-- 
-- 
-- 
-- 
-- 
-- 
-- .mode csv
-- .import chit.csv chit
-- 
-- 
-- 
-- .mode csv
-- .headers on
-- .output chit.csv
-- select * from chit;
-- .output stdout
-- .quit




