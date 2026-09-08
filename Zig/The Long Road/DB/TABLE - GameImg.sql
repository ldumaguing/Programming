DROP TABLE IF EXISTS GameImg;
CREATE TABLE GameImg (
    sessionID INTEGER,
    id        INTEGER,
    state_num INTEGER,
    imgID     INTEGER,
    filename  TEXT
);




-- .mode csv
-- .import chit.csv chit
-- 
-- 
-- 
-- .mode csv
-- .headers on
-- .output chit.csv
-- select * from chit;
-- .output stdout
-- .quit




