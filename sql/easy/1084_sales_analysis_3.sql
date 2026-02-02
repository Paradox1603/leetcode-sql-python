SELECT  DISTINCT p.product_id, p.product_name
FROM    product p
JOIN    sales s1
ON      p.product_id = s1.product_id
WHERE   s1.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
AND NOT EXISTS (
                SELECT  1
                FROM    sales s2
                WHERE   s2. product_id = p. product_id
                AND     s2.sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31');