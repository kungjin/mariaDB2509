-- MySQL Joins 정리
USE exdb
SHOW TABLES 

-- 기본 조회: 데이터 상태를 먼저 확인
SELECT *FROM Customers;
SELECT *FROM orders;
SELECT *FROM shippers;
SELECT *FROM employees;

-- =========================

-- 1) INNER JOIN (교집합) 테이블 2개 
-- 두 테이블에 공통키(CustomerID)가 있는 행만 나온다.

SELECT o.OrderID, c.CustomerID, c.CustomerName 고객이름, o.orderDate
FROM orders AS o
INNER JOIN customers AS c
ON o.customerID = c.CustomerID;

-- =========================

-- ============================================

-- 2) INNER JOIN (3테이블)
-- orders ↔ customers ↔ shippers 를 키로 연결
-- 공통으로 매칭되는 행만 출력됨.

SELECT orders.OrderID, customers.CustomerName, shippers.ShipperName
FROM orders AS o
INNER JOIN customers AS c
 ON o.CustomerID = c.CustomerID
INNER JOIN shippers AS s
 ON o.ShipperID = s.ShipperID; 
 
-- ============================================


-- =========================

-- 3) LEFT JOIN (왼쪽 우선) 
-- Customers는 모두 나오고, 주문이 없으면 OrderID는 NULL.
-- 고객 기준 보고서에 자주 사용.

SELECT c.CustomerID, c.CustomerName, o.OrderID
FROM customers c
LEFT JOIN orders o
    ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID;

-- =========================

-- =========================

-- 4) RIGHT JOIN (오른쪽 우선)
-- Employees는 모두 나오고, 해당 직원이 처리한 주문이 없으면 OrderID가 NULL.
-- 직원 기준 보고서에 유용.
-- 주의: 주문번호 기준 정렬 시 NULL이 위/아래로 몰릴 수 있음.
-- 직원번호 기준 정렬하려면 ORDER BY e.EmployeeID 로 바꿔도 됨.

SELECT o.OrderID, e.EmployeeID, e.FirstName
FROM orders o
RIGHT JOIN employees e
	ON o.EmployeeID = e.EmployeeID
	ORDER BY o.employeeID;

-- =========================	
	
-- =========================

-- 5) CROSS JOIN (카테시안 곱)
-- 모든 고객 × 모든 주문 → 엄청난 행 수가 나옴.
-- 아래 WHERE로 실질적으로는 INNER JOIN과 동일하게 제한.
-- 주의: WHERE 없으면 전수 곱이라 폭증!

SELECT c.CustomerName, o.OrderID 
FROM customers c
CROSS JOIN orders o
WHERE c.CustomerID = o.CustomerID;
-- =========================

-- =========================

-- 6) SELF JOIN (자기 자신과 조인)
-- 같은 도시의 고객들을 서로 짝지어 보여준다.
-- <> 는 양방향 쌍이 모두 나오므로 중복 제거하려면 < 규칙 사용 권장.
-- (예: c1.CustomerID < c2.CustomerID)

SELECT c1.CustomerID, c1.CustomerName AS c1_고객이름, c1.City  c1_도시,
		c2.CustomerID, c2.CustomerName AS c2_고객이름, c2.City  c2_도시
FROM customers c1, customers c2
WHERE c1.customerID <> c2.CustomerID AND c1.City = c2.City
	ORDER BY c1.City;
	
-- =========================	

-- =========================

-- 7) UNION (합집합: 중복 제거)
-- 각 SELECT의 컬럼 개수·타입이 호환되어야 함.
-- 기본 UNION은 중복을 제거하고, UNION ALL은 중복까지 모두 유지한다.
-- 첫 SELECT의 컬럼 별칭이 결과 헤더에 적용됨.

-- 참고용: 원본 데이터 미리 보기
SELECT * FROM customers;
SELECT * FROM suppliers;

-- 도시 목록 합치기 (중복 제거)
SELECT City FROM customers
UNION 
SELECT City FROM suppliers
ORDER BY City;

-- 독일만 (두 집합에서 같은 스키마)
SELECT city, country FROM customers
WHERE country='Germany'
UNION 
SELECT city, country FROM suppliers
WHERE country='Germany'
 	ORDER BY city;

-- 레이블 붙여서 합치기 (첫 SELECT의 별칭 TYPE이 결과 컬럼명)
SELECT 'customer' AS TYPE, ContactName, City, country
FROM Customers
UNION 
SELECT 'supplier', ContactName, City, country
FROM suppliers;

 -- =========================