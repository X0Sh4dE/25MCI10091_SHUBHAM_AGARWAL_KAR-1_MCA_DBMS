/* =========================================
   EXPERIMENT – 02
   Implementation of SELECT Queries with
   Filtering, Grouping and Sorting
   PostgreSQL
   ========================================= */

/* ---------- STEP 1: DATABASE & TABLE ---------- */

CREATE DATABASE customer_db;
\c customer_db;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
);

/* ---------- STEP 1: INSERT SAMPLE DATA ---------- */

INSERT INTO orders (customer_name, product, quantity, price, order_date) VALUES
('Amit', 'Laptop', 1, 65000, '2024-01-10'),
('Neha', 'Mobile', 2, 40000, '2024-01-12'),
('Rohan', 'Tablet', 1, 25000, '2024-01-15'),
('Simran', 'Laptop', 1, 70000, '2024-01-18'),
('Ankit', 'Mobile', 3, 60000, '2024-01-20'),
('Pooja', 'Headphones', 2, 5000, '2024-01-22'),
('Rahul', 'Laptop', 1, 68000, '2024-01-25');

/* ---------- STEP 2: FILTERING DATA ---------- */

SELECT *
FROM orders
WHERE price > 50000;

/* ---------- STEP 3: SORTING RESULTS ---------- */

SELECT customer_name, product, price
FROM orders
ORDER BY price ASC;

SELECT customer_name, product, price
FROM orders
ORDER BY price DESC;

SELECT customer_name, product, price, quantity
FROM orders
ORDER BY product ASC, price DESC;

/* ---------- STEP 4: GROUPING & AGGREGATION ---------- */

SELECT product,
       SUM(price * quantity) AS total_sales
FROM orders
GROUP BY product;

/* ---------- STEP 5: WHERE + GROUP BY (SAME QUERY) ---------- */
/* Row-level filtering followed by grouping */

SELECT product,
       SUM(price * quantity) AS total_sales
FROM orders
WHERE price > 30000
GROUP BY product;

/* ---------- END OF FILE ---------- */