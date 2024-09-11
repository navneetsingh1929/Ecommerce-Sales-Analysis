# Ecommerce-Sales-Analysis

1. Utilized Kaggle API and Python to download a dataset containing nearly 10,000+ rows of sales data from a US-based 
eCommerce company.
2. Processed and cleaned the data using Pandas, ensuring data integrity and consistency.
3. Loaded the cleaned data into SQL Server for efficient querying and analysis.
4. Employed SQL window functions and Common Table Expressions (CTEs) to answer key business questions and derive insights.
5. Provided actionable insights such as identifying top-performing products, analyzing sales trends, and evaluating customer 
purchasing behavior.

# Key SQL Queries:
1. Retrieving all Orders: A simple query to fetch all records from the orders table: SELECT * FROM orders;.
2. Top 10 Highest Revenue Generating Products: A query that identifies the top 10 products by revenue, calculating total sales for each product and ordering the result in descending order.
3. Top 5 Highest Selling Products by Region: This section uses a common table expression (CTE) to group sales by region and product, then ranks the top 5 products in each region based on sales.
4. Month-Over-Month Growth Comparison for 2022 vs 2023: A query that compares the sales for each month in 2022 and 2023, allowing for a month-by-month comparison between the two years.
5. Highest Sales by Category per Month: A query designed to determine which month had the highest sales for each product category.
