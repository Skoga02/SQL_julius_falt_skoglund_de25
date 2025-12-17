


## Movies longer than 180 minutes

```sql long_movies
SELECT
    title,
    length
FROM film
WHERE length > 180;
```

## Which movies have the word "love" in its title?

```sql love_title
SELECT 
    title, 
    rating, 
    length, 
    description
FROM film
WHERE REGEXP_MATCHES(TRIM(title), '\\blove\\b', 'i');
```



```sql category_revenue_summary
select
    name as category,
    sum(amount) as total_revenue
from sakila.category_revenue
group by name
order by total_revenue desc;
```


<BarChart
    data={category_revenue_summary}
    x="category"
    y="total_revenue"
    title="Total Revenue per Film Category"
    swapXY = true
/>