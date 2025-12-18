select
    c.name as name,
    p.amount as amount
from staging.category c
join staging.film_category fc on c.category_id = fc.category_id
join staging.film f on fc.film_id = f.film_id
join staging.inventory i on f.film_id = i.film_id
join staging.rental r on i.inventory_id = r.inventory_id
join staging.payment p on r.rental_id = p.rental_id;
