DROP TABLE IF EXISTS map;
CREATE TABLE map (
    terrainNum   INTEGER DEFAULT 0,
    hex_x        INTEGER DEFAULT 0,
    hex_y        INTEGER DEFAULT 0,
    hex_z        INTEGER DEFAULT 0,
    filename     TEXT,
    hexID        TEXT, -- j10
    terrainName  TEXT,
    terrainType  INTEGER DEFAULT 0,
    spineLoc     INTEGER DEFAULT 0, -- fedcba (111111)
    PRIMARY KEY (terrainNum, hex_x, hex_y, hex_z)
);

-- terrainType
--     1: whole hexagon
--     2: spine location
--     3: road, path, etc.  The spines are exits from starting hexagon

-- terrainNum
--     BRIDGE:       1
--     CITY:         2
--     CULTIVATED:   3
--     FOREST:       4
--     HILL:         5
--     HILL2:        6
--     LAKE:         7
--     RIVER:        8
--     ROAD:         9
--     ROLLING:     10
--     TOWN:        11
--     TUNNEL ROAD: 12

