DROP TABLE if EXISTS empolyee;

CREATE TABLE Employee (
	EmpNo INT PRIMARY KEY,
	EmpName VARCHAR(30) NOT NULL,
	Dept VARCHAR(20) NOT NULL,
	HireDate DATE NOT NULL, 
	Salary INT NOT NULL,  
	CONSTRAINT CHK_Salary_Min CHECK (Salary >= 2000000)
);

DROP TABLE Empolyee;

ALTER TABLE employee
MODIFY EmpNo INT AUTO_INCREMENT;

DESC employee;

-- (1)사원 등록: employee 테이블에 다음 데이터를 삽입하시오. 

INSERT INTO employee 
VALUES 
(DEFAULT,'홍길동', '영업부', '2020-03-01', 2500000),
(DEFAULT,'이순신', '인사부', '2019-07-15', 3200000),
(DEFAULT,'강감찬', '개발부', '2021-01-10', 2800000);

SELECT *FROM employee;

-- (2)조회 
-- 2-1) 부서가 '개발부'인 사원의 사번, 이름, 급여

SELECT EmpNo, EmpName, Salary
FROM employee
WHERE Dept = '개발부';

-- 2-2) 급여 3,000,000원 이상 사원의 이름과 부서

SELECT EmpName, Dept
FROM employee
WHERE Salary >= 3000000 ; 


-- (3) 수정: 이순신의 급여를 3,500,000으로

UPDATE employee 
SET Salary  = 3500000
WHERE EmpName = '이순신'; 

SELECT *FROM employee;

-- (4) 삭제: 사번이 1번인 사원 삭제
DELETE FROM employee
WHERE EmpNo = 1; 


-- 오름차순 정렬 확인 
SELECT * FROM Employee ORDER BY EmpNo;





