USE ecommerce_analytics;

-- 1. Create index on customer_id
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

-- 2. Create index on order_date
CREATE INDEX idx_orders_order_date
ON orders(order_date);

-- 3. Create index on product_id
CREATE INDEX idx_order_items_product_id
ON order_items(product_id);

-- 4. Create index on order_id
CREATE INDEX idx_order_items_order_id
ON order_items(order_id);


-- 5. Check indexes on orders
SHOW INDEX FROM orders;


-- 6. Check indexes on order_items
SHOW INDEX FROM order_items;


-- 7. Check query execution plan
EXPLAIN
SELECT *
FROM orders
WHERE customer_id = 25;


-- 8. Another execution plan
EXPLAIN
SELECT *
FROM orders
WHERE order_date >= '2025-01-01'
  AND order_date < '2025-02-01';