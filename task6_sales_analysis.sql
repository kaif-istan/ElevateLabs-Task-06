-- Convert date to proper format to use in SQLite
ALTER TABLE online_sales ADD COLUMN Date_Formatted TEXT;

UPDATE online_sales
SET Date_Formatted = 
    substr(Date, 7, 4) || '-' || substr(Date, 4, 2) || '-' || substr(Date, 1, 2);
	
-- Write SQL Query to Analyze Monthly Sales
SELECT 
    strftime('%Y', Date_Formatted) AS Year,
    strftime('%m', Date_Formatted) AS Month,
    SUM("Total Revenue") AS Total_Revenue,
    COUNT(DISTINCT "Transaction ID") AS Order_Volume
FROM online_sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Top 3 Months by Sales
SELECT 
    strftime('%Y', Date_Formatted) AS Year,
    strftime('%m', Date_Formatted) AS Month,
    SUM("Total Revenue") AS Total_Revenue
FROM online_sales
GROUP BY Year, Month
ORDER BY Total_Revenue DESC
LIMIT 3;

