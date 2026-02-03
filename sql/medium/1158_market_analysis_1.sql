WITH order_summary AS(
    SELECT  o.buyer_id, 
            COUNT(*) AS cnt
    FROM    orders o
    WHERE   o.order_date BETWEEN '2019-01-01' AND '2019-12-31'
    GROUP BY o.buyer_id
    )

SELECT  u.user_id AS buyer_id,
        u.join_date,
        COALESCE(os.cnt,0) AS orders_in_2019
FROM    Users u
LEFT JOIN order_summary os
ON      os.buyer_id = u.user_id;