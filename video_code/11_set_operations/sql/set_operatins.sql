SELECT
    *
FROM
    synthetic.sales_jan;

SELECT
    *
FROM
    synthetic.sales_jan
UNION
SELECT
    *
FROM
    synthetic.sales_feb;

SELECT product_name, amount FROM synthetic.sales_jan
UNION
SELECT product_name, amount FROM synthetic.sales_feb;


SELECT product_name, amount FROM synthetic.sales_jan
UNION ALL
SELECT product_name, amount FROM synthetic.sales_feb;

-- takes the results that exist in both jan and feb
SELECT product_name, FROM synthetic.sales_jan
INTERSECT 
SELECT product_name, FROM synthetic.sales_feb;

-- whats left when you remove result from b from a 
SELECT product_name, amount FROM synthetic.sales_jan
EXCEPT
SELECT product_name, amount FROM synthetic.sales_feb;

