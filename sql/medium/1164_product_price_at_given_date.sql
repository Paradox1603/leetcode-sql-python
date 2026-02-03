SELECT  b.product_id, 
        b.new_price AS price
FROM(
    SELECT  product_id,
            MAX(change_date) AS max_date
    FROM    products
    WHERE   change_date <= '2019-08-16'
    GROUP BY product_id
    ) a
JOIN    products b
ON      a.max_date = b.change_date
AND     a.product_id = b.product_id

UNION

SELECT  product_id, 10
FROM    Products p2
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16'