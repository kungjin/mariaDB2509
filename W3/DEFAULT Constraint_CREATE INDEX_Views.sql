-- IFNULL(필드명, '대체값')
-- DEFAULT 'Sandnes'
SHOW TABLES;

USE exdb;

DROP TABLE persons;
SELECT *FROM persons;

CREATE TABLE persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	firstName VARCHAR(255),
	Age INT,
	City VARCHAR(255) DEFAULT 'sandnes'
);

DESC persons;

-- insert into persons(필드 나열) Values(값나열);
-- insert into persons Values(값나열);
INSERT  INTO persons(ID, LastName) VALUES(1, '길동');
INSERT  INTO persons(LastName, ID) VALUES('지매', 2);
INSERT  INTO persons VALUES(3, '세종', '대왕', 500, '수원');
INSERT  INTO persons VALUES(4, '춘향', '성', 9999, '수원9');

DELETE FROM persons 
WHERE City = '수원';

SELECT LastName, IFNULL(Age, 8888) AS LastName 
FROM persons 
WHERE LastName = '길동';

-- ---------------------------------------------------------------
ALTER TABLE persons
ALTER city SET DEFAULT '수원'; 
INSERT INTO persons VALUES(4, '춘향', '성', 9999, '용인');
INSERT INTO persons(ID, LastName) VALUES(5, '선경');

ALTER TABLE persons 
ALTER city DROP DEFAULT;
DESC persons;
INSERT INTO persons(ID, LASTName) VALUES(6,'선경6');
-- ---------------------------------------------------------------

DROP TABLE orders;
SELECT *FROM orders;
CREATE TABLE orders(
	ID INT NOT NULL ,
	OrderNumber INT NOT NULL ,
	OrderDate DATE DEFAULT CURRENT_DATE()	 
);

DESC orders;

INSERT INTO orders(ID,OrderNumber) VALUES (1,100);
INSERT INTO orders VALUES (2, 200,'2020-09-09');
INSERT INTO orders VALUES (3, 300,'2020-8-8');

SELECT *FROM orders;

-- ------------------------------------------------------------------
-- index
 
CREATE INDEX idx_lastName 
ON persons(LastName);

DESC persons; 
SHOW INDEX FROM persons;

CREATE INDEX idx_pname
ON persons(LastName, FirstName);

ALTER TABLE persons 
DROP INDEX idx_lastName;
SHOW INDEX from persons;

ALTER TABLE persons 
DROP INDEX idx_pname;
SHOW INDEX FROM persons;

-- --------------------------------------------------------------------------------
-- auto_increment 
DROP TABLE persons;

CREATE TABLE persons (
	personid INT NOT NULL AUTO_INCREMENT ,
	LastName VARCHAR(255) NOT NULL,
	firstName VARCHAR(255),
	Age INT,
	PRIMARY KEY(personid)	
);

SELECT *FROM persons;
INSERT INTO persons(LastName, FirstName, Age )VALUES ('홍', '길동', 22);
INSERT INTO persons(LastName, FirstName, Age )VALUES ('일', '지매', 25);

ALTER TABLE persons AUTO_INCREMENT= 100;
INSERT INTO persons(LastName, FirstName, Age )VALUES ('대왕', '세종', 30);

ALTER TABLE persons AUTO_INCREMENT= 1;
INSERT INTO persons(LastName, FirstName, Age )VALUES ('성', '춘향', 16);

DESC persons;

ALTER TABLE persons AUTO_INCREMENT= 50;
INSERT INTO persons(LastName, FirstName, Age )VALUES ('장', '영실', 35);

/*
	AUTO_INCREMENT는 새 레코드 삽입 시 자동으로 증가하는 숫자(PK 같은 것).

	ALTER TABLE ... AUTO_INCREMENT = n 하면 다음 INSERT부터 최소 n 이상에서 시작함.

	현재 테이블에 존재하는 최대값보다 작은 값으로는 적용되지 않음.

	이미 100까지 들어갔다면 다시 1로 돌려도 소용 없음. (101부터 들어감)

	DESC persons; 로 AUTO_INCREMENT 여부를 확인 가능.

*/
-- -------------------------------------------------------------------------
-- date 

SELECT * FROM  orders;
DROP TABLE orders;

CREATE TABLE orders(
	orderId INT,
	ProductName VARCHAR(200),
	orderDate DATE 
);

INSERT INTO orders VALUES (1, 'Geitost', '2008-11-11');
INSERT INTO orders VALUES (2, 'Camembert Pierrot', '2008-11-09');
INSERT INTO orders VALUES (3, 'Mozzarella di Giovanni', '2008-11-11');
INSERT INTO orders VALUES (4, 'Mascarpone Fabioli', '2008-10-29');

SELECT *
FROM orders
WHERE OrderDate = '2008-11-11';


SELECT *
FROM orders
WHERE OrderDate = 20081111;

SELECT *
FROM orders
WHERE OrderDate = '20081111';

SELECT * FROM  orders;
DROP TABLE orders;

CREATE TABLE orders(
	orderId INT,
	ProductName VARCHAR(200),
	orderDate DATETIME  
);

INSERT INTO orders VALUES (1, 'Geitost', '2008-11-11 10:30:00');
INSERT INTO orders VALUES (2, 'Camembert Pierrot', '2008-11-09 14:00:00');
INSERT INTO orders VALUES (3, 'Mozzarella di Giovanni', '2008-11-11 09:15:00');
INSERT INTO orders VALUES (4, 'Mascarpone Fabioli', '2008-10-29 20:45:00');


SELECT *
FROM orders
WHERE DATE (OrderDate) = '20081111';

SELECT *
FROM orders
WHERE orderdate BETWEEN '2008-11-11 00:00:00' AND '2008-11-11 23:59:59';

SELECT *
FROM orders 
WHERE DATE_FORMAT(orderDate, '%Y-%m-%d') = '2008-11-11';
-- -------------------------------------------------------------------------------------------
-- view (진짜 테이블이 아님 )

SELECT *FROM customers;
DESC INDEX FROM customers;

CREATE VIEW `Brazil Customers` AS
SELECT CustomerName, ContactName
FROM customers 
WHERE Country = 'Brazil';

SELECT *FROM `Brazil Customers`; 
-- 서브 쿼리 
SELECT AVG(price) FROM products;

CREATE VIEW `Products Above Average Price` AS
SELECT ProductName, Price 
FROM products
WHERE Price > (SELECT AVG (price) FROM products);

SELECT *FROM `Products Above Average Price`;


-- 뷰를 생성create 하거나 수정  replace 
CREATE OR REPLACE VIEW `Brazil Customers` AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

-- 뷰의 이름은 대소문자를 구분함 / 숙지 바람 , 공백도 조심 
CREATE OR REPLACE VIEW `brazil Customers` AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

SELECT *FROM `Brazil Customers`;

DROP VIEW `Brazil Customers` ;
DROP VIEW `brazil Customers` ;
DROP VIEW `Products Above Average Price` ;
















































