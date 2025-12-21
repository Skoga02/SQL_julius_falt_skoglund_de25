---
title: Sakila movie rental dashboard
---

**Best performing categories **

This dashboard provides an overview of key revenue sources across our movie rental business. By analyzing category, actor and customer we can identify trends, highlight top contributers, and better understand which areas generate the most value. 

These insights form a foundtaion fot the future business and strategic planning for 2026. 


<!-- Found this pie chart query structure on evidences own webpage. -->
```sql pie_query
select 'Actors' as pie, 200 as count
union all
select 'Films' as pie, 1000 as count
union all
select 'Categories' as pie, 16 as count
```

```sql pie_data
select pie as name, count as value
from ${pie_query}
```


<ECharts config={
  {
    tooltip: {
      formatter: '{b}: {c}: ({d}%)'
    },
    series: [
      {
        type: 'pie',
        data: [...pie_data],
      }
    ]
  }
}
/>