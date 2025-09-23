SHOW DATABASES;
USE exdb;
SHOW TABLES;

-- 삭제: 테이블
DROP TABLE Shippers;
-- 생성 테이블
CREATE TABLE Shippers(
	ShipperID INT, 
	ShipperName VARCHAR(50),
	Phone VARCHAR(20)
);
-- 삭제 레코드(한줄 한줄)
-- DELETE FROM Shippers 
-- 선택: 필드 
SELECT *FROM Shippers;
