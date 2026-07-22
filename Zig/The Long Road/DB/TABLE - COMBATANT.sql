DROP TABLE IF EXISTS COMBATANT;
CREATE TABLE COMBATANT (
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
--    IMG.file            wreck,
--    DDD.faction
-- from (
-- select
--    CCC.id,
--    CCC.descrip,
--    CCC.file0,
--    CCC.file1,
--    CCC.file2,
--    IMG.file            file3,
--    CCC.wreck,
--    CCC.faction
-- from (
-- select
--    BBB.id,
--    BBB.descrip,
--    BBB.file0,
--    BBB.file1,
--    IMG.file            file2,
--    BBB.state3,
--    BBB.wreck,
--    BBB.faction
-- from (
-- select 
--    AAA.id,
--    AAA.descrip,
--    AAA.file0,
--    IMG.file            file1,
--    AAA.state2,
--    AAA.state3,
--    AAA.wreck,
--    AAA.faction
-- from (
-- select
--    COMBATANT.id,
--    COMBATANT.descrip,
--    IMG.file            file0,
--    COMBATANT.state1,
--    COMBATANT.state2,
--    COMBATANT.state3,
--    COMBATANT.wreck,
--    COMBATANT.faction
-- from
--    COMBATANT, IMG
-- where
--    COMBATANT.state0 = IMG.id
-- ) AAA, IMG
-- where
--    AAA.state1 = IMG.id
-- ) BBB, IMG
-- where
--    BBB.state2 = IMG.id
-- ) CCC, IMG
-- where
--    CCC.state3 = IMG.id
-- ) DDD, IMG
-- where
--    DDD.wreck = IMG.id
-- ;







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




