--PostgreSQL Solution
SELECT  query_name, 
        ROUND(AVG(rating::float / position::float)::numeric,2) as quality,
        ROUND(
            ((COUNT(*) FILTER(WHERE rating < 3)::float) / 
            (COUNT(*)::float) * 100)::numeric
        ,2) AS poor_query_percentage
FROM    Queries
GROUP BY query_name