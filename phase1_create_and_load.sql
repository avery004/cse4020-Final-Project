-- Phase 1: Database creation and data loading

-- 1. Create database
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- 2. Create raw table matching the CSV columns
DROP TABLE IF EXISTS company_raw;
CREATE TABLE company_raw (
    orderID INT,
    customerID VARCHAR(10),
    employeeID INT,
    orderDate DATE,
    requiredDate DATE,
    shippedDate DATE,
    shipVia INT,
    Freight DECIMAL(10,2),
    productID INT,
    unitPrice DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    companyName VARCHAR(100),
    contactName VARCHAR(100),
    contactTitle VARCHAR(100),
    `employees.lastName` VARCHAR(50),
    `employees.firstName` VARCHAR(50),
    `employees.title` VARCHAR(50),
    productName VARCHAR(100),
    supplierID INT,
    categoryID INT,
    quantityPerUnit VARCHAR(50),
    `unitPrice.1` DECIMAL(10,2),
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued TINYINT(1),
    categoryName VARCHAR(50),
    `suppliers.companyName` VARCHAR(100),
    `suppliers.contactName` VARCHAR(100),
    `suppliers.contactTitle` VARCHAR(100)
);

-- 3. Load cleaned CSV data
-- IMPORTANT:
--   1) Update the path below to the full path of CompanyDataClean.csv on *your* machine.
--      Example (Mac): /Users/yourname/path/to/cse4020-Final-Project/CompanyDataClean.csv
--   2) Start the mysql client with local infile enabled, e.g.:
--        mysql --local-infile=1 -u root
--   3) In that session, you may also need:
--        SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/ABSOLUTE/PATH/TO/REPO/CompanyDataClean.csv'
INTO TABLE company_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- You can run: SELECT COUNT(*) FROM company_raw; to verify 1000 rows.
