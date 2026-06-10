-- BUSINESS QUESTIONS:
-- 1. Which category generates most revenue?
-- 2. Which region performs best?
-- 3. What are top 10 best selling products?
-- 4. Which shipping mode is most popular?
-- 5. Which customer segment drives most sales?
-- 6. What is the monthly sales trend?

-- Q1: Sales performance by Category
SELECT Category, 
    COUNT(*) AS total_order,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_order_value
FROM superstor-analysis.superstore_db.superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- Q2: Regional Sales Performance
SELECT Region,
     COUNT(*) AS total_orders,
     ROUND(SUM(Sales), 2) AS total_sales,
     ROUND(AVG(Sales), 2) AS avg_order_value
FROM superstor-analysis.superstore_db.superstore
GROUP BY Region
ORDER BY total_sales DESC;

--Q3: Top 10 Best Selling Products
SELECT `Product Name`,
    Category,
    COUNT(*) AS times_ordered,
    ROUND(SUM(Sales), 2) AS total_sales
FROM `superstor-analysis.superstore_db.superstore`
GROUP BY `Product Name`, Category
ORDER BY total_sales
LIMIT 10;

--Q4: Shipping Mode Analysis
SELECT `Ship Mode`,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*)* 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM `superstor-analysis.superstore_db.superstore`
GROUP BY `Ship Mode`
ORDER BY total_orders DESC;

--Q5: Customer Segment Analysis
SELECT Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_order_value
FROM `superstor-analysis.superstore_db.superstore`
GROUP BY Segment
ORDER BY total_sales DESC;

--Q6: Monthly Sales Trend
SELECT FORMAT_DATE('%Y-%m', `Order Date`) AS month,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales
FROM `superstor-analysis.superstore_db.superstore`
GROUP BY month
ORDER BY month;