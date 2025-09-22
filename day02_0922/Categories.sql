SHOW DATABASES;
USE exdb;
SHOW TABLES;

-- 삭제: 테이블
DROP TABLE Categories;
-- 생성 테이블
CREATE TABLE Categories(
	CategoryID INT, 
	CategoryName VARCHAR(50),
	Description VARCHAR(255)
);

-- 선택: 필드 
SELECT *FROM Categories;