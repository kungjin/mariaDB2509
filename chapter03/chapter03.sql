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
 


