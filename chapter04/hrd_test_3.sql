-- 홈 쇼핑 회원 관리 

USE hrdtest;

-- 1. 테이블을 생성 하시오 

CREATE TABLE ShopMember (
		CustNo INT AUTO_INCREMENT PRIMARY KEY,
		CustName VARCHAR(30) NOT NULL, 
		Phone VARCHAR(13) UNIQUE,
		Address VARCHAR(50), 
		JoinDate DATE NOT NULL, 
		Grade CHAR(1) NOT NULL, 
		City CHAR(2),
		CONSTRAINT CHK_Grade CHECK (Grade IN ('A','B','C')) 
);

DESC ShopMember;

CREATE TABLE Sale (
	SaleNo INT AUTO_INCREMENT PRIMARY KEY, 
	CustNo INT NOT NULL ,
	PCost INT NOT NULL,
	Amount INT NOT NULL, 
	Price INT NOT NULL, 
	PCode CHAR(3)NOT NULL, 
	CONSTRAINT FK_sale_ShopMember
	FOREIGN KEY (CustNo) REFERENCES ShopMember(CustNo)
	ON UPDATE CASCADE
   ON DELETE CASCADE
);

DESC Sale;

-- (1) 회원 등록
INSERT INTO shopmember 
VALUES
(DEFAULT, '홍길동', '010-1234-5678', '서울시 강남구', '2020-01-01', 'A', '01'),
(DEFAULT, '이순신', '010-2222-3333', '부산시 해운대구', '2021-03-15', 'B', '02'),
(DEFAULT, '강감찬', '010-7777-8888', '대구시 달서구', '2019-05-20', 'C', '03');


SELECT *FROM shopmember;


-- (2) 회원 조회
-- 2-1) A등급 회원의 이름, 전화번호, 가입일자
SELECT CustName, Phone, JoinDate
FROM ShopMember
WHERE Grade = 'A';

-- 2-2) 가입일자가 2020년 이후인 회원
SELECT *
FROM ShopMember
WHERE JoinDate >= '2020-01-01';

-- (3) 판매 등록: Sale 테이블에 삽입하시오.
INSERT INTO Sale (CustNo, PCost, Amount, Price, PCode) VALUES
(1, 1000, 10, 10000, 'P01'),
(2, 2000,  5, 10000, 'P02'),
(3, 1500,  7, 10500, 'P03');

SELECT *FROM sale;

-- (4) 판매 조회
-- 4-1) 회원별 총 구매금액 (회원번호, 회원성명, 총금액)
SELECT m.CustNo, m.CustName, SUM(s.Price) AS TotalAmount
FROM ShopMember m
JOIN Sale s ON s.CustNo = m.CustNo
GROUP BY m.CustNo, m.CustName
ORDER BY TotalAmount DESC;

-- 4-2) 가장 구매금액이 높은 회원의 이름과 금액 (동점 시 1명만)


-- (5) 데이터 수정 / 삭제
-- 5-1) '이순신' 회원의 등급을 A로 수정




-- 5-2) CustNo = 3 회원 삭제 

