SELECT
        CASE
            WHEN (id IN (SELECT max(id) FROM seat) AND id % 2 = 1) THEN id
            WHEN id % 2 = 1 THEN id + 1
            WHEN id % 2 = 0 THEN id - 1
            ELSE id
        END AS "id", student
FROM    Seat
ORDER BY id;