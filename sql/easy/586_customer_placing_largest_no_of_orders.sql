SELECT  customer_number
FROM    orders
GROUP BY customer_number
HAVING COUNT(*) = ( 
                SELECT MAX(cnt) 
                FROM( 
                    SELECT  COUNT(*) as cnt
                    FROM    orders
                    GROUP BY customer_number));