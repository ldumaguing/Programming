DROP TABLE IF EXISTS map;
CREATE TABLE map (
    filename     TEXT,
    hexID        TEXT,
    terrainName  TEXT,
    terrainType  INTEGER DEFAULT 0
);

-- terrainType
--     1: whole hexagon
--     2: spine location
--     3: road, path, etc.  The spines are exits from starting hexagon

