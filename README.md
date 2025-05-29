# 🧠 SQL for Data Analysis – E-commerce Database

This project demonstrates the use of SQL to perform data analysis on an **E-commerce relational database** using **MySQL**. Various query types were used to gain insights into customer behavior, sales performance, and product analytics.

---

## ✅ Types of Queries Used

### 1. 🔍 Basic Queries
We retrieved data using `SELECT`, applied filters with `WHERE`, and used `ORDER BY` and `LIMIT` to rank and restrict results. Example analyses:
- Listing all customers from a specific state (e.g., Maharashtra).
- Showing top 3 highest value orders.
- Counting total orders per city.

### 2. 🔗 Joins
We used different types of joins to combine multiple tables:
- **INNER JOIN** to connect orders, customers, products, and order items for complete transactional details.
- **LEFT JOIN** to find products even if they have no orders.
- **RIGHT JOIN** to ensure all products or orders are visible even if details are missing in `order_items`.

### 3. 🧠 Subqueries
Subqueries helped us filter data based on dynamic conditions. For example:
- Retrieving customers who placed orders above the average total amount.

### 4. 📊 Aggregation & Grouping
We applied aggregate functions like `SUM` and `AVG` combined with `GROUP BY` to summarize data:
- Calculated total revenue per product category.
- Found average order value per customer.

### 5. 🪟 Views
We created a **view** (`customer_orders_view`) to simplify repeated analysis by combining customer, order, product, and pricing information. This made querying faster and more readable.

### 6. 🚀 Query Optimization
Indexes were created on frequently joined columns like `customer_id` and `product_id` to improve performance of join and filter operations.

---

## 🛠 Tools Used

- **MySQL Server**
- **MySQL Workbench**
- **E-commerce relational dataset** with tables like:
  - `customers`
  - `orders`
  - `order_items`
  - `products`
  - `categories`

---
