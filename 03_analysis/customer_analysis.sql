--Segment customer using RFM analysis
WITH customer_metrics AS (
    SELECT
        c.customer_id,
        c.name,
        MAX(o.order_date) AS last_order,
        COUNT(o.order_id) AS frequency,
        SUM(o.quantity * b.price) AS monetary
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Books b ON o.book_id = b.book_id
    GROUP BY c.customer_id, c.name
)
SELECT *,
       DATEDIFF('2024-07-01', last_order) AS recency_days
FROM customer_metrics;

--Returning customers
SELECT 
    c.customer_id,
    c.name,
    COUNT(DISTINCT o.order_id) as total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_orders > 1;

--Churned customers
SELECT 
    c.customer_id,
    c.name,
    MAX(o.order_date) AS last_purchase,
    DATEDIFF('2025-07-01', MAX(o.order_date)) AS days_since_last_purchase
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING days_since_last_purchase > 365;
