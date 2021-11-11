
-- 1. 	Generate report showing total number of employees.
USE emp;
SELECT count(*) as total_emp
FROM employees;

-- 2. 	Generate report showing total number of transactions at store 2.
USE retail;
SELECT * FROM tran_hdr;
SELECT store_id, count(*) as total_tran 
FROM tran_hdr WHERE store_id =2;

-- 3. 	Generate report showing average price for baked goods category.
SELECT category, avg(price) as avg_price
FROM product WHERE category = "Baked goods";

-- 4. 	Generate report showing number of employees born in year 1960.
USE emp;
SELECT * from employees;
SELECT  count(year(birth_date))
from employees WHERE year(birth_date)=1960;

-- 5. 	Generate report showing min price for beverages category.
USE retail;
SELECT category , min(price) as min_price
FROM product WHERE category = "Beverages";

-- 6. 	Generate report showing max price for frozen category.
SELECT category, max(price)
FROM product WHERE category ="Frozen";

-- 7. 	Generate report showing total amount of sales for transaction date 2019-08-12.
-- #########
SELECT * FROM tran_dtl;
SELECT tran_dt,sum(amt) as total_sale
FROM tran_dtl 
-- WHERE tran_dt = 2019-01-01
GROUP BY tran_dt
HAVING date(tran_dt) = 2019-08-12;
