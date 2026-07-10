SELECT * FROM orders LIMIT 10;
SELECT COUNT(*) FROM orders;
SELECT Region, SUM(Sales) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;
SELECT Category, `Sub-Category`, ROUND(AVG(Profit),2) AS avg_profit
FROM orders
GROUP BY Category, `Sub-Category`
ORDER BY avg_profit ASC;
SELECT `Customer Name`,
       SUM(Sales) AS total_spend,
       RANK() OVER (ORDER BY SUM(Sales) DESC) AS spend_rank
FROM orders
GROUP BY `Customer Name`
ORDER BY spend_rank
LIMIT 10;
WITH customer_spend AS (
    SELECT `Customer Name`,
           SUM(Sales) AS total_spend
    FROM orders
    GROUP BY `Customer Name`
)
SELECT `Customer Name`,
       total_spend,
       CASE
           WHEN total_spend >= 10000 THEN 'High Value'
           WHEN total_spend >= 3000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_tier
FROM customer_spend
ORDER BY total_spend DESC
LIMIT 15;
SELECT `Customer Name`, `Order ID`, Sales
FROM orders
WHERE Sales > (
    SELECT AVG(Sales) FROM orders
)
ORDER BY Sales DESC
LIMIT 15;
USE superstore_db;
SELECT `Customer Name`, `Order ID`, Sales
FROM (
    SELECT `Customer Name`, `Order ID`, Sales,
           RANK() OVER (PARTITION BY `Customer Name` ORDER BY Sales DESC) AS rnk
    FROM orders
) ranked
WHERE rnk = 1
ORDER BY Sales DESC
LIMIT 15;