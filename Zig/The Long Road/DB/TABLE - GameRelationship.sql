DROP TABLE IF EXISTS GameRelationship;
CREATE TABLE GameRelationship (
    sessionID    INTEGER,
    A_id         INTEGER,
    relationship INTEGER,
    B_id         INTEGER
);

-- relationship
-- ============
-- bit 0: A inside B
-- bit 1: A is a commander of B

