WITH first_orders AS(
    SELECT  delivery_id,
            customer_id,
            CASE WHEN order_date = customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled'
            END AS order_type
        FROM(SELECT  *,
                ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
        FROM    Delivery)t1
    WHERE rn = 1),

total_first_orders AS(
    SELECT  COUNT(*) AS cnt
    FROM    first_orders
),

total_immediate_orders AS(
    SELECT  COUNT(*) AS cnt
    FROM    first_orders
    WHERE   order_type = 'immediate'
)

SELECT  ROUND(
        CAST((total_immediate_orders.cnt * 1.0 / total_first_orders.cnt * 100) AS numeric)
            ,2)  AS immediate_percentage
FROM    total_immediate_orders, total_first_orders;