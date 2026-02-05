--PostgreSQL Solution

SELECT  person_name
FROM(SELECT *,
            SUM(weight) OVER(ORDER BY turn) AS running_total_weight
    FROM    Queue)t
WHERE running_total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;