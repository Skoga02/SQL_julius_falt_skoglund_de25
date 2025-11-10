-- ascending order 
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd;

-- descending order 
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd desc;

-- sort by salary_in_usd descending and employee_residence ascending
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd DESC,
    employee_residence ASC;

