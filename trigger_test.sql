
-- Run first to check original stock quantity
SELECT productID, productName, unitsInStock
FROM products
WHERE productID = 2;
 
-- create a new order
INSERT INTO orders (orderID, customerID, employeeID, orderDate)
VALUES (10001, 'ANATR', 2, CURDATE());

-- triggers update to stock quantity
INSERT INTO order_details (orderID, producorder_detailstID, unitPrice, quantity, discount)
VALUES (10001, 2, 19.99, 10, 0);

-- rerun the query to find stock quentity:
-- SELECT productID, productName, unitsInStock
-- FROM products
-- WHERE productID = 2;



