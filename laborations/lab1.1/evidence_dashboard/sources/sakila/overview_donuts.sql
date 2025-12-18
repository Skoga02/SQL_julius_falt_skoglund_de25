select 'Actors' as label, count(*) as total from staging.actor
union all 
select 'Films' as label, count(*) as total from staging.film
union all 
select 'Categories' as label, count(*) as total from staging.category;