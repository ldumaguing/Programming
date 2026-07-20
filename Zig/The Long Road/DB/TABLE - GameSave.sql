DROP TABLE IF EXISTS GameSave;
CREATE TABLE GameSave (
    id       TEXT NOT NULL,
    attrib   TEXT NOT NULL,
    val_num  INTEGER DEFAULT 0,
    val_real REAL DEFAULT 0.0,
    val_text TEXT DEFAULT ''
);






