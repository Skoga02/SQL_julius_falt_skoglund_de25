SELECT
    *
FROM
    database.python
WHERE
    id = 2;

DELETE FROM database.python
WHERE
    id = 2;


SELECT
    *
FROM
    database.duckdb
WHERE
    id > 10;


DELETE FROM
    database.duckdb
WHERE
    id > 10;