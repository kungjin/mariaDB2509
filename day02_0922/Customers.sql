SHOW DATABASES;
USE exdb;
SHOW TABLES;

-- 삭제: 테이블
DROP TABLE Customers;
-- 생성 테이블customerscustomerscustomerscustomerscustomers
CREATE TABLE Customers(
  CustomerID INT,
  CustomerName VARCHAR(100),
  ContactName VARCHAR(50),
  Address VARCHAR(50),
  City VARCHAR(20),
  PostalCode VARCHAR(20),
  Country VARCHAR(20)
);

SELECT * FROM customers;