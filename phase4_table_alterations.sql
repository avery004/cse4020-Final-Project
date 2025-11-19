USE company_db;

-- NULL and NOT NULL Constraints
ALTER TABLE orders
  MODIFY orderID    INT NOT NULL,
  MODIFY customerID VARCHAR(10) NOT NULL,
  MODIFY employeeID INT NOT NULL,
  MODIFY orderDate  DATE NOT NULL;

ALTER TABLE customers
  MODIFY customerID VARCHAR(10) NOT NULL;

ALTER TABLE employees
  MODIFY employeeID INT NOT NULL;

ALTER TABLE categories
  MODIFY categoryID INT NOT NULL;

ALTER TABLE suppliers
  MODIFY supplierID INT NOT NULL;

ALTER TABLE products
  MODIFY productID  INT NOT NULL,
  MODIFY supplierID INT NOT NULL,
  MODIFY categoryID INT NOT NULL;

ALTER TABLE order_details
  MODIFY orderID   INT NOT NULL,
  MODIFY productID INT NOT NULL;


-- Composite PK for order_details (orderID + productID)
ALTER TABLE order_details
  ADD PRIMARY KEY (orderID, productID);


-- Foreign Key Constraints

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customerID)
    REFERENCES customers(customerID);

ALTER TABLE orders
  ADD CONSTRAINT fk_orders_employee
    FOREIGN KEY (employeeID)
    REFERENCES employees(employeeID);

ALTER TABLE products
  ADD CONSTRAINT fk_products_category
    FOREIGN KEY (categoryID)
    REFERENCES categories(categoryID);

ALTER TABLE products
  ADD CONSTRAINT fk_products_supplier
    FOREIGN KEY (supplierID)
    REFERENCES suppliers(supplierID);

ALTER TABLE order_details
  ADD CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (orderID)
    REFERENCES orders(orderID)
    ON DELETE CASCADE,
  ADD CONSTRAINT fk_orderdetails_product
    FOREIGN KEY (productID)
    REFERENCES products(productID);
