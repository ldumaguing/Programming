DROP TABLE IF EXISTS GameSave;
CREATE TABLE GameSave (
    id        TEXT NOT NULL,
    attrib    TEXT NOT NULL,
    val_int0  INTEGER DEFAULT 0,
    val_int1  INTEGER DEFAULT 0,
    val_int2  INTEGER DEFAULT 0,
    val_real0 REAL DEFAULT 0.0,
    val_real1 REAL DEFAULT 0.0,
    val_real2 REAL DEFAULT 0.0,
    val_text  TEXT DEFAULT ''
)
;
DELETE FROM GameSave WHERE id = 0;
INSERT INTO GameSave (id, attrib, val_int0, val_int1) VALUES
(0, 'pixelCount', 3637, 2803),
(0, 'hexCount', 19, 13),
(0, 'hexCenter', 0, 0)
;
INSERT INTO GameSave (id, attrib, val_text) VALUES
(0, 'A', 'Map A.png'),
(0, 'B', 'Map B.png'),
(0, 'C', 'Map C.png'),
(0, 'D', 'Map D.png'),
(0, 'E', 'Map E.png'),
(0, 'oddXshift', 'up') --- relative to (0,0), (1,0) is shifted up
;

