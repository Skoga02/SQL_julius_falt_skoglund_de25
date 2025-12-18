select 
    a.actor_id,
    a.first_name || ' ' || a.last_name as actor_name,
    p.amount
from staging.actor a 
join staging.film_actor fa on a.actor_id = fa.actor_id
join staging.film f on fa.film_id = f.film_id
join staging.inventory i on f.film_id = i.film_id
join staging.rental r on i.inventory_id = r.inventory_id
join staging.payment p on r.rental_id = p.rental_id