--PostgreSQL solution
SELECT id
FROM (SELECT  *, 
              lag(temperature) OVER(ORDER BY recordDate) As prev_temp,
              lag(recordDate) OVER(ORDER BY recordDate) As prev_date
FROM    weather)
WHERE temperature > prev_temp
AND   recordDate = prev_Date + INTERVAL '1 Day';