# Top 10 actors by revenue

```sql actor_revenue_summary
select 
    actor_name,
    sum(amount) as total_revenue
from sakila.actor_revenue
group by actor_id, actor_name
ORder by total_revenue desc
limit 10;
```

This chart displays the top 10 actors ranked by total revenue generated from films they appear in. Revenue is calculated by tracing renatal payments back to films and their associated actors. This analysis helps identify actors whose films consistently drive higher rental income.

<BarChart
    data={actor_revenue_summary}
    x="actor_name"
    y="total_revenue"
    title="Top 10 Actors by total revenue"
    swapXY = true
    labels=true
    labelFmt=usd0
/>

This data was sourced from Sakila movie rentals<Info description="sakila.movierentals.com" />