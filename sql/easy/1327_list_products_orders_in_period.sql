WITH total_units AS(
    SELECT  product_id, 
            SUM(unit) AS unit
    FROM    Orders
    WHERE   order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
    )

SELECT  product_name, unit
FROM    Products p
JOIN    total_units t
ON      p.product_id = t.product_id
WHERE   unit >= 100;