select
    c.customer_id,
    c.first_name || ' ' || c.last_name as customer_name,
    p.amount as amount
from staging.customer c
join staging.payment p
    on c.customer_id = p.customer_id;