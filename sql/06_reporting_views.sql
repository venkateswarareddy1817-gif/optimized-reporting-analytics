USE ecommerce_analytics;



-- 1. Customer Sales Report

CREATE OR REPLACE VIEW customer_sales_report AS
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city;



-- 2. Product Sales Report

CREATE OR REPLACE VIEW product_sales_report AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name;



-- 3. Monthly Sales Report

CREATE OR REPLACE VIEW monthly_sales_report AS
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    DATE_FORMAT(o.order_date, '%Y-%m');



-- 4. Test Customer Report

SELECT *
FROM customer_sales_report
ORDER BY total_revenue DESC;



-- 5. Test Product Report

SELECT *
FROM product_sales_report
ORDER BY total_revenue DESC;


-- 6. Test Monthly Report

SELECT *
FROM monthly_sales_report
ORDER BY month;



-- 7. Check Created Views

SHOW FULL TABLES
WHERE Table_type = 'VIEW';