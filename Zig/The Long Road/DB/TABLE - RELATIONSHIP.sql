DROP TABLE IF EXISTS RELATIONSHIP;
CREATE TABLE RELATIONSHIP (
    A_id         INTEGER,
    relationship INTEGER,
    B_id         INTEGER
);

-- relationship
-- ============
-- bit 0: A inside B
-- bit 1: A is a commander of B

