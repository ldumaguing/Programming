DROP TABLE IF EXISTS GameMeta;
CREATE TABLE GameMeta (
    sessionID INTEGER,
    attrib    TEXT NOT NULL,
    val_int0  INTEGER DEFAULT 0,
    val_int1  INTEGER DEFAULT 0,
    val_int2  INTEGER DEFAULT 0,
    val_real0 REAL DEFAULT 0.0,
    val_real1 REAL DEFAULT 0.0,
    val_real2 REAL DEFAULT 0.0,
    val_text  TEXT DEFAULT '',
    PRIMARY KEY (sessionID, attrib)
)
;
INSERT INTO GameMeta (sessionID, attrib, val_int0, val_int1) VALUES
(0, 'pixelCount', 3637, 2803),
(0, 'hexCount',  19,   13),
(0, 'hexCenter',  0,    0),
(0, 'hexPtA',   -66, -115),
(0, 'hexPtB',    66, -115),
(0, 'hexPtC',   132,    0),
(0, 'hexPtD',    66,  115),
(0, 'hexPtE',   264,    0),
(0, 'hexPtF',   -66,  115),
(0, 'hexPtG',  -132,    0),
(0, 'spinePtA',    0, -115),
(0, 'spinePtB',  100,  -57),
(0, 'spinePtC',  100,   57),
(0, 'spinePtD',  205,    0),
(0, 'spinePtE', -100,   57),
(0, 'spinePtF', -100,  -57)
;
INSERT INTO GameMeta (sessionID, attrib, val_text) VALUES
(0, 'A', 'Map A.png'),
(0, 'B', 'Map B.png'),
(0, 'C', 'Map C.png'),
(0, 'D', 'Map D.png'),
(0, 'E', 'Map E.png'),
(0, 'oddXshift', 'up') --- relative to (0,0), (1,0) is shifted up
;
INSERT INTO GameMeta (sessionID, attrib, val_int0) VALUES
(0, 'currSession', 0)
;
INSERT INTO GameMeta (sessionID, attrib, val_real0) VALUES
(0, 'pxX', 202.0),
(0, 'pxY', 233.5),
(0, 'pxHalfY', 116.75)
;

-- ************************************************************************************************
-- (3637 - 1) / (19 - 1) = 202      ; pxX
-- (2803 - 1) / (13 - 1) = 233.5    ; pxY
-- Y / 2                 = 116.75   ; pxHalfY




