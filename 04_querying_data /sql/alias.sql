SELECT DISTINCT
    salary_currency AS unicue_currency
FROM
    data_jobs;

-- nicer name 
SELECT
    COUNT(DISTINCT salary_currency) AS number_currencies
FROM
    data_jobs;



SELECT
    ROW_NUMBER() OVER () AS id,
    *
FROM
    data_jobs;