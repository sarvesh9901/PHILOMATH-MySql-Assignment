-- 1. Generate report showing member_id, first_name for only those members who have at least one transaction with total sale less than 4 dollars.
-- DONE
SELECT 
    m.first_name, fs.member_id, fs.total_sale, fs.total_tran
FROM
    member AS m
        JOIN
    (SELECT 
        th.member_id, ts4.total_sale, COUNT(*) AS total_tran
    FROM
        tran_hdr AS th
    JOIN (SELECT 
        tran_id, SUM(amt) AS total_sale
    FROM
        tran_dtl
    GROUP BY tran_id
    HAVING total_sale < '4') ts4 ON th.tran_id = ts4.tran_id
    GROUP BY th.member_id , ts4.total_sale) fs ON m.member_id = fs.member_id;
-- 2. Generate report showing member table for those employees who have purchased product id 78 
-- in at least one transaction.
USE retail;
SELECT fs.tran_id,fs.member_id,m.first_name,fs.total_tran,fs.product_id
FROM member as m
JOIN
(SELECT th.tran_id,th.member_id,td.total_tran,td.product_id
FROM tran_hdr as th
JOIN
(SELECT count(*) total_tran,tran_id,product_id
FROM tran_dtl
GROUP BY tran_id,product_id
HAVING product_id = "78") td
ON th.tran_id = td.tran_id)fs
ON m.member_id = fs.member_id;
-- 3. Generate report showing tran_hdr table only for those transactions 
-- in which at lease one product from baked goods category is purchased.
select * from product;
SELECT * FROM tran_dtl;
SELECT * FROM tran_hdr;
SELECT th.tran_id,th.member_id,th.store_id,fs.category,count(fs.total_tran) trans
FROM tran_hdr as th
JOIN
(SELECT p.category, td.tran_id,td.product_id,count(*) total_tran
FROM tran_dtl as td
JOIN product as p
ON td.product_id = p.product_id
GROUP BY p.category, td.tran_id,td.product_id
HAVING p.category = "Baked goods")fs
ON th.tran_id = fs.tran_id
GROUP BY th.tran_id,th.member_id,fs.category
HAVING trans >=1 ;