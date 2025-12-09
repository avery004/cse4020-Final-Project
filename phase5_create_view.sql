CREATE OR REPLACE VIEW employee_sales_view AS
SELECT 
    e.employeeID,
    e.firstName AS firstName,
    e.lastName AS lastName, 
    SUM(od.quantity) AS totalQuantitySold,
    SUM(od.quantity * od.unitPrice) AS totalRevenue
FROM employees e
JOIN orders o 
    ON e.employeeID = o.employeeID
JOIN order_details od 
    ON o.orderID = od.orderID
GROUP BY 
    e.employeeID, 
    firstName,
    lastName
ORDER BY 
    totalRevenue DESC;
