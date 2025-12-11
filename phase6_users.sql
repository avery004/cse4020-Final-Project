-- Phase 6: User Management and Privileges
-- Assumes company_db already exists and you are connected as a user
-- with permission to create users and grant privileges (e.g., root).

USE company_db;

-- NOTE: Replace the example passwords below with your own strong passwords
-- before running this script, especially if this is not just for a class project.

-- 1) Database Administrator user (full privileges)
CREATE USER IF NOT EXISTS 'AlexSmith'@'localhost'
IDENTIFIED BY 'ChangeMe_AlexStrongPass1!';

GRANT ALL PRIVILEGES ON company_db.* TO 'AlexSmith'@'localhost'
WITH GRANT OPTION;

-- 2) Analyst user (read-only access)
CREATE USER IF NOT EXISTS 'JamieLee'@'localhost'
IDENTIFIED BY 'ChangeMe_JamieStrongPass1!';

GRANT SELECT ON company_db.* TO 'JamieLee'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

-- Useful checks for screenshots / verification:
-- SHOW GRANTS FOR 'AlexSmith'@'localhost';
-- SHOW GRANTS FOR 'JamieLee'@'localhost';

-- command to generate phase6 csv 
-- mysql -u root --batch --skip-column-names -e "USE company_db; SELECT 'user','host'; SELECT user, host FROM mysql.user WHERE user IN ('AlexSmith','JamieLee'); SELECT 'grants'; SHOW GRANTS FOR 'AlexSmith'@'localhost'; SHOW GRANTS FOR 'JamieLee'@'localhost';" > phase6_users_verification.csv 
