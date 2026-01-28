SELECT id, COUNT(*) as num
FROM(   SELECT requester_id As id
        FROM requestaccepted
        UNION ALL
        SELECT accepter_id AS id
        FROM requestaccepted)
GROUP BY id
ORDER BY num desc
LIMIT 1;