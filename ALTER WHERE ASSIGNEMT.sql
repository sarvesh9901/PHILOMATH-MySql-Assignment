-- ALTER TABLE
ALTER TABLE family_dtl ADD COLUMN city VARCHAR(20);
ALTER TABLE family_dtl ADD COLUMN DOB VARCHAR(20) AFTER last_name;
ALTER TABLE family_dtl DROP COLUMN age;
DROP TABLE family_dtl;
USE library;
ALTER TABLE book_dtl RENAME COLUMN price to book_price;

-- GENRATION OF REPORT
-- 1. display emp_id, first name for employees on the report
use emp;
SELECT * FROM employees;
SELECT emp_no, first_name  FROM employees;

-- 2. Generate a report that shows all products all columns
USE retail;
SELECT * FROM product;

-- 3. Generate a report that shows product_id, description, category for all products belonging to any two categories
SELECT product_id, description,category
FROM product
WHERE category = "Frozen";
