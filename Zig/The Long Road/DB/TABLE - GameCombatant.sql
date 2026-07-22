DROP TABLE IF EXISTS GameCombatant;
CREATE TABLE GameCombatant (
    sessionID  INTEGER,
    instanceID INTEGER,
    --
    id         INTEGER,  -- combatant ID
    currState  INTEGER,  -- img ID
    PRIMARY KEY (sessionID, instanceID)
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




