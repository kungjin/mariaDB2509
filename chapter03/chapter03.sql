CREATE DATABASE shopdb;

USE shopdb;

/* 
PRIMARY KEY(프라이머리 키)란?
1. 테이블의 각 행(row)을 유일하게 식별하는 컬럼(또는 컬럼 조합).
2. NULL 값을 허용하지 않고, 중복된 값을 넣을 수 없음.
3. 한 테이블에는 반드시 0개 또는 1개의 PRIMARY KEY만 설정 가능.
4. PRIMARY KEY는 보통 'id', '주민번호', '학번' 등 고유 식별자에 사용.
5. FOREIGN KEY를 통해 다른 테이블에서 참조될 수 있음.
6. PRIMARY KEY로 지정하면 자동으로 인덱스가 생성되어 검색 속도가 빨라짐.
*/

CREATE TABLE membertbl (
  memberID CHAR(8) PRIMARY KEY,
  memberName CHAR(5) NOT NULL,
  memberAddress CHAR(20)
);

INSERT INTO membertbl
VALUES 
('Dang', '당탕이', '경기 부천시 중동' ),
('Jee', '지운이', '서울 은평구 중산동' ),
('Han', '한주연', '인천 남구 주안동' ),
('Sang', '상길이', '경기성남구 분당구' );


CREATE TABLE producttbl(
	productName CHAR(4) PRIMARY KEY,
	cost INT NOT NULL,
	makeData DATE ,
	company CHAR(5) ,
	amount INT NOT NULL 
);

INSERT INTO producttbl
VALUES 
('컴퓨터', 10,'2017-01-01' ,'삼성', 17 ),
('세탁기', 20,'2018-09-01' ,'LG', 3 ),
('냉장고', 5,'2019-02-01','대우', 22 );



SELECT * FROM membertbl;
SELECT * FROM producttbl;

SELECT memberName, memberAddress FROM membertbl;

SELECT * FROM memebertbl WHERE memberName = '지운이';
 
-- drop table testTBL; - 테이블 삭제를 위한 구문(데이터와 구조까지 완전히 삭제) 

-- p64 실습5  인덱스 사용 
/* 
한줄 선택 후 Ctrl+F9 하나의 쿼리만 실행 
커서만 줄에 놓고 Shift+ Ctrl+ F9 하나의 쿼리만 실행
*/

-- p65 0-2 
CREATE TABLE indexTBL 
(first_name VARCHAR(14), last_name VARCHAR(16), hire_date DATE);

INSERT INTO indextbl 
	SELECT first_name, last_name, hire_date
	FROM employees.employees
	LIMIT 500;
	
SELECT *FROM indextbl;

-- step1 

SELECT *FROM indextbl WHERE first_name = 'Mary';

EXPLAIN SELECT *FROM indextbl WHERE first_name = 'Mary';


-- step2

CREATE INDEX idx_indexTBL_firstname ON indextbl(first_name);
 
SELECT *FROM indextbl WHERE first_name = 'Mary';

EXPLAIN SELECT *FROM indextbl WHERE first_name = 'Mary';

/*
id → 실행 단계

select_type → 쿼리 유형

table → 대상 테이블

type → 접근 방식 (ALL이면 느림, ref 이상이면 좋음)

possible_keys → 후보 인덱스

key → 실제 사용 인덱스

rows → 예상 탐색 수

Extra → 추가 최적화 정보
*/

-- p70  뷰 기본사용>> step1

CREATE VIEW uv_memberTBL
AS
	SELECT memberName, memberAddress FROM membertbl;

-- step2	
	SELECT *FROM uv_membertbl;

-- 뷰(View)란?
-- 가상의 테이블, 실제 데이터는 저장하지 않고
-- SELECT 쿼리 결과를 이름 붙여 재사용하는 객체

-- 특징
-- 1) 데이터 복사 없음 → 항상 원본 테이블 실시간 참조
-- 2) 복잡한 쿼리 단순화 가능
-- 3) 필요한 컬럼만 노출 → 보안성 ↑
-- 4) 원본 구조 변경 시에도 외부 접근 일관성 유지


-- 스토어드 프로시저 
-- 실습7 > 동시 조회 

DROP PROCEDURE IF EXISTS myProc;

SELECT *FROM membertbl WHERE memberName = '당탕이';
SELECT *FROM producttbl WHERE productName = '냉장고';

USE exdb;


 CREATE PROCEDURE myProc()
 BEGIN  
 
SELECT *FROM membertbl WHERE memberName = '당탕이';
SELECT *FROM producttbl WHERE productName = '냉장고';

END ;


CALL myProc();

-- 3.34 트리거 
INSERT INTO membertbl VALUES ('figure','연아', '경기도 군포시 당정동');

SELECT *FROM membertbl ;

UPDATE membertbl SET memberAddress = '서울 강남구 역삼동'
WHERE memberName = '연아';

DELETE FROM membertbl
WHERE memberName = '연아' ;


-- step 1

CREATE TABLE deletedMemberTBL(
	memberID CHAR(8),
	memberName CHAR(5),
	memberAddress CHAR(20),
	deletedDate DATE -- 삭제한 날짜
);


 CREATE TRIGGER trg_deleteMemberTBL -- 트리거 이름
  	AFTER DELETE -- 삭제후에 작동하게 지정 
 	ON membertbl -- 트리거 부착할 테이블 
 	FOR EACH ROW -- 각행마다 적용시킴
 	 
 		-- old 테이블의 내용을 백업 테이블에 삽입 
 		INSERT INTO deletedMemberTBL 
 		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
 		
 
DROP TRIGGER IF EXISTS trg_deleteMemberTBL;

-- step2 

SELECT *FROM membertbl; 

DELETE FROM membertbl WHERE memberName = '당탕이';

SELECT *FROM deletedmembertbl;


-- 3.4 데이터베이스 백업 및 관리
-- 백업과 복원 
-- 실습 9 








