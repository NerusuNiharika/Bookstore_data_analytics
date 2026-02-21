--Inventory alerts
SELECT 
    title, stock
FROM Books
WHERE stock < 15;