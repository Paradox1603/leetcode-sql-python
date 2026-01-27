SELECT  class
FROM    courses
GROUP BY class
HAVING count(*) >= 5;