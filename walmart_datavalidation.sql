-- total rows count -----
SELECT COUNT(*) FROM walmart_sales;

-- checking  null values ---
SELECT 
COUNT(*) - COUNT(store) AS missing_store,
COUNT(*) - COUNT(date) AS missing_date
FROM walmart_sales;

-- for checking  duplicates 
SELECT store, date, COUNT(*)
FROM walmart_sales
GROUP BY store, date
HAVING COUNT(*) > 1;

