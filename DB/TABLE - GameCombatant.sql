DROP TABLE IF EXISTS GameCombatant;
CREATE TABLE GameCombatant (
    sessionID  INTEGER,
    instanceID INTEGER,
    hex_x      INTEGER DEFAULT -100,
    hex_y      INTEGER DEFAULT -100,
    hex_z      INTEGER DEFAULT -100,
    flag1      INTEGER DEFAULT 0,
    --
    id         INTEGER,  -- combatant ID
    currState  INTEGER,  -- img ID
    PRIMARY KEY (sessionID, instanceID)
);

-- flag1
-- =====
-- bit 0: visibility




