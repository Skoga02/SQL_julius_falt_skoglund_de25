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
    labels=true
    labelFmt=usd0
/>

