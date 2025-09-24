SHOW DATABASES;
USE exdb;
SHOW TABLES;

CREATE TABLE Orders(
	OrderID INT, 
	CustomerID VARCHAR(50),
	EmployeeID VARCHAR(20),
	OrderDate DATE, 
	ShipperID INT 
);

SELECT * FROM orders;

ALTER TABLE orders 
CHANGE OrderID OrderID VARCHAR(50);