SELECT MAX(salary)
FROM(
    SELECT  salary,
            dense_rank() OVER(ORDER BY salary DESC) AS rnk
    FROM employee)x
WHERE   rnk = N;