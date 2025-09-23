-- customers
USE exdb;
SHOW TABLES;
SELECT * FROM Customers;
SELECT COUNT(*) FROM customers;

SELECT *
FROM customers
WHERE Country = 'Germany' AND city = 'Berlin';

SELECT *
FROM customers
WHERE City = 'Berlin' OR City LIKE 's%';

SELECT *
FROM customers
WHERE NOT Country = 'Germany';

SELECT *
FROM customers 
WHERE Country = 'Germany' AND (city ='Berlin' OR City = 'Stuttgart');

SELECT * FROM Customers
WHERE NOT Country = 'Germany' AND NOT Country = 'USA';


SELECT *
FROM customers
ORDER BY Country;

SELECT *
FROM customers
ORDER BY  Country DESC;  

SELECT *
FROM customers
ORDER BY CustomerName, Country; 

SELECT *
FROM customers
ORDER BY Country ASC, CustomerName DESC;

INSERT INTO customers(CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skangen 21', 'Stavanger', '4006', 'Norway');




























