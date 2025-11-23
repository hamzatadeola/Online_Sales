CREATE TABLE orders(
order_id VARCHAR (50),
order_date DATE,
customer_id VARCHAR (50),
total_price NUMERIC (50),
product_id VARCHAR (50)
);

SELECT *
FROM orders;

DELETE FROM orders
WHERE product_id = '#N/A';

-- a. Use EXTRACT(MONTH FROM order_date) for month
SELECT 
EXTRACT (YEAR FROM order_date) AS Year
FROM orders;

--b. Group by year/month
SELECT 
EXTRACT (YEAR FROM order_date) AS Year
FROM orders
GROUP BY EXTRACT (YEAR FROM order_date);

SELECT 
EXTRACT (MONTH FROM order_date) AS Month
FROM orders
GROUP BY EXTRACT (MONTH FROM order_date);

-- c. Use SUM() for revenue
SELECT SUM(total_price) AS total_revenue
FROM orders;

-- d. count(distinct order_id) for volume
SELECT 
EXTRACT (MONTH FROM order_date) AS Month,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY EXTRACT (MONTH FROM order_date);

-- e. Use ORDER BY for Sorting
SELECT 
EXTRACT (YEAR FROM order_date) AS Year,
EXTRACT (MONTH FROM order_date) AS Month,
SUM(total_price) AS total_revenue,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY Month,Year
ORDER BY Month,Year;

-- f. Limit to a specific time period
SELECT 
EXTRACT (YEAR FROM order_date) AS Year,
EXTRACT (MONTH FROM order_date) AS Month,
SUM(total_price) AS total_revenue,
COUNT(DISTINCT order_id) AS total_orders
FROM orders
WHERE EXTRACT (YEAR FROM order_date) = 2023
GROUP BY Month,Year
ORDER BY Month,Year;

