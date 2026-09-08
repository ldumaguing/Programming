DROP VIEW IF EXISTS v_gameimg;
CREATE VIEW v_gameimg AS
SELECT
    A.sessionID,
    A.id,
    A.state_num,
    A.imgID,
    B.file,
    B.flag1,
    B.apf_val,
    B.apf_rng,
    B.hef_val,
    B.hef_rng,
    B.mf_val,
    B.caf_val,
    B.flag2,
    B.armor_val,
    B.flag3,
    B.ability1,
    B.ability2,
    B.apf2_val,
    B.apf2_rng,
    B.hef2_val,
    B.hef2_rng,
    B.URPapf_val,
    B.URPhef_val,
    B.ability3
FROM
    GameImg A,
    IMG     B
WHERE
    A.imgID = B.id;
















