# supply-chain-market-analysis

Phase 1: MySQL Workbench (The "Storage Room")
Goal: Calculate how many days of stock we have left.
1.Open MySQL Workbench. 
2.  Right-click your ecommerce_db (or create a new one called supply_chain_db) -> Table Data Import Wizard.
3.Select the CSV version of Project_2_SupplyChain_Data.
4.Once imported, click the "SQL" tab at the top and type this:
SQL
-- This code calculates "Days of Inventory"
-- It tells us: If we stop buying today, how many days until the shelf is empty?
SELECT 
    Product_Category, 
    Warehouse_Location,
    Stock_Level,
    Daily_Sales_Rate,
    (Stock_Level / Daily_Sales_Rate) AS Days_of_Stock_Left
FROM supply_chain_table
ORDER BY Days_of_Stock_Left ASC;
Click the Lightning Bolt. Look at the results. Any item with a low "Days_of_Stock_Left" (like 2 or 3) needs to be ordered immediately!



Phase 2: MS Excel (The "Fix-It Shop")
Goal: Fix spelling errors and calculate costs.
1.Open the Excel file. 
2.Look at the Product_Category column.
3.Fix Spelling: Some say "Electrnics." Click the column header, press Ctrl + H (Find and Replace). Find: Electrnics | Replace with: Electronics. Click Replace All.
4.Handle Empty Boxes: Find the empty cells in the "Stock_Level" column. Highlight them and fill them with the average stock (use the formula =AVERAGE(D:D) at the bottom to find it).
5.The Pivot Table: Click Insert > Pivot Table. Drag Warehouse_Location to Rows and Holding_Cost_USD to Values. This shows you which city is costing the company the most money to store items.



Phase 3: Jupyter Notebook (The "Time Machine")
Goal: Predict how many items we will need in the future.
1.Open Jupyter. Start a New Notebook.
Paste this code:
#Python
import pandas as pd
import numpy as np

# Load data
df = pd.read_excel('Project_2_SupplyChain_Data.xlsx')

# AI Logic: Simple Forecasting
# We take the Daily Sales and add a "Buffer" for safety
df['Predicted_Requirement'] = df['Daily_Sales_Rate'] * 1.2 # 20% extra for safety

# Identify items to Reorder
reorder_list = df[df['Stock_Level'] < (df['Daily_Sales_Rate'] * df['Supplier_Lead_Time_Days'])]

print("AI Forecast Complete!")
print(f"You need to reorder {len(reorder_list)} different items immediately.")
Press Shift + Enter. This tells you exactly how many items are in danger of running out.

Phase 4: Power BI Desktop (The "Command Center")
Goal: Create a dashboard that alerts the manager.

Open Power BI > Get Data > Excel. Select your fixed file.

The Gauge (Speedometer): Click the Gauge Chart icon. Drag Stock_Level into 'Value' and set the 'Target Value' to 500.

The Map: Click the Map icon. Drag Warehouse_Location to 'Location' and Holding_Cost_USD to 'Bubble Size'. You will see big bubbles over expensive cities.

The Alert Bar: Click Stacked Bar Chart. Drag Product_Category to the Y-axis and Days_of_Stock_Left to the X-axis.

Pro Tip: Go to the "Format" (paint roller icon) -> Data Colors -> Conditional Formatting. Set it so if the value is low, the bar turns RED.
