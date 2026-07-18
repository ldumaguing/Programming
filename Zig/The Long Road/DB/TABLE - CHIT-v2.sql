DROP TABLE IF EXISTS chit;
CREATE TABLE chit (
    id      INTEGER PRIMARY KEY,
    descrip TEXT,
    state0  INTEGER,  -- img ID
    state1  INTEGER,  -- img ID
    state2  INTEGER,  -- img ID
    state3  INTEGER,  -- img ID
    faction TEXT,
    version INTEGER
);

-- create view v_combatant as
-- select
--    CCC.id,
--    CCC.descrip,
--    CCC.file0,
--    CCC.file1,
--    CCC.file2,
--    img.file       file3
-- from (
-- select
--    BBB.id,
--    BBB.descrip,
--    BBB.file0,
--    BBB.file1,
--    img.file       file2,
--    BBB.state3
-- from (
-- select 
--    AAA.id,
--    AAA.descrip,
--    AAA.file0,
--    img.file       file1,
--    AAA.state2,
--    AAA.state3
-- from (
-- select
--    chit.id,
--    chit.descrip,
--    img.file       file0,
--    chit.state1,
--    chit.state2,
--    chit.state3
-- from
--    chit, img
-- where
--    chit.state0 = img.id
-- ) AAA, img
-- where
--    AAA.state1 = img.id
-- ) BBB, img
-- where
--    BBB.state2 = img.id
-- ) CCC, img
-- where
--    CCC.state3 = img.id
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




