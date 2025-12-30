THE GREAT WALMART INVESTIGATION
A Data-Driven Deep Dive into Walmart Sales Trends
---

PROJECT OVERVIEW

The Great Walmart Investigation is an end-to-end data analytics project focused on analyzing Walmart sales data to extract meaningful business insights.
This project covers the complete data analytics lifecycle — from raw data cleaning to visualization and SQL-based analysis.

The main objectives of this project are:

* Analyze sales performance across product categories and cities
* Understand customer payment preferences
* Study revenue trends over time
* Analyze ratings and quantity sold
* Generate business insights using Python and SQL

---

TOOLS & TECHNOLOGIES USED

Python

* Pandas (data manipulation and cleaning)
* NumPy (numerical analysis)
* Matplotlib (basic visualizations)
* Seaborn (statistical visualizations)

Database & SQL

* MySQL
* SQLAlchemy
* PyMySQL

Other Tools

* Jupyter Notebook
* VS Code
* GitHub

---

PROJECT STRUCTURE

Walmart-Sales-Analysis

* README.md
* Walmart_clean_data.csv
* project.ipynb (complete workflow)
* numpy.ipynb (NumPy analysis)
* matplotlib.ipynb (Matplotlib visualizations)
* Seaborn.ipynb (Seaborn visualizations)
* walmart_project_queries.sql
---

DATA CLEANING PROCESS

The dataset initially contained raw and unstructured data.
The following data cleaning steps were performed:

* Checked and handled missing values
* Converted incorrect data types (dates and numeric columns)
* Cleaned currency values by removing symbols and converting to numeric format
* Detected and treated outliers
* Standardized column formats
* Verified dataset consistency

FEATURE ENGINEERING

A new column was created:
Total Sales = Unit Price × Quantity
This column was used for revenue analysis, visualizations, and SQL queries.

---

EXPLORATORY DATA ANALYSIS (EDA)

NUMPY ANALYSIS

* Minimum, maximum, and total quantity calculations
* Correlation analysis
* Conditional filtering
* Statistical computations

MATPLOTLIB VISUALIZATIONS

* Daily total sales trend
* Histogram of total sales
* Line plots and scatter plots

SEABORN VISUALIZATIONS

* Category-wise total sales
* Payment method analysis
* Boxplots and countplots
* Correlation heatmap

---

SQL ANALYSIS
The cleaned dataset was uploaded to MySQL using SQLAlchemy.

SQL queries were used to analyze:

* Category-wise revenue
* Payment method performance
* City-wise and branch-wise sales
* Highest-rated category per branch
* Busiest day for each branch
* Most preferred payment method by branch
* Revenue decline (year-over-year)
* Shift-based sales analysis
* Duplicate invoice detection using self-joins

---

KEY INSIGHTS

* Certain categories contribute the highest revenue
* Payment method preferences vary by branch
* Daily sales show fluctuating but predictable trends
* Higher unit price does not always result in higher total revenue
* Some branches experienced a noticeable revenue decline

---

FUTURE SCOPE

* Build predictive models for sales forecasting
* Create interactive dashboards using Power BI
* Perform customer segmentation
* Automate reporting using SQL and Python
* Include more years of data for trend comparison

---

CONCLUSION

This project demonstrates a complete real-world data analytics workflow, including data cleaning, feature engineering, visualization, SQL querying, and business interpretation.
It reflects practical skills required for a Data Analyst role and serves as a strong portfolio project.

---

AUTHOR

Sanjana Dindewar
Aspiring Data Analyst
Skills: Python, SQL, NumPy, Pandas, Data Visualization
