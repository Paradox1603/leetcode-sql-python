DELETE FROM person where id IN
(SELECT id
FROM
(SELECT  *, ROW_NUMBER() 
                OVER(PARTITION BY email 
                    ORDER BY id) as rn
    FROM    Person)x
WHERE rn > 1);