-- 1. Generate report showing member table with additional column country with value as INDIA.
use retail;
SELECT * , "INDIA " AS country from member;

-- 2. Generate report showing product table with derived column company with value HALDIRAM.
SELECT *, "HALDIRAM" AS company from product;

-- 3. Generate report showing product table with derived column new price which is 1.25 times from original price.
SELECT * from product;
SELECT * , ROUND((price * 1.25),2) AS new_price from product;

-- 4. Generate report showing product table with derived column discounted price which is 80% of original price.
SELECT *, round((price * 0.8),2) AS discount_price FROM product;
SELECT dp.product_id,dp.description,dp.price,dp.discount_price,ROUND((p.price - dp.discount_price),2) AS total_price
FROM product as p
JOIN
(SELECT product_id,description,price,round((price * 0.8),2) AS discount_price FROM product) dp
ON p.product_id = dp.product_id;
-- 1. Generate report showing member table with additional column showing season for registration date.
	-- (Spring - March, Apr, May
	-- Summer - June, July, Aug
	-- Autumn - Sept, Oct, Nov
	-- Winter - Dec, Jan, Feb)
SELECT sm.member_id,sm.reg_date,sm.months,
CASE WHEN sm.months = "JAN" THEN "WINTER" 
	WHEN sm.months = "FEB" THEN "WINTER" 
    WHEN sm.months = "MARCH" THEN "SPRING" 
    WHEN sm.months = "APRIL" THEN "SPRING" 
    WHEN sm.months = "MAY" THEN "SPRING" 
    WHEN sm.months = "JUNE" THEN "SUMMER" 
    WHEN sm.months = "JULY" THEN "SUMMER" 
    WHEN sm.months = "AUGUST" THEN "SUMMER" 
    WHEN sm.months = "SEPT" THEN "AUTOMN" 
    WHEN sm.months = "OCT" THEN "AUTOMN" 
    WHEN sm.months = "NOV" THEN "AUTOMN" 
    WHEN sm.months = "DEC" THEN "WINTER"  END AS SEASONS
FROM member as m
JOIN 
(SELECT member_id,first_name, reg_date,
CASE WHEN month(reg_date) = "1" THEN "JAN"
 WHEN month(reg_date) = "2" THEN "FEB"
WHEN month(reg_date) = "3" THEN "MARCH"
 WHEN month(reg_date) = "4" THEN "APRIL"
 WHEN month(reg_date) = "5" THEN "MAY"
 WHEN month(reg_date) = "6" THEN "JUNE"
WHEN month(reg_date) = "7" THEN "JULY"
WHEN month(reg_date) = "8" THEN "AUGUST"
WHEN month(reg_date) = "9" THEN "SEPT"
WHEN month(reg_date) = "10" THEN "OCT"
 WHEN month(reg_date) = "11" THEN "NOV"
 WHEN month(reg_date) = "12" THEN "DEC" END AS months
FROM member) sm
ON m.member_id = sm.member_id;
-- _________________________________________________________________________________________
-- 2. Generate report showing product table with additional column for product classification.
	-- (Low price => price less than 3
	--  Medium price => price in between 3 and 6
	-- High price => price greater than 6)
SELECT *,
CASE WHEN price <="3" THEN "Low Price"
	WHEN price >"3" and price <"7" THEN "Medium Price"
    WHEN price > "6" THEN "High Price" END AS product_classification 
FROM product;
-- ________________________________________________________________________________
-- 3. Generate report showing tran_id, total sale amount and classification of total sale
	-- (Low amount transaction => price less than 33
	-- Medium amount transaction => price in between 33 and 66
	-- High amount transaction => price greater than 66)
SELECT ts.tran_id,ts.total_sale,
CASE WHEN ts.total_sale <="33" THEN "Low Amount"
	WHEN ts.total_sale >"33" and ts.total_sale < "67" THEN "Medium Ampunt"
    WHEN ts.total_sale > "66" THEN "High Amount" END AS sale_classification
FROM tran_dtl as td
JOIN 
(SELECT tran_id, sum(amt) as total_sale
FROM tran_dtl
GROUP BY tran_id) ts
ON td.tran_id  = ts.tran_id;