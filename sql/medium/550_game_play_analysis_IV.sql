--PostgreSQL Solution

SELECT  ROUND((SELECT  COUNT(DISTINCT(f.player_id))) * 1.0 /
              (SELECT COUNT(DISTINCT(player_id)) FROM Activity),2) As fraction
FROM(   
    SELECT  player_id, min(event_date) as first_login
    FROM    Activity
    GROUP BY player_id)f
WHERE EXISTS(
    SELECT  1
    FROM    Activity a
    WHERE   a.player_id = f.player_id
    AND     a.event_date = f.first_login + INTERVAL '1 Day');