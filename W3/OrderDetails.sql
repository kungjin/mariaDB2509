SHOW DATABASES;
USE exdb;
SHOW TABLES;

DROP TABLE OrderDetails;
CREATE TABLE OrderDetails(
	OrderDetailID INT, 
	OrderID INT,
	ProductID INT,
	Quantity INT 

);

SELECT * FROM orderdetails;

ALTER TABLE orderdetails 
MODIFY ProductID VARCHAR(2) NULL;

ALTER TABLE orderdetails 
MODIFY OrderID CHAR(5) NULL;