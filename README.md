# 📊 Data Analysis Projects (SQL)

This repository contains SQL scripts and datasets for analyzing data using **SQL Server Management Studio (SSMS)**. It includes two main projects: pizza sales and student academic performance.

---

## Contents

### ✅ `SQLQuery_PizzaSales.sql`
SQL script for analyzing pizza sales data. Key insights include:
- Total and average sales revenue  
- Best-selling pizzas by category and size  
- Sales trends by hour and week  

### ✅ `SQLQuery_StudentsScore.sql`
SQL script to analyze student academic performance. The analysis covers:
- GPA and subject-wise scores (Algebra, Calculus, Statistics, etc.)  
- Comparisons by gender, race, and class  
- Identification of top and low-performing students

### 📄 `Students data.csv`
CSV dataset for the student performance analysis. Columns include:
- `Student_ID`, `Class`, `Gender`, `Race`  
- `GPA`, `Algebra`, `Calculus1`, `Calculus2`, `Statistics`, `Probability`

---

### 📄 `pizza sales.csv`
CSV dataset for the student performance analysis. Columns include:
- pizza_id, order_id, pizza_name_id, quantity, order_date, order_time, unit_price, total_price, pizza_size, pizza_category, pizza_ingredients, pizza_name

---

## How to Use (with SSMS)

1. **Import the CSV data** (`Students data.csv` and `pizza sales.csv`) into a table in your SQL Server database.
   - You can use the *Import Flat File Wizard* in SSMS.
2. Open the `.sql` files in **SQL Server Management Studio (SSMS)**.
3. Run the scripts to generate insights.
4. Modify queries if you want to explore the data further or add custom analysis.

---

## Tools Used
- **SQL Server Management Studio (SSMS)**
- **MS SQL Server**
