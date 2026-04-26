create database supply_chains_db;
use supply_chains_db;

-- This code calculates "Days of Inventory"
-- It tells us: If we stop buying today, how many days until the shelf is empty?
SELECT 
    Product_Category, 
    Warehouse_Location,
    Stock_Level,
    Daily_Sales_Rate,
    (Stock_Level / Daily_Sales_Rate) AS Days_of_Stock_Left
FROM project_2_supplychain_data
ORDER BY Days_of_Stock_Left ASC;