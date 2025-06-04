# Online-Sales-order-

# 📊 Monthly Revenue and Order Volume Analysis (PostgreSQL)

This repository contains a SQL-based analysis of eCommerce order data. The goal is to compute **monthly revenue** and **order volume** using PostgreSQL and present the results in a clean and exportable format.

---

## 📁 Files Included

| File Name                   | Description                                       |
|----------------------------|---------------------------------------------------|
| `orders.csv`               | Input dataset with order-level transaction data   |
| `monthly_report.sql`       | SQL script to calculate monthly KPIs              |
| `monthly_summary.csv`      | Output: Monthly revenue and order volume          |
| `monthly_summary.pdf`      | Printable PDF report of the output table          |
| `README.md`                | Documentation of the project                      |

---

## 🧮 Analysis Objective

Analyze the monthly performance of orders placed in the year **2023** by computing:

- 📈 **Total Revenue** = `SUM(list_price × quantity)`
- 📦 **Order Volume** = `COUNT(DISTINCT order_id)`

Grouped by:
- **Year**
- **Month**

---

## 🛠️ SQL Logic Summary

-- Create tables
CREATE TABLE orders (
    order_id INTEGER,
    order_date DATE,
    list_price NUMERIC,
    quantity INTEGER
);

-- Revenue by Month and Year
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(list_price * quantity) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY
    year, month
ORDER BY
    year, month;
