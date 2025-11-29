/* task 2 */
-- this wroks fine for the old data 
SELECT
    'crm_old' AS datakälla,
    *,
    CASE
        WHEN email NOT LIKE '%@%.%' THEN 'Ogiltig email'
        WHEN region NOT IN ('EU', 'US') THEN 'Ogiltig region'
        WHEN status NOT IN ('active', 'inactive') THEN 'Ogiltig status'
        ELSE 'Giltig'
    END AS validerings_resultat
FROM
    staging.crm_old
UNION ALL

-- this solution is not correct for the new data since email bill data 1050 is @gmail..
/*SELECT
    'crm_new' AS datakälla,
    *,
    CASE
        WHEN email NOT LIKE '%@%.%' THEN 'Ogiltig email'
        WHEN region NOT IN ('EU', 'US') THEN 'Ogiltig region'
        WHEN status NOT IN ('active', 'inactive') THEN 'Ogiltig status'
        ELSE 'Giltig'
    END AS validerings_resultat
FROM
    staging.crm_new
*/

/* solution for the new data */
-- use REGEXP functions for the new data
-- because the above query cannot deal with the new data
SELECT * FROM staging.crm_new_raw
WHERE NOT regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+');

-- combine all three conditions
SELECT * FROM staging.crm_old_raw
WHERE NOT regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') OR
      NOT region IN ('EU', 'US') OR
      NOT status IN ('active', 'inactive');

SELECT * FROM staging.crm_new_raw
WHERE NOT regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') OR
      NOT region IN ('EU', 'US') OR
      NOT status IN ('active', 'inactive');


/* task 3 */
-- creates schema called constrained 
CREATE SCHEMA IF NOT EXISTS constrained; 

-- creates the first table for the old data 
CREATE TABLE IF NOT EXISTS constrained.crm_old (
    customer_id INTEGER UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR CHECK (email LIKE '%@%.%'),
    region VARCHAR CHECK (region IN ('EU', 'US')),
    status VARCHAR CHECK (status IN ('active', 'inactive'))
);

-- creates the second table for the new data
CREATE TABLE IF NOT EXISTS constrained.crm_new (
    customer_id INTEGER UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR CHECK (regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')),
    region VARCHAR CHECK (region IN ('EU', 'US')),
    status VARCHAR CHECK (status IN ('active', 'inactive'))
);

INSERT INTO constrained.crm_old
SELECT * 
FROM staging.crm_old_raw
WHERE regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');

INSERT INTO constrained.crm_new
SELECT * 
FROM staging.crm_new_raw
WHERE regexp_matches(email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+') AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');

/* Task 4 */
/* customers only recorded in the old CRM system */
SELECT customer_id
FROM staging.crm_old_raw
EXCEPT
SELECT customer_id
FROM staging.crm_new_raw
-- 7 customers are only in the old crm system

/* customers only recorded in the new CRM system */
SELECT customer_id
FROM staging.crm_new_raw
EXCEPT
SELECT customer_id
FROM staging.crm_old_raw
-- 6 customers are only in the new crm system

/* customers recorded in both CRM system */
SELECT customer_id
FROM staging.crm_new_raw
INTERSECT 
SELECT customer_id
FROM staging.crm_old_raw
-- 7 common customers in both crm systems



