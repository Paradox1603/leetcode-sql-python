SELECT  id,
        CASE 
            WHEN p_id IS NULL THEN 'Root'
            WHEN id IN (SELECT distinct p_id FROM Tree) THEN 'Inner'
            ELSE 'Leaf'
        END AS type
FROM    tree;