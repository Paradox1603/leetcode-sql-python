SELECT Department, Employee, Salary FROM
(SELECT d.name as Department,
        e.name as Employee, 
        e.salary as Salary, 
        dense_rank() OVER(PARTITION BY d.name ORDER BY e.salary DESC) as rnk
FROM    employee e
JOIN    department d
ON      e.departmentid = d.id)x
WHERE   x.rnk <= 3;