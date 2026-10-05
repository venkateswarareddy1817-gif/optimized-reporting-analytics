USE ecommerce_analytics;

-- 1. Check duplicate customers
SELECT customer_id, COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 2. Check NULL customers
SELECT *
FROM customers
WHERE customer_id IS NULL
   OR customer_name IS NULL
   OR email IS NULL;

-- 3. Check invalid product prices
SELECT *
FROM products
WHERE price <= 0;

-- 4. Check invalid quantities
SELECT *
FROM order_items
WHERE quantity <= 0;

-- 5. Check invalid unit prices
SELECT *
FROM order_items
WHERE unit_price <= 0;

-- 6. Check orders without customers
SELECT o.*
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 7. Check order items without orders
SELECT oi.*
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- 8. Check order items without products
SELECT oi.*
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;