DELETE FROM model t USING model t2
WHERE t.name = t2.name
    AND t.id > t2.id;