SELECT  e.name
FROM    employee e
JOIN   (
    SELECT  managerid
    FROM    employee
    GROUP BY managerid
    HAVING COUNT(*) >=5
)m
ON e.id = m.managerid;