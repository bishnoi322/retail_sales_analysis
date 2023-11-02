CREATE DATABASE ama_sales;
USE ama_sales;
SELECT * FROM adidas2;
DESC adidas2;

# What are the overall sales trends for different product categories? 
SELECT Product, SUM(Total_Sales) as Overall_Sales
FROM adidas2 
GROUP BY Product 
ORDER BY Overall_Sales DESC;

# How have sales fluctuated over different time periods (daily, monthly, annually)?
 -- Daily sales
SELECT DATE(Invoice_Date) AS Day, SUM(Total_Sales) AS DailySales
FROM adidas2
GROUP BY Day 
ORDER BY Day;

-- Monthly sales
SELECT EXTRACT(YEAR_MONTH FROM Invoice_Date) AS Month, SUM(Total_Sales) AS MonthlySales
FROM adidas2
GROUP BY Month 
ORDER BY Month;

-- Annual sales
SELECT YEAR(Invoice_Date) AS Year, SUM(Total_Sales) AS AnnualSales
FROM adidas2
GROUP BY Year
ORDER BY Year;


# The average shoe price :
SELECT AVG(Units_Sold) AS average_shoe_price
FROM adidas2;


# What are the top-selling products or product categories? 
SELECT Product, SUM(Units_Sold) as Total_Sold 
FROM adidas2 
GROUP BY Product 
ORDER BY Total_Sold DESC;

# In which geographic regions or countries are the highest sales recorded? 
SELECT Region, SUM(Total_Sales) AS Total_Sales
FROM adidas2
GROUP BY Region
ORDER BY Total_Sales DESC;

# Are there any regional preferences for certain products?
SELECT Region, Product, COUNT(*) AS Count
FROM adidas2
GROUP BY Region, Product
ORDER BY Count DESC;

# What is the average price range for products in different categories? 
SELECT Product, AVG(Price_per_Unit) AS Average_Price_Range 
FROM adidas2 
GROUP BY Product;
