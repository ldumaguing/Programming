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
   GameCombatant.currState,
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
