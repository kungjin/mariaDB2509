SHOW DATABASES;
CREATE DATABASE shopdb;
USE shopdb;
SHOW TABLES;

-- p51
CREATE TABLE memberTBL(
	memberID CHAR(8) NOT NULL,
	memberName CHAR(15) NOT NULL,
	memberAddress CHAR(60) 
);

SELECT * FROM membertbl;
DESC membertbl;