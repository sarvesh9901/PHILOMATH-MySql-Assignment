INSERT INTO book_dtl VALUES
	(102,"Dasbodh","RamdasSwami",504,2000),
	(103,"Agnipankh","APJ Abdul Kalam",244,200),
	(104,"Let Us C","Yashvant Kanitkar",250,300),
	(105,"Pointers in C","Yashvant Kanitkar",340,300),
	(106,"Unix SHell Scripting","Tashvant Kanitkar",250,200),
	(107,"Python","Guido Van Rossum",360,100),
	(108,"Python Pandas","Guido Van Rossum",410,1230),
	(109,"Java","Oracle",324,230),
	(110,"Power BI","Microsoft Ltd",510,650),
	(111,"Mrutyunjay","Shivaji Sawant",388,600),
	(112,"Raja Shivchatrapati","Babasaheb Purandare",455,2000)
;
USE retail;
SHOW TABLES;
-- 3. Create table store_dtl in retail database.
-- 	(Which will show store_id, store_city, store_state, contact_no)
-- 4. Enter hard coded store details as
-- 	1, Satara, Maharashtra, 02162-234567
-- 	2, Pune, Maharashtra, 020-23456789
-- 	3, Aurangabad, Maharashtra, 0240-2345678
CREATE TABLE store_dtl(
store_id INT(10) NOT NULL,
store_city VARCHAR(150) NOT NULL,
store_state VARCHAR(100) NOT NULL,
contact_no INT(15) NOT NULL
);
INSERT INTO store_dtl VALUES
(1, 'Satara', 'Maharashtra', 02162-234567),
	(2, 'Pune', 'Maharashtra', 020-23456789),
	(3, 'Aurangabad', 'Maharashtra', 0240-2345678);
    
-- 5. Create family_dtl table consisting family details in family database.
-- (Which will show first_name, middle_name, last_name, age, relation_with_yourself)
    
CREATE DATABASE family;
USE family;
CREATE TABLE family_dtl(
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
age INT(100) NOT NULL,
relation_with_me VARCHAR(100) NOT NULL
);
INSERT INTO family_dtl VALUES
('sarvesh','Nirin',"Karanjkar",21,"self"),
("Nitin","Shridhar","Karanjkar",55,"Father"),
("Suchitra","Nitin","Karanjkar",50,"Mother");
