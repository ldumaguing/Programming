DROP VIEW IF EXISTS v_gamecombatant;
CREATE VIEW v_gamecombatant AS
SELECT
   GameCombatant.sessionID,
   GameCombatant.instanceID,
   GameCombatant.hex_x,
   GameCombatant.hex_y,
   GameCombatant.hex_z,
   GameCombatant.flag1,
   GameCombatant.id,
   IMG.file AS filename
FROM
   IMG, GameCombatant
WHERE
   IMG.id = GameCombatant.currState
;

v_combatant(id,descrip,file0,file1,file2,file3,wreck,faction) 

****************************************************************************
DROP VIEW IF EXISTS v_gamecombatant;
CREATE VIEW v_gamecombatant AS
SELECT
   GameCombatant.sessionID,
   GameCombatant.instanceID,
   GameCombatant.hex_x,
   GameCombatant.hex_y,
   GameCombatant.hex_z,
   GameCombatant.flag1,
   GameCombatant.id,
   IMG.file AS filename,
   COMBATANT.descrip,
   COMBATANT.faction
FROM
   IMG, GameCombatant, COMBATANT
WHERE
   IMG.id = GameCombatant.currState
   AND
   COMBATANT.id = GameCombatant.id
;
