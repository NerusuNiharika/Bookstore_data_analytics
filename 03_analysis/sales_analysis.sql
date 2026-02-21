-- Book Performance (Sales + Revenue)
SELECT 
    b.title,
    SUM(o.quantity) as total_units_sold,
    SUM(o.quantity * b.price) as total_revenue
from orders o
join books b on b.book_id = o.book_id
GROUP BY b.title
ORDER BY total_revenue DESC;

--Monthy sales trend
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(o.quantity * b.price) AS total_revenue
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY month
ORDER BY month;

--Average order value
SELECT 
    ROUND(SUM(quantity * b.price)*1.0/COUNT(DISTINCT o.order_id),2) as avg_order_value
FROM orders o
JOIN books b ON b.book_id = o.book_id;