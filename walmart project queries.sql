-- Walmart Project Queries - MySQL

SELECT * FROM walmart;
-- DROP TABLE walmart;
-- DROP TABLE walmart;
-- Count total records
SELECT COUNT(*) FROM walmart;

-- Count payment methods and number of transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments
FROM walmart
GROUP BY payment_method;

-- Count distinct branches
SELECT COUNT(DISTINCT branch) FROM walmart;

-- Find the minimum quantity sold
SELECT MIN(quantity) FROM walmart;

-- Business Problem Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- find total revenue of each product category and display the categories in descending order of revenue.
SELECT category, SUM(total) AS revenue
FROM walmart
GROUP BY category
ORDER BY revenue DESC;


-- Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating
SELECT branch,
       category,
       avg_rating,
       ranks              
FROM (
    SELECT
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER (PARTITION BY branch ORDER BY AVG(rating) DESC) AS ranks
    FROM walmart
    GROUP BY branch, category
) AS ranked_table
WHERE ranks = 1;

-- Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions, ranks
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranks
    FROM walmart
    GROUP BY branch, day_name
) AS ranked
WHERE ranks = 1;

-- Calculate the total quantity of items sold per payment method
SELECT 
    payment_method,
    SUM(quantity) AS no_qty_sold
FROM walmart
GROUP BY payment_method;

-- Determine the average, minimum, and maximum rating of categories for each city
-- LIst the city,average_rating,min_rating and max_rating.
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM walmart
GROUP BY city, category;

--  Calculate the total profit for each category by considering total_profit as (unit_price * quantity*profit_margin).
-- list category and total_profit, orderd from highest to lowest profit.alter
SELECT 
    category,
    SUM(total) as total_revenue,
	 SUM(total * profit_margin) as profit
FROM walmart
GROUP BY 1;

-- Determine the most common payment method for each branch. display branch and the preferred_payment_method.
WITH cte AS (
    SELECT 
        branch,
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranks
    FROM walmart
    GROUP BY branch, payment_method
)
SELECT * 
FROM cte
WHERE ranks = 1;

-- Categorize sales into 3 groups Morning, Afternoon, and Evening shifts. 
-- find out which of the shift and number of invoices
SELECT
  branch,
  CASE
    WHEN HOUR(STR_TO_DATE(time, '%H:%i')) < 12 THEN 'Morning'
    WHEN HOUR(STR_TO_DATE(time, '%H:%i')) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS num_invoices
FROM walmart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;

-- Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart 
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;


-- SELF JOIN — Find pairs of invoices by same customer on same day
-- Find invoice pairs where the same customer made >1 invoice on the same day
SELECT
    a.invoice_id AS invoice_a,
    b.invoice_id AS invoice_b,
    a.Branch,
    a.City,
    a.date
FROM walmart a
JOIN walmart b
ON a.Branch = b.Branch
AND a.City = b.City
AND a.date = b.date
AND a.invoice_id < b.invoice_id
LIMIT 50;



