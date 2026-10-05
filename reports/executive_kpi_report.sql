USE ecommerce_analytics;


-- EXECUTIVE KPI REPORT

SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,

    (SELECT COUNT(*) FROM orders) AS total_orders,

    (SELECT SUM(quantity * unit_price)
     FROM order_items) AS total_revenue,

    (SELECT SUM(quantity)
     FROM order_items) AS total_units_sold;