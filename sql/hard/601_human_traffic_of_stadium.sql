WITH FilteredData AS (
    -- Step 1: Filter rows with 100+ people
    SELECT 
        id, 
        visit_date, 
        people,
        -- Step 2: Create a grouping identifier
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM Stadium
    WHERE people >= 100
),
GroupCounts AS (
    -- Step 3: Count how many rows are in each group
    SELECT 
        *,
        COUNT(*) OVER (PARTITION BY grp) AS cnt
    FROM FilteredData
)
-- Step 4: Select rows belonging to groups with 3 or more records
SELECT 
    id, 
    visit_date, 
    people
FROM GroupCounts
WHERE cnt >= 3
ORDER BY visit_date;