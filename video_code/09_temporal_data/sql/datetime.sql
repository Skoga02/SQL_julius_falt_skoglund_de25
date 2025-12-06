DESC staging.sweden_holidays;

FROM
    staging.sweden_holidays
LIMIT
    5;

-- subtraction 
SELECT
    date,
    date + interval 5 day AS plus_5_days,
    typeof (plus_5_days) AS plus_5_days_type
FROM
    staging.sweden_holidays;

-- subtraction 
SELECT
    date,
    date - interval 5 day AS minus_5_days,
    typeof (minus_5_days) AS minus_5_days_type
FROM
    staging.sweden_holidays;

-- date functions
SELECT
    today ();

SELECT
    *,
    today () AS today
FROM
    staging.sweden_holidays;

-- pick out weekday
SELECT
    date,
    dayname (date) as weekday
FROM
    staging.sweden_holidays;

-- latest from two dates
SELECT
    *,
    todays () AS today,
    greatest (date, today) AS later_day
FROM
    staging.sweden_holidays;

-- convert date to string
SELECT
    date,
    strftime (date, '%d/%m/%y') AS date_string,
    typeof (date_string)
FROM
    staging.sweden_holidays;

-- convert string date to date
SELECT
    date,
    strftime (date, '%d/%m/%y') AS date_string,
    strptime (date_string, '%d/%m/%y')::DATE AS new_date,
    typeof (date_string)
FROM
    staging.sweden_holidays;