SELECT
    job_title,
    experience_level,
    ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_month
FROM
    data_jobs
WHERE
    (salary_sek_month > 200000)
    AND (salary_sek_month < 3000000)
ORDER BY
    salary_sek_month DESC;

-- BETWEEN ... AND (more readable)
SELECT
    job_title,
    experience_level,
    ROUND((9.44 * salary_in_usd) / 12) AS salary_sek_month
FROM
    data_jobs
WHERE
    salary_sek_month BETWEEN 200000 AND 3000000
ORDER BY
    salary_sek_month DESC;

-- OR operator
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    experience_level = 'Senior level'
    OR experience_level = 'Expert level';

-- NOT operator
SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    NOT (
        experience_level = 'Senior level'
    or experience_level = 'Expert level');