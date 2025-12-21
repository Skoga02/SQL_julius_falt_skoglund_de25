# Top 10 customers by total spend 

```sql top_customer_summary
select
    customer_name,
    sum(amount) as total_spent
from sakila.top_customer
group by customer_name
order by total_spent desc
limit 10;
```

This chart shows the top 10 customers based on their total rental spending. By aggregating all payment amounts per customer, we can identify high-value customers who contribute the most revenue to the business. These customers are strong candidates for loyalty programs and targeted promotions.

<BarChart
    data={top_customer_summary}
    x="customer_name"
    y="total_spent"
    title="Top 10 Customers by Total Spend"
    swapXY={true}
    labels=true
    labelFmt=usd0
/>