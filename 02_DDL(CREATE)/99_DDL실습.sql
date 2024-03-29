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

--컬럼: BK_NO(도서번호) --기본키(BOOK_PK)

-- BK_TITLE(도서명) --NOT NULL(BOOK_NN_TITLE)

-- BK_AUTHOR(저자명) --NOT NULL(BOOK_NN_AUTHOR)

-- BK_PRICE(가격)

-- BK_STOCK(재고) --기본값 1로 지정

-- BK_PUB_NO(출판사번호) --외래키(BOOK_FK)(TB_PUBLISHER 테이블을 참조하도록)

-- 이때 참조하고 있는 부모데이터 삭제 시 자식데이터도 삭제되도록 설정
-- DELETE
--5개 정도의 샘플 데이터 추가하기

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

INSERT INTO TB_BOOK 
VALUES(001, '아따맘마', '보노보노', 9900, 5, 3);

INSERT INTO TB_BOOK 
VALUES(002, '학원에서 살아남기', '최승협', 8500, 10, 2);

INSERT INTO TB_BOOK 
VALUES(003, '재벌집 막내손자', '송중지', 15900, 30, 1);

INSERT INTO TB_BOOK 
VALUES(004, '왕꽃나무꾼님', '직녀', 12000, 15, 1);

INSERT INTO TB_BOOK 
VALUES(005, '우리아이가 달라줬어요', '오은영', 33000, 25, 3);

SELECT * FROM TB_BOOK;

DROP TABLE TB_BOOK;



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

CREATE TABLE TB_MEMBER(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(30) CONSTRAINT MEMBER_UQ UNIQUE,
    MEMBER_PWD VARCHAR2(30) CONSTRAINT MEMBER_NN_PWD NOT NULL,
    MEMBER_NAME VARCHAR2(30) CONSTRAINT MEMBER_NN_NAME NOT NULL,
    GENDER CHAR(1) CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN ('M','F')),
    ADDRESS VARCHAR2(50),
    PHONE VARCHAR(13),
    STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN ('Y','N')),
    ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL
);

COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS '회원비밀번호';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME IS '회원이름';
COMMENT ON COLUMN TB_MEMBER.GENDER IS '회원성별';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS '회원주소';
COMMENT ON COLUMN TB_MEMBER.PHONE IS '회원전화번호';
COMMENT ON COLUMN TB_MEMBER.STATUS IS '회원탈퇴여부';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS '회원가입일';

SELECT * FROM TB_MEMBER;

DROP TABLE TB_MEMBER;

INSERT INTO TB_MEMBER
VALUES(01, 'samsungjoa', 'samsungsarang', '김삼엽', 'F', '경기도 구리시', '01033334444', DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER
VALUES(02, 'steve_jobs', 'applemansei', '스티브잡스', 'M', '경기도 성남시', '01066667777', 'Y', '22/11/11');

INSERT INTO TB_MEMBER
VALUES(03, 'xiaomizzang', 'woshizhonguoren', '마윈', 'M', '경기도 인천시', '01088882222', DEFAULT, '21/10/10');

INSERT INTO TB_MEMBER
VALUES(04, 'bonobono', 'nanunsudal', '보노보노', 'F', '경기도 오산시', '01099996666', 'Y', '22/8/8');

INSERT INTO TB_MEMBER
VALUES(05, 'zzanggu', 'shinosuke', '신짱구', 'M', '경기도 떡잎시', '01055005500', DEFAULT, DEFAULT);

INSERT 
    INTO TB_MEMBER
        (
          MEMBER_NO
        , MEMBER_ID
        , MEMBER_PWD
        , MEMBER_NAME
        , GENDER
        , ADDRESS
        , PHONE
        )
    VALUES
        (
        06
        , 'naruto'
        , 'sasuke'
        , '나룻터'
        , 'F'
        , '경기도 나뭇잎마을'
        , '01055995544'
        );

--4. 도서를 대여한 회원에 대한 데이터를 담기 위한 대여목록 테이블(TB_RENT)

--컬럼:

--RENT_NO(대여번호) --기본키(RENT_PK)

--RENT_MEM_NO(대여회원번호) --외래키(RENT_FK_MEM) TB_MEMBER와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션 설정

--RENT_BOOK_NO(대여도서번호) --외래키(RENT_FK_BOOK) TB_BOOK와 참조하도록

--이때 부모데이터 삭제 시 NULL값이 되도록 옵션설정

--RENT_DATE(대여일) --기본값 SYSDATE

--샘플데이터 3개정도 추가하기


CREATE TABLE TB_RENT(
    RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
    RENT_MEM_NO NUMBER CONSTRAINT RENT_FK_MEM REFERENCES TB_MEMBER ON DELETE SET NULL,
    RENT_BOOK_NO NUMBER CONSTRAINT RENT_FK_BOOK REFERENCES TB_BOOK ON DELETE SET NULL,
    RENT_DATE DATE DEFAULT SYSDATE
);

DROP TABLE TB_RENT;

SELECT * FROM TB_RENT;

INSERT INTO TB_RENT
VALUES(0001, 01, 002, DEFAULT);

INSERT INTO TB_RENT
VALUES(0002, 04, 001, '22/12/01');

INSERT INTO TB_RENT
VALUES(0003, 03, 003, '22/11/30');

SELECT MEMBER_NAME AS "회원 이름", MEMBER_ID AS "아이디", RENT_DATE AS "대여일", RENT_DATE + 7 AS "반납일"
 FROM TB_MEMBER
 JOIN TB_RENT ON (RENT_MEM_NO = MEMBER_NO)
 WHERE RENT_BOOK_NO = 002;

--2번 도서를 대여한 회원의 이름, 아이디, 대여일, 반납예정일(대여일+7)을 조회하시오.





