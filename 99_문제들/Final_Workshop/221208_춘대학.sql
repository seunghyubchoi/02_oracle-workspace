/* 
1. 계열 정보를 저장핛 카테고리 테이블을 맊들려고 핚다. 다음과 같은 테이블을
작성하시오.

테이블 이름
    TB_CATEGORY
컬럼
    NAME, VARCHAR2(10)
    USE_YN, CHAR(1), 기본값은 Y 가 들어가도록
*/

CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

/*
2. 과목 구분을 저장핛 테이블을 맊들려고 핚다. 다음과 같은 테이블을 작성하시오.

테이블이름
    TB_CLASS_TYPE
컬럼
    NO, VARCHAR2(5), PRIMARY KEY   
    NAME , VARCHAR2(10)

*/
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

/*
3. TB_CATAGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오.
(KEY 이름을 생성하지 않아도 무방함. 맊일 KEY 이를 지정하고자 핚다면 이름은 본인이
알아서 적당핚 이름을 사용핚다.)
*/

ALTER TABLE TB_CATEGORY
    ADD CONSTRAINT NAME_PK PRIMARY KEY(NAME);


-- 4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.

ALTER TABLE TB_CLASS_TYPE
    MODIFY NAME NOT NULL;

/*

5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 
크기는 10 으로, 컬럼명이 NAME 인 것은 마찪가지로 
기존 타입을 유지하면서 크기 20 으로 변경하시오.

*/

ALTER TABLE TB_CATEGORY
    MODIFY NAME VARCHAR2(20);


ALTER TABLE TB_CLASS_TYPE
    MODIFY NO VARCHAR2(10)
    MODIFY NAME VARCHAR(20);
    

/*

6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 
각 각 TB_ 를 제외핚 테이블 이름이 앞에
붙은 형태로 변경핚다.
(ex. CATEGORY_NAME)

*/

ALTER TABLE TB_CATEGORY
    RENAME COLUMN NAME TO CATEGORY_NAME;
    
    
    

ALTER TABLE TB_CATEGORY
    RENAME COLUMN USE_YN TO CATEGORY_USE_YN;    
    

/*

7. TB_CATAGORY 테이블과 TB_CLASS_TYPE 
테이블의 PRIMARY KEY 이름을 다음과 같이
변경하시오.
Primary Key 의 이름은 ?PK_ + 컬럼이름?으로 
지정하시오. (ex. PK_CATEGORY_NAME )

*/

ALTER TABLE TB_CATEGORY
    RENAME CONSTRAINT NAME_PK TO PK_CATEGORY_NAME;
    
ALTER TABLE TB_CLASS_TYPE
    RENAME CONSTRAINT SYS_C007230 TO PK_CLASS_TYPE_NO;
    
/*

8. 다음과 같은 INSERT 문을 수행핚다.
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT;

*/
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT;

/*

9.TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모
값으로 참조하도록 FOREIGN KEY 를 지정하시오. 이 때 KEY 이름은
FK_테이블이름_컬럼이름으로 지정핚다. (ex. FK_DEPARTMENT_CATEGORY )

*/

CREATE TABLE TB_DEPARTMENT(
    CATEGORY VARCHAR2(20) CONSTRAINT FK_DEPARTMENT_CATEGORY REFERENCES TB_CATEGORY(CATEGORY_NAME)
);

/*

10. 춘 기술대학교 학생들의 정보맊이 포함되어 있는 학생일반정보 VIEW 를 맊들고자 핚다.
아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오.

뷰 이름
    VW_학생일반정보
컬럼
    학번  
    학생이름
    주소
*/

CREATE VIEW 'VW_학생일반정보'
AS (
SELECT
STUDENT_NO NUMBER,
STDUETN_NAME VARCHAR2(20),
ADDRESS VARCHAR2(30)
FROM 
);

/*

--15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강 신청이 몰려
--문제가 되고 있다. (2005~2009) 기준으로 수강인원이 가장 많았던 3 과목을 찾는 구문을
--작성해보시오.


*/


-- DML


-- 1. 과목유형 테이블(TB_CLASS_TYPE)에 아래와 같은 데이터를 입력하시오.
INSERT INTO TB_CLASS_TYPE
VALUES(01, '전공필수');

INSERT INTO TB_CLASS_TYPE 
VALUES(02, '전공선택');

INSERT INTO TB_CLASS_TYPE 
VALUES(03, '교양필수');

INSERT INTO TB_CLASS_TYPE 
VALUES(04, '교양선택');

INSERT INTO TB_CLASS_TYPE 
VALUES(05, '논문지도');

-- 2. 춘 기술대학교 학생들의 정보가 포함되어 있는 
-- 학생일반정보 테이블을 맊들고자 핚다.
-- 아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (서브쿼리를 이용하시오)

CREATE TABLE TB_학생일반정보(
    
    STUDENT_NO VARCHAR2(10),
    STUDENT_NAME VARCHAR2(40),
    STUDENT_ADDRESS VARCHAR2(200)
);

SELECT * FROM TB_학생일반정보;

DROP TABLE TB_학생일반정보;

SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT;

INSERT INTO TB_학생일반정보(
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT
);

/*

3. 국어국문학과 학생들의 정보맊이 포함되어 있는 학과정보 테이블을 맊들고자 핚다.
아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (힌트 : 방법은 다양함, 소신껏
작성하시오)

*/

SELECT STUDENT_NO, STUDENT_NAME, CONCAT('19',SUBSTR(STUDENT_SSN, 1, 2), PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '국어국문학과';


CREATE TABLE TB_국어국문학과(
    STUDENT_NO VARCHAR2(10),
    STUDENT_NAME VARCHAR2(40),
    STUDENT_BDAY VARCHAR2(10),
    PROFESSOR_NAME VARCHAR2(40)
);