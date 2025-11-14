-- Phase 2: Normalization using CTAS (CREATE TABLE AS SELECT)
-- Assumes Phase 1 has been run and company_db.company_raw exists.

USE company_db;

-- Drop existing normalized tables if you need to re-run Phase 2
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;

-- Customers: one row per customer
CREATE TABLE customers AS
SELECT DISTINCT
    customerID,
    companyName,
    contactName,
    contactTitle
FROM company_raw;

-- Employees: one row per employee
CREATE TABLE employees AS
SELECT DISTINCT
    employeeID,
    `employees.lastName`  AS lastName,
    `employees.firstName` AS firstName,
    `employees.title`     AS title
FROM company_raw;

-- Categories: one row per category
CREATE TABLE categories AS
SELECT DISTINCT
    categoryID,
    categoryName
FROM company_raw;

-- Suppliers: one row per supplier
CREATE TABLE suppliers AS
SELECT DISTINCT
    supplierID,
    `suppliers.companyName`  AS companyName,
    `suppliers.contactName`  AS contactName,
    `suppliers.contactTitle` AS contactTitle
FROM company_raw;

-- Products: one row per product, linked to supplier and category
CREATE TABLE products AS
SELECT DISTINCT
    productID,
    productName,
    supplierID,
    categoryID,
    quantityPerUnit,
    `unitPrice.1` AS unitPrice,
    unitsInStock,
    unitsOnOrder,
    reorderLevel,
    discontinued
FROM company_raw;

-- Orders: one row per order (header-level information)
CREATE TABLE orders AS
SELECT DISTINCT
    orderID,
    customerID,
    employeeID,
    orderDate,
    requiredDate,
    shippedDate,
    shipVia,
    Freight
FROM company_raw;

-- Order details: line items for each order
CREATE TABLE order_details AS
SELECT
    orderID,
    productID,
    unitPrice,
    quantity,
    discount
FROM company_raw;

-- Optional: basic indexes to support joins (not strictly required for the project)
ALTER TABLE customers      ADD PRIMARY KEY (customerID);
ALTER TABLE employees      ADD PRIMARY KEY (employeeID);
ALTER TABLE categories     ADD PRIMARY KEY (categoryID);
ALTER TABLE suppliers      ADD PRIMARY KEY (supplierID);
ALTER TABLE products       ADD PRIMARY KEY (productID);
ALTER TABLE orders         ADD PRIMARY KEY (orderID);
ALTER TABLE order_details  ADD KEY idx_order_details_order (orderID),
                           ADD KEY idx_order_details_product (productID);

-- Simple checks you can run after this script:
--   SELECT COUNT(*) FROM orders;
--   SELECT COUNT(*) FROM order_details;
--   SELECT COUNT(DISTINCT customerID) FROM customers;
--   SELECT COUNT(DISTINCT productID)  FROM products;

