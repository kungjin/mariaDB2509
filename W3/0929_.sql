-- --(

SHOW DATABASES;

USE exdb;

SHOW TABLES;
SELECT *FROM  persons;
DROP TABLE persons;

-- 테이블 생성
CREATE TABLE Persons(
	ID INT NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	firstName VARCHAR(255) NOT NULL,
	age INT 

);

DESCRIBE Persons;

-- 테이블 필드 구조 수정 
ALTER TABLE Persons
MODIFY age INT NOT NULL;
DESC persons;


-- 테이블 
CREATE TABLE Persons(
	id INT NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	FIRSTName VARCHAR(255),
	age INT,
	UNIQUE(ID)
);

DESC persons;

DROP TABLE persons;

-- UNIQUE(ID) : 1,2,3, ...  즉 ID 값이 중복안됨.
-- UNIQUE(ID, LastName) 
-- : ID+LastName 구새의 필드값을 합친 값이 중복 안됨 
-- 1길동, 2길동, 3길동,  1지매, 2지매, 3지매.. 중복가능
CREATE TABLE Persons(
	ID INT NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT,
	CONSTRAINT UC_Person UNIQUE (ID,LastName) 
);

DESC persons;

ALTER TABLE Persons
ADD UNIQUE(ID);

DROP TABLE persons;

CREATE TABLE Persons(
	ID INT NOT NULL,
	lastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	age INT
);

DESC persons;

ALTER TABLE Persons
ADD CONSTRAINT UC_person UNIQUE(ID, LastName);

-- 제약조건 삭제
ALTER TABLE persons 
DROP INDEX uc_person;




-- CONSTRAINT를 관리하는 테이블에서 확인하는 방법 : start ----
SHOW INDEX FROM persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

--
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME 
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Persons';

-- 
SELECT CONSTRAINT_NAME, COLUMN_NAME, ORDINAL_POSITION
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'persons'
 AND CONSTRAINT_NAME = 'uc_person'; 
 
-- CONSTRAINT를 관리하는 테이블에서 확인하는 방법: end ---- 


DROP TABLE persons;

CREATE TABLE persons(
	ID INT NOT NULL ,
	LastName VARCHAR(255) NOT NULL, 
	firstName VARCHAR(255),
	age INT,
	PRIMARY KEY(ID)

);

DESC persons ;

CREATE TABLE persons(
	ID INT NOT NULL ,
	LastName VARCHAR(255) NOT NULL, 
	firstName VARCHAR(255),
	age INT,
	CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

DESC persons;

DROP table persons;


CREATE TABLE persons(
	ID INT NOT NULL ,
	LastName VARCHAR(255) NOT NULL, 
	firstName VARCHAR(255),
	age INT

);

DESC persons;

ALTER TABLE persons;
ADD PRIMARY KEY(ID);

CREATE TABLE persons(
	ID INT NOT NULL ,
	LastName VARCHAR(255) NOT NULL, 
	firstName VARCHAR(255),
	age INT

);

DESC persons;

ALTER TABLE persons
ADD CONSTRAINT PK_Person PRIMARY KEY(ID, LastName);

DESC persons;

ALTER TABLE persons
DROP PRIMARY KEY; 

-- ------------------------------------------------------------------
SELECT *FROM persons_f;
SELECT *FROM orders_f;

-- 인원표

CREATE TABLE persons_f(
    PersonID INT PRIMARY KEY ,
    LastName VARCHAR(255),
    FirstName VARCHAR(225),
    age INT 
	);

-- 주문표 
CREATE TABLE Orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	FOREIGN KEY(personID) REFERENCES persons_f(personID)	
	);
	
	SELECT *FROM orders_f;
	DESC persons_f;
	DESC orders_f;
	
-- consrtaint 등록	
	DROP TABLE Orders_f;
	
	CREATE TABLE Orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT,
	PRIMARY KEY(OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY(personID) REFERENCES persons_f(personID)	
	);
	
	SHOW INDEX FROM Orders_f;
	
DROP TABLE Orders_f;

	CREATE TABLE Orders_f(
	OrderID INT NOT NULL,
	OrderNumber INT NOT NULL,
	PersonID INT	
	); 	
	
DESC Orders_f;	
	
	ALTER TABLE Orders_f
	ADD FOREIGN KEY (PersonID) REFERENCES persons_f(personID);
	
	ALTER TABLE Orders_f
	ADD CONSTRAINT FK_PersonOrder 
	FOREIGN KEY (PersonID) REFERENCES persons_f(personID);	
	 
SHOW INDEX FROM Orders_f; 

ALTER TABLE orders_f
DROP FOREIGN KEY FK_personOrder;


-- -------------------------------------------------------------------------------

DROP TABLE persons;

CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL ,
	FirstName VARCHAR(255),
	age INT,
	CHECK (age>= 18)
);

DESC persons;

SHOW CREATE TABLE persons;


CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL ,
	FirstName VARCHAR(255),
	age INT,
	City VARCHAR(255),
	CONSTRAINT CHK_Person CHECK (Age>= 18 AND City = 'sandnes')
);

SHOW INDEX FROM  persons;
SHOW CREATE TABLE persons;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons'; 

DROP TABLE persons;

CREATE TABLE persons (
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL ,
	FirstName VARCHAR(255),
	age INT,
	City VARCHAR(255)
	);

DESC persons; 

ALTER TABLE persons
ADD CHECK (age >= 18);

ALTER TABLE persons 
ADD CONSTRAINT CHK_personAge CHECK (Age>= 18 AND city= 'sandnes');

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

SELECT *
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'persons'; 





























 