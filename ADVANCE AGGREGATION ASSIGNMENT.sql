-- AGGREGATION WITH GROUP BY, ORDER BY

-- 1. 	Generate report showing monthly sale for each month.
SELECT month(tran_dt) as months, sum(amt) as amount
FROM tran_dtl
GROUP BY months;

-- 2. 	Generate report showing employees who have worked in more than one department.
USE emp;
SHOW TABLES;
SELECT * FROM dept_emp;
SELECT emp_no,count(dept_no)
FROM dept_emp
GROUP BY emp_no
HAVING count(dept_no) > 1;

-- 3. 	Generate report showing total number of managers for each department.
SELECT * FROM dept_manager;
SELECT dept_no,count(*) as total_managers
FROM dept_manager
GROUP BY dept_no;

-- 4. 	Generate report showing total salary withdrawn from company for each employee.
SELECT  * FROM salaries;
SELECT emp_no,sum(salary)
FROM salaries
GROUP BY emp_no;

-- 5. 	Generate report showing only those employees from above report who have withdrawn total salary in between 400000 to 500000
-- 	and arrange them in descending order by salary withdrawn.
-- 6. 	Genetaye report showing total number of transactions per member per month.
USE retail;
SELECT * FROM tran_hdr;
SELECT member_id,month(tran_dt) as no_of_months,count(*) total_tran
FROM tran_hdr
GROUP BY member_id,months
ORDER BY member_id;
-- 7.	Generate report showing total number of transaction per month per store in ascending order.
SELECT store_id, month(tran_dt) as no_of_month, count(*) total_tran
FROM tran_hdr
GROUP BY store_id,no_of_month
ORDER BY store_id;

-- 8.	Generate report showing number of members registered per month per store.
SELECT * FROM member;
SELECT  store_id,count(*) as total_registations
FROM member
GROUP BY store_id ORDER BY store_id;
-- 9.	Generate report showing category wise number of products having price less than 1.
SELECT category,price ,count(*) no_of_products
FROM product
GROUP BY category,price
HAVING price<1;
-- 10.	Generate report showing total number of transactions per member per store.
SELECT * FROM tran_hdr;
SELECT member_id, store_id,count(*) as total_transaction
FROM tran_hdr
GROUP BY member_id,store_id
ORDER BY member_id;