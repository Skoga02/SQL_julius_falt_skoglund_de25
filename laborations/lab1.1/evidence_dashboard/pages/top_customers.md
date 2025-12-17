# Top 5 customers by total spend 

```sql top_customer_summary
select
    customer_name,
    sum(amount) as total_spent
from sakila.top_customer
group by customer_name
order by total_spent desc
limit 5;
```

<BarChart
    data={top_customer_summary}
    x="customer_name"
    y="total_spent"
    title="Top 5 Customers by Total Spend"
    swapXY={true}
/>