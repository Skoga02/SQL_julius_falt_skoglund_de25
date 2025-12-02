/* ===========
   Aggregation
   =========== */

-- create the new table
CREATE TABLE IF NOT EXISTS staging.more_employees AS (
    SELECT * FROM read_csv_auto('data/more_employees.csv')
); 

-- count distinct department
SELECT COUNT(DISTINCT department)
FROM staging.more_employees; 