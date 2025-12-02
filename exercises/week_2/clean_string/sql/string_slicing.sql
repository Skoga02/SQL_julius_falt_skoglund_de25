-- task 2: find rows that do not contain the title column value in the context column value.
SELECT
    *
FROM
    staging.squad
WHERE
    context NOT LIKE CONCAT ('%', title, '%');

-- task 3: find rows that start with title column value in the context column value.
SELECT
    *
FROM
    staging.squad
WHERE
    context LIKE CONCAT ('%', title, '%');

-- task 4: create a new column which is the first answer of the AI model. Do not use pattern matching in your query
ALTER TABLE staging.squad
ADD COLUMN first_answer_ai
