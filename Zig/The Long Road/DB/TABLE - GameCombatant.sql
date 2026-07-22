DROP TABLE IF EXISTS GameCombatant;
CREATE TABLE GameCombatant (
    sessionID TEXT,
    --
    id        INTEGER,
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




