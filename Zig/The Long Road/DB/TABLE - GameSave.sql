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
);







