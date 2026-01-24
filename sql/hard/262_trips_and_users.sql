WITH cancelled_trips AS (
    SELECT COUNT(*) AS cancelled, request_at
    FROM Trips t
    WHERE status 
        LIKE 'cancelled%'
    AND request_at 
        BETWEEN '2013-10-01' AND '2013-10-03'
    AND NOT EXISTS (
        SELECT 1 
        FROM Users u
        WHERE u.users_id = t.client_id 
        AND u.banned = 'Yes'
    )
      AND NOT EXISTS (
          SELECT 1 
          FROM Users u
          WHERE u.users_id = t.driver_id 
          AND u.banned = 'Yes'
      )
    GROUP BY request_at
),
total_trips AS (
    SELECT COUNT(*) AS total, request_at
    FROM Trips t
    WHERE request_at 
        BETWEEN '2013-10-01' AND '2013-10-03'
    AND NOT EXISTS (
        SELECT 1 
        FROM Users u
        WHERE u.users_id = t.client_id 
        AND u.banned = 'Yes'
    )
    AND NOT EXISTS (
        SELECT 1 
        FROM Users u
        WHERE u.users_id = t.driver_id 
        AND u.banned = 'Yes'
    )
    GROUP BY request_at
)
SELECT
    t.request_at AS Day,
    ROUND(COALESCE(c.cancelled, 0) * 1.0 / t.total, 2) AS "Cancellation Rate"
FROM total_trips t
LEFT JOIN cancelled_trips c
  ON t.request_at = c.request_at
ORDER BY t.request_at;