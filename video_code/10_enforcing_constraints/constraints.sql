CREATE TABLE
    IF NOT EXISTS students (name VARCHAR NOT NULL, age UINT8);

-- INSERT INTO students (name, age)
-- VALUES (NULL, 8), ('AMY', 5);
/* DROP TABLE students;

CREATE TABLE
students (name VARCHAR UNIQUE, age UINT8);

INSERT INTO
students (name, age)
VALUES
('Amy', 13),
('Bill', 5);

INSERT INTO
students (name, age)
VALUES
('Bill', 5); */
/*
DROP TABLE students;

CREATE TABLE
students (name VARCHAR UNIQUE, age UINT8 CHECK (age >= 18));

INSERT INTO
students (name, age)
VALUES
('Bill', 18);

FROM
students;
 */
DROP TABLE students;

CREATE TABLE
    students (
        name VARCHAR UNIQUE,
        school_year INTEGER DEFAULT 2025
    );
INSERT INTO students (name)
VALUES ('Amy'), ('bill');


FROM
    students;