--PostgreSQL Solution

SELECT name as results
FROM(
    SELECT  u.user_id, 
            u.name, 
            COUNT(*) AS cnt
    FROM    Movierating m
    JOIN    Users u
    ON      m.user_id = u.user_id
    GROUP BY u.user_id,u.name
    ORDER BY cnt DESC, u.name
    LIMIT 1)a
UNION ALL
SELECT  title as results
FROM(SELECT m.movie_id,
            m.title,
            AVG(mr.rating) AS avg_rating
    FROM    Movierating mr
    JOIN    Movies m
    ON      mr.movie_id = m.movie_id
    WHERE   mr.created_at >= '2020-02-01' 
    AND     mr.created_at <  '2020-03-01'
    GROUP BY m.movie_id,m.title
    ORDER BY avg_rating DESC,m.title
    LIMIT 1
    )b;