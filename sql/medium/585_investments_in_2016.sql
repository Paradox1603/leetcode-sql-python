--PostgreSQL Solution

SELECT  ROUND(CAST(SUM(tiv_2016)AS numeric),2) AS "tiv_2016"
FROM    Insurance a
WHERE NOT EXISTS(
        SELECT  1
        FROM    INsurance b
        WHERE   a.pid <> b.pid
        AND     a.lat = b.lat
        AND     a.lon = b.lon)
AND EXISTS(
        SELECt  1
        FROM    INsurance c
        WHERE   a.pid <> c.pid
        AND     a.tiv_2015 = c.tiv_2015
);