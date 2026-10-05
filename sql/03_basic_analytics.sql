USE ecommerce_analytics;

-- 1. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 2. Total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 3. Total revenue
SELECT 
    SUM(quantity * unit_price) AS total_revenue
FROM order_items;

-- 4. Total units sold
SELECT 
    SUM(quantity) AS total_units_sold
FROM order_items;

-- 5. Orders by status
SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- 6. Sales by customer
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_sales DESC;

-- 7. Sales by product
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_sales DESC;

-- 8. Sales by category
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM categories c
JOIN products p
    ON c.category_id = p.category_id
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY total_sales DESC;

-- 9. Monthly sales
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;