
-- Compare total count to distinct count
SELECT 
    COUNT(*)
FROM
    transactions;
-- 3455

SELECT 
    COUNT(*)
FROM
    (SELECT DISTINCT
        *
    FROM
        transactions) AS temp;
-- 3455
