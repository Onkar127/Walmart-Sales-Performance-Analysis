-- Total Sales by each store ---
SELECT 
    Store,
    ROUND(SUM(Weekly_Sales),2) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC;

-- Average Weekly Sales per Store
SELECT 
    Store,
    ROUND(AVG(Weekly_Sales),2) AS avg_weekly_sales
FROM walmart_sales 
GROUP BY Store
ORDER BY avg_weekly_sales DESC;

-- Highest Weekly Sale Ever Recorded
SELECT 
    Store,
    Date,
    Weekly_Sales
FROM walmart_sales
ORDER BY Weekly_Sales DESC
LIMIT 10;


-- Monthly Sales Trend
SELECT 
    MONTH(Date) AS month,
    ROUND(SUM(Weekly_Sales),2) AS total_sales
FROM walmart_sales 
GROUP BY MONTH(Date)
ORDER BY month;

-- Temperature Impact on Sales
SELECT 
    ROUND(Temperature) AS temp_range,
    ROUND(AVG(Weekly_Sales),2) AS avg_sales
FROM walmart_sales
GROUP BY temp_range
ORDER BY temp_range;

-- Unemployment vs Sales
SELECT 
    ROUND(Unemployment,1) AS unemployment_rate,
    ROUND(AVG(Weekly_Sales),2) AS avg_sales
FROM walmart_sales
GROUP BY unemployment_rate
ORDER BY unemployment_rate;

-- Top 10 Best Performing Stores
SELECT 
    Store,
    SUM(Weekly_Sales) AS total_sales
FROM walmart_sales
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 10;

-- Strategic Priority Score
SELECT 
    Store,
    ROUND(
        (AVG(Weekly_Sales) / STDDEV(Weekly_Sales)) 
        * (1 / AVG(Unemployment))
    ,2) AS strategic_priority_score
FROM walmart_sales 
GROUP BY Store
ORDER BY strategic_priority_score DESC;

-- Holiday Impact on Sales
SELECT 
    Holiday_Flag,
    ROUND(AVG(Weekly_Sales),2) AS avg_sales
FROM walmart_sales
GROUP BY Holiday_Flag;

-- Economic Stress Impact
SELECT 
    CASE 
        WHEN Unemployment < 5 THEN 'Low'
        WHEN Unemployment BETWEEN 5 AND 6 THEN 'Moderate'
        ELSE 'High'
    END AS unemployment_level,
    ROUND(AVG(Weekly_Sales),2) AS avg_sales
FROM walmart_sales
GROUP BY unemployment_level;

-- Demand Stability Ranking
SELECT 
    Store,
    ROUND(AVG(Weekly_Sales)/STDDEV(Weekly_Sales),2) AS stability_score
FROM walmart_sales
GROUP BY Store
ORDER BY stability_score DESC;