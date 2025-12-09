DROP PROCEDURE IF EXISTS products_to_restock;


CREATE PROCEDURE restock_procedure()
    SELECT 
        productID,
        productName,
        unitsInStock,
        reorderLevel
    FROM products
    WHERE unitsInStock < reorderLevel;
