-- 1. Create Table
USE iso;
CREATE TABLE amazon_sales (
    Region VARCHAR(100),
    Country VARCHAR(100),
    Item_Type VARCHAR(100),
    Sales_Channel VARCHAR(50),
    Order_Priority CHAR(1),
    Order_Date DATE,
    Order_ID BIGINT PRIMARY KEY,
    Ship_Date DATE,
    Units_Sold INT,
    Unit_Price DECIMAL(10,2),
    Unit_Cost DECIMAL(10,2),
    Total_Revenue DECIMAL(15,2),
    Total_Cost DECIMAL(15,2),
    Total_Profit DECIMAL(15,2)
);
-- load data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AmazonSalesData.csv'
INTO TABLE amazon_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Region, Country, Item_Type, Sales_Channel, Order_Priority, @Order_Date, Order_ID, @Ship_Date, Units_Sold, Unit_Price, Unit_Cost, Total_Revenue, Total_Cost, Total_Profit)
SET
  Order_Date = STR_TO_DATE(@Order_Date, '%m/%d/%Y'),
  Ship_Date = STR_TO_DATE(@Ship_Date, '%m/%d/%Y');

--  Basic SELECT
SELECT * FROM amazon_sales;

-- This query calculates monthly total revenue and order volume.
SELECT
    YEAR(Order_Date) AS sales_year,    -- Extracts the year from the Order Date
    MONTH(Order_Date) AS sales_month,  -- Extracts the month from the Order Date
    SUM(Total_Revenue) AS monthly_revenue,         -- Sums the 'Total Revenue' for each month/year
    COUNT(DISTINCT Order_ID) AS monthly_order_volume -- Counts unique 'Order ID's for each month/year
FROM
    amazon_sales

GROUP BY
    sales_year,     -- Groups the results by year
    sales_month     -- Further groups by month within each year
ORDER BY
    sales_year ASC, -- Sorts the results by year in ascending order
    sales_month ASC;-- Sorts the results by month in ascending order within each year
