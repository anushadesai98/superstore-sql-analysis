# Superstore SQL Analysis

SQL-based analysis of retail sales data using the Sample Superstore dataset (9,694 records), performed in MySQL Workbench.

## What This Project Covers
- *Aggregations*: Total sales by region using GROUP BY
- *CASE statements*: Customer tiering (High/Medium/Low value) based on total spend
- *Window functions*: RANK() to identify top customers by spend, and per-customer highest order
- *CTEs (WITH clause)*: Reusable subqueries for cleaner, modular logic
- *Subqueries*: Identifying orders above the average sale value

## Key Findings
- *West* is the top-performing region by sales; *South* is the weakest
- *Tables* and *Bookcases* sub-categories operate at a net loss on average profit
- Top 10 customers by total spend were identified using window functions, led by Sean Miller (~₹25,000)

## Tools Used
MySQL, MySQL Workbench

## Dataset
Sample Superstore Dataset — also used in my related EDA/RFM segmentation project
