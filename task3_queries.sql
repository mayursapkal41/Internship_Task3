-- BASIC QUERIES
-- 1. Show all customers from Maharashtra
SELECT * FROM customers WHERE state = 'Maharashtra';

-- 2. Show top 3 highest value orders
SELECT * FROM orders ORDER BY total_amount DESC LIMIT 3;

-- 3. Show total orders per city
SELECT city, COUNT(order_id) AS total_orders
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY city;

-- INNER JOIN
SELECT o.order_id, c.name AS customer_name, p.name AS product_name, oi.quantity, oi.price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

--  LEFT JOIN
SELECT p.name AS product, oi.order_id, oi.quantity
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id;

--  RIGHT JOIN
SELECT o.order_id, oi.product_id, p.name
FROM order_items oi
RIGHT JOIN products p ON oi.product_id = p.product_id
RIGHT JOIN orders o ON oi.order_id = o.order_id;

-- SUBQUERIES
SELECT name, email
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
);

-- AGGREGATES
SELECT cat.name AS category, SUM(oi.price * oi.quantity) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.name;

SELECT c.name, AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- VIEW
CREATE VIEW customer_orders_view AS
SELECT c.name AS customer, o.order_date, p.name AS product, oi.quantity, oi.price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;
SELECT * FROM customer_orders_view;

-- OPTIMIZATION
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_id ON order_items(product_id);
