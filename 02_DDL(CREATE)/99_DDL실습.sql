--실습문제--

--도서관리 프로그램을 만들기 위한 테이블을 만들기

--이때, 제약조건에 이름을 부여할 것

-- 각 컬럼에 주석달기


--1. 출판사들에 대한 데이터를 담기 위한 출판사 테이블(TB_PUBLISHER)

--컬럼: PUB_NO(출판사번호) --기본키(PUBLISHER_PK) -- 타입은 내맴

-- PUB_NAME(출판사명) --NOT NULL(PUBLICHSER_NN)

-- PHONE(출판사전화번호) --제약조건 없음

-- 3개 정도의 샘플 데이터 추가하기



CREATE TABLE TB_PUBLISHER(
    PUB_NO NUMBER CONSTRAINT PUBLIHSER_PK PRIMARY KEY,
    PUB_NAME VARCHAR2(20) CONSTRAINT PUBLICHER_NN NOT NULL,
    PHONE VARCHAR(13)
);

SELECT * FROM TB_PUBLISHER;

DROP TABLE TB_PUBLISHER;

INSERT INTO TB_PUBLISHER
VALUES (
    1, '동동출판', '0310010001' 
);

INSERT INTO TB_PUBLISHER
VALUES (
    2, '호돌이문학', '0327775555' 
);

INSERT INTO TB_PUBLISHER
VALUES (
    3, '코코넛출판사', '0881234567' 
);

COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '출판사번호';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '출판사이름';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '출판사전화번호';


--2. 도서들에 대한 데이터를 담기 위한 도서 테이블(TB_BOOK)

CREATE TABLE TB_BOOK (
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
    BK_AUTHOR VARCHAR2(50) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
    BK_PRICE NUMBER,
    BK_STOCK NUMBER DEFAULT 1,
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER ON DELETE CASCADE
);

COMMENT ON COLUMN TB_BOOK.BK_NO IS '책번호';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS '책제목';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '저자';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS '가격';
COMMENT ON COLUMN TB_BOOK.BK_STOCK IS '재고량';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '출판사번호';


--컬럼: BK_NO(도서번호) --기본키(BOOK_PK)

-- BK_TITLE(도서명) --NOT NULL(BOOK_NN_TITLE)

-- BK_AUTHOR(저자명) --NOT NULL(BOOK_NN_AUTHOR)

-- BK_PRICE(가격)

-- BK_STOCK(재고) --기본값 1로 지정

-- BK_PUB_NO(출판사번호) --외래키(BOOK_FK)(TB_PUBLISHER 테이블을 참조하도록)

-- 이때 참조하고 있는 부모데이터 삭제 시 자식데이터도 삭제되도록 설정
-- DELETE
--5개 정도의 샘플 데이터 추가하기












--3. 회원에 대한 데이터를 담기 위한 회원 테이블(TB_MEMBER)

--컬럼명: MEMBER_NO(회원번호) --기본키(MEMBER_PK)

-- MEMBER_ID(아이디) --중복금지(MEMBER_UQ)

--MEMBER_PWD(비밀번호) NOT NULL(MEMBER_NN_PWD)

--MEMBER_NAME(회원명) NOT NULL(MEMBER_NN_NAME)

--GENDER(성별) 'M' 또는 'F'로 입력되도록 제한(MEMBER_CK_GEN)

--ADDRESS(주소)

--PHONE(연락처)

--STATUS(탈퇴여부) --기본값으로 'N' 그리고 'Y' 혹은 'N'으로 입력되도록 제약조건(MEMBER_CK_STA)

--ENROLL_DATE(가입일) --기본값으로 SYSDATE, NOT NULL 조건(MEMBER_NN_EN)

--5개 정도의 샘플 데이터 추가하기











--4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여목록 테이블(TB_RENT)

--컬럼:

--RENT_NO(대여번호) --기본키(RENT_PK)

--RENT_MEM_NO(대여회원번호) --외래키(RENT_FK_MEM) TB_MEMBER와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션 설정

--RENT_BOOK_NO(대여도서번호) --외래키(RENT_FK_BOOK) TB_BOOK와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션설정

--RENT_DATE(대여일) --기본값 SYSDATE

--샘플데이터 3개정도 추가하기





--2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납예정일(대여일+7)을 조회하시오.





