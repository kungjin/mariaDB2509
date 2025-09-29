USE hrdtest;

DROP TABLE books;

CREATE TABLE books(
		bookID INT PRIMARY KEY,
		Title VARCHAR(200) NOT NULL,
		Author VARCHAR(100),
		Publisher VARCHAR(100),
		Price INT CHECK (price >= 0),
		PubYear YEAR   
);


SELECT *FROM books ;

DESC books;

INSERT INTO books 
VALUE 
(1, '괴물들이 사는 나라', '모리스 샌닥', '시공주니어', 11700, 2021 ),
(2, '죽은 시인의 사회', 'N.H. 클라인바움', '위즈덤하우스', 13000, 2019),
(3, '채식주의자', '한강', '창비', 12000, 2016),
(4, '작별하지 않는다', '한강', '문학동네', 15000, 2021),
(5, '총, 균, 쇠', '재레드 다이아몬드', '문학사상', 18000, 2013);

INSERT INTO books 
VALUE 
(6, '파친코', '이민진', '인플루엔셜', 16800, 2018);


CREATE TABLE Rental(
	RentalID INT PRIMARY KEY ,
	MemberID INT NOT NULL ,
	BookID INT NOT NULL , 
	RentDate DATE NOT null,
	ReturnDate DATE ,
	CONSTRAINT FK_Rental_Member 
	FOREIGN KEY  (MemberID) REFERENCES Members(MemberID),
	CONSTRAINT FK_Rental_book 
	FOREIGN KEY (BookID) REFERENCES books(BookID),
	 CONSTRAINT CHK_Rental_Dates CHECK 
	 (ReturnDate IS NULL OR ReturnDate >= RentDate)
);

 DROP TABLE Rental;
 
 DESC rental;
 
INSERT INTO Rental
VALUES
(1, 1, 1, '2025-09-01', NULL),
(2, 1, 2, '2025-09-10', NULL);

-- 반납일 추가/수정
UPDATE Rental
SET ReturnDate = '2025-09-15'
WHERE RentalID = 1;

-- 대출일 잘못 입력한 거 수정
UPDATE Rental
SET ReturnDate = null
WHERE RentalID = 2;


SELECT *FROM rental;

CREATE Table Members(
 MemberID INT PRIMARY KEY,
 NAME VARCHAR(10) NOT NULL ,
 phone VARCHAR(20) ,
 Address VARCHAR(250)   
);

DESC Members;

SELECT *FROM Members;

INSERT INTO Members 
VALUES
(1, '홍길동', '010-1111-2222', '서울'),
(2, '임꺽정', '010-2222-3333', '수원');


-- (1) 2020 년 이상 출판된 도서를 검색하시오

SELECT *FROM books WHERE PubYear >= 2020;

-- (2) '홍길동' 회원이 대출한 도서 목록을 출력하시오

SELECT b.BookID, b.Title, r.RentDate, r.ReturnDate
FROM rental r
JOIN members m ON m.MemberID = r.MemberID 
JOIN books b ON b.bookID = r.BookID
WHERE m.Name = '홍길동';


-- (3) 반납하지 않은 도서를 검색하시오
SELECT r.RentalID, b.Title, m.Name, r.RentDate
FROM rental r
JOIN books b ON b.BookID = r.BookID
JOIN members m ON m.MemberID = r.MemberID
WHERE r.ReturnDate IS NULL;

-- (4) 도서별 대출 횟수를 출력하시오 
SELECT b.BookID, b.Title, COUNT(*) AS RentalCount
FROM Rental r
JOIN books b ON b.BookID = r.BookID
GROUP BY b.BookID, b.Title
ORDER BY RentalCount DESC, b.Title;


INSERT INTO rental 
VALUES 
(3, 1, 5, '2025-10-01', NULL),       
(4, 2, 5, '2025-10-03', NULL);  

-- (5) 가격이 가장 비싼 도서를 출력하시오
SELECT *
FROM books 
WHERE price = (SELECT MAX(Price)FROM books);
  



