SELECT MAX(salary) AS secondhighestsalary
  FROM (
   SELECT salary,
          dense_rank()
          OVER(
              ORDER BY salary desc
          ) AS rnk
     FROM employee
) x
 WHERE rnk = 2;