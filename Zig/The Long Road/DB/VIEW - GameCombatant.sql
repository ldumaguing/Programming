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
