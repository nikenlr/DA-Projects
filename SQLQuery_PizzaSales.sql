SELECT * FROM pizza_sales

-- Selecting total revenue
SELECT SUM(total_price) 
AS Total_Revenue 
FROM pizza_sales

-- Average order
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) 
AS Avg_Order_Value 
FROM pizza_sales

-- Total pizza have been sold
SELECT SUM(quantity) 
AS Total_Pizza_Sold 
FROM pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT order_id) 
AS Total_Orders 
FROM pizza_sales

-- Average pizzas per orders
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_Per_Order
FROM pizza_sales

-- Hourly trend for total pizza sold
SELECT 
    DATEPART(HOUR, order_time) as order_hours, 
    SUM(quantity) as total_pizzas_sold
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

-- Weekly trends for order
SELECT 
    DATEPART(ISO_WEEK, order_date) AS WeekNumber,
    YEAR(order_date) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY 
    DATEPART(ISO_WEEK, order_date),
    YEAR(order_date)
ORDER BY 
    Year, WeekNumber;

-- Percent of sales by pizza's category
SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percent_Category
FROM pizza_sales
GROUP BY pizza_category

-- Percent of sales by pizza size
SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Percent_Size
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total pizzas sold by pizza categories
SELECT 
    pizza_category, 
    SUM(quantity) AS Total_Sold_Category
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Sold_Category DESC

-- Top 5 pizzas by revenue
SELECT 
    TOP 5 pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Bottom 5 pizzas by revenue
SELECT 
    TOP 5 pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

-- Top 5 pizzas by quantity
SELECT 
    TOP 5 pizza_name, 
    SUM(quantity) AS Total_Sold_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold_Quantity DESC

-- Bottom 5 pizzas by quantity
SELECT 
    TOP 5 pizza_name, 
    SUM(quantity) AS Total_Sold_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold_Quantity ASC

-- Top 5 pizzas by total orders
SELECT 
    TOP 5 pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

-- Bottom 5 pizzas by total orders
SELECT 
    TOP 5 pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
