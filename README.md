# Sales Trend Analysis Project

## Overview
This project analyzes monthly sales trends from an e-commerce dataset, calculating key metrics like revenue and order volume. The analysis is performed using SQLite in DB Browser, with the goal of identifying sales patterns and business insights.

## Dataset
The dataset `Online Sales Data.csv` contains:
- 240 transactions from January to August 2024
- Fields: Transaction ID, Date, Product Category, Product Name, Units Sold, Unit Price, Total Revenue, Region, Payment Method

## SQL Query to format the date to use in SQLite
  ```sql
   -- Convert date to proper format to use in SQLite
  ALTER TABLE online_sales ADD COLUMN Date_Formatted TEXT;
  
  UPDATE online_sales
  SET Date_Formatted = 
      substr(Date, 7, 4) || '-' || substr(Date, 4, 2) || '-' || substr(Date, 1, 2);

