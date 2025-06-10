# Sales-Trend-Analysis
1. Project Overview
This project analyzes sales trends from the AmazonSalesData.csv dataset, calculating monthly total revenue and order volume using SQL in a MySQL database.

3. Dataset
The analysis uses AmazonSalesData.csv, which includes columns such as Order Date and Total Revenue.

4. Tools Used
Database: MySQL
Query Language: SQL

5. Methodology
The process involves:
Table Creation: Creating an amazon_sales table.
Data Loading: Importing AmazonSalesData.csv using LOAD DATA INFILE, which includes handling the MM/DD/YYYY date format.
Sales Trend Analysis: An SQL query aggregates Total Revenue and Order ID by year and month.

6. How to Use
Update Script: Open the SQL script and replace the placeholder path with the actual location of your AmazonSalesData.csv file.
MySQL Setup: Ensure your MySQL user has FILE privileges and local_infile is enabled if loading from your client machine.
Execute: Run the entire SQL script in your MySQL client.

7. Outcome
This project provides monthly insights into sales performance, demonstrating practical SQL skills for time-series data analysis.
