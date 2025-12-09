DROP TRIGGER IF EXISTS reduce_stock_after_order;

DELIMITER $$

CREATE TRIGGER reduce_stock_after_order
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET unitsInStock = unitsInStock - NEW.quantity
    WHERE productID = NEW.productID;
END $$

DELIMITER ;
