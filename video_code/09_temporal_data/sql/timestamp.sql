desc staging.train_schedules;

FROM
    staging.train_schedules;

SELECT
    scheduled_arrival,
    actual_arrival,
    delay_minutes,
    age (actual_arrival, scheduled_arrival) AS delay_interval,
    typeof (delay_interval)
FROM
    staging.train_schedules;

SELECT
    current_localtimestamp ();

SELECT
    current_localtimestamp () AS current_time,
    date_trunc ('second', current_time) as second;

-- truncate a timestamp to specific precision
SELECT
    scheduled_arrival,
    date_trunc ('hour', scheduled_arrival) AS scheduled_arrival_trunc
FROM
    staging.train_schedules;

--extract subfield of timestamp
-- show arrival hour in text 
SELECT
    scheduled_arrival,
    'kl. ' || extract(
        'hour'
        FROM
            scheduled_arrival
    ) AS scheduled_arrival_hour
FROM
    staging.train_schedules

