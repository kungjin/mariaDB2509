SHOW DATABASES;
USE exdb;
SHOW TABLES;

CREATE TABLE Employees(
	EmployeeID INT, 
	LastName VARCHAR(50),
	FirstName VARCHAR(20),
	BirthDate DATE, 
	photo VARCHAR(20),
	Notes VARCHAR(1000)
);

SELECT * FROM employees;

-- CHANGE 구문으로 Notes의 VARCHAR(1000)을 TEXT로 수정 
ALTER TABLE Employees 
CHANGE Notes Notes TEXT;

