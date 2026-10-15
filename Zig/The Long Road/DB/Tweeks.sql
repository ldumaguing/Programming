-- ************************* Tweeks
UPDATE IMG SET
   valid_cmd0 = (valid_cmd0 | (1 << 0)) - (valid_cmd0 & (1 << 0))
WHERE
   mf_val >= 0;
   
-- valid_cmd0
-- ==========
-- bit 0: move   
