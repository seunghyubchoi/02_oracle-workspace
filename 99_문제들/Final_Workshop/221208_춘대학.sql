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
    RENAME CONSTRAINT SYS_C007121 TO PK_CLASS_TYPE_NO;
    
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

SELECT * FROM TB_DEPARTMENT;


ALTER TABLE TB_DEPARTMENT
    ADD CONSTRAINT FK_DEPARTMENT_CATEGORY 
    FOREIGN KEY(CATEGORY)  
    REFERENCES TB_CATEGORY(CATEGORY_NAME);
    
    
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

CREATE OR REPLACE VIEW VW_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT;


/*
11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행핚다.
이를 위해 사용핛 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 맊드시오.
이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT
맊을 핛 경우 학과별로 정렬되어 화면에 보여지게 맊드시오.)
뷰 이름
VW_지도면담
컬럼
학생이름
학과이름
지도교수이름
*/

CREATE OR REPLACE VIEW VW_지도면담
AS SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
   FROM TB_STUDENT
   JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
   LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
   ORDER BY 2;
   

SELECT * FROM VW_지도면담;


/*
12. 모든 학과의 학과별 학생 수를 확인핛 수 있도록 적젃핚 VIEW 를 작성해 보자.
뷰 이름
VW_학과별학생수
컬럼
DEPARTMENT_NAME
STUDENT_COUNT

25
*/



CREATE OR REPLACE VIEW VW_학과별학생수
AS SELECT DEPARTMENT_NAME, COUNT(STUDENT_NAME) AS "STUDENT_COUNT"
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING (DEPARTMENT_NO)
GROUP BY DEPARTMENT_NAME;

SELECT * FROM VW_학과별학생수;


/*
13. 위에서 생성핚 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인
이름으로 변경하는 SQL 문을 작성하시오.
*/

UPDATE VW_학생일반정보
SET STUDENT_NAME = '최승협'
WHERE STUDENT_NO = 'A213046';

SELECT STUDENT_NAME FROM VW_학생일반정보
WHERE STUDENT_NO = 'A213046';


/*
14. 13 번에서와 같이 VIEW 를 통해서 데이터가 변경될 수 있는 상황을 막으려면 VIEW 를
어떻게 생성해야 하는지 작성하시오.
*/

-- 뷰 생성시 WITH READ ONLY를 덧붙힌다
CREATE OR REPLACE VIEW VW_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WITH READ ONLY;

/*
15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강 신청이 몰려
문제가 되고 있다. (2005~2009) 기준으로 수강인원이 가장 많았던 3 과목을 찾는 구문을
작성해보시오.
과목번호 과목이름 누적수강생수(명)
---------- ------------------------------ ----------------
C1753800 서어방언학 29
C1753400 서어문체롞 23
C2454000 원예작물번식학특롞 22
*/    
    

SELECT 과목번호, 과목이름, 누적수강생수
FROM (
SELECT C.CLASS_NO 과목번호, C.CLASS_NAME 과목이름, COUNT(S.STUDENT_NO) 누적수강생수
FROM TB_STUDENT S, TB_CLASS C, TB_GRADE G
WHERE S.STUDENT_NO = G.STUDENT_NO
AND G.CLASS_NO = C.CLASS_NO
AND EXTRACT(YEAR FROM (TO_DATE(G.TERM_NO,'YYYYMM'))) BETWEEN 2005 AND 2009
GROUP BY C.CLASS_NO, C.CLASS_NAME
ORDER BY 3 DESC)
WHERE ROWNUM <= 3;

SELECT C.CLASS_NO, C.CLASS_NAME, COUNT(S.STUDENT_NO)
FROM TB_STUDENT S, TB_CLASS C, TB_GRADE G
WHERE S.STUDENT_NO = G.STUDENT_NO
AND G.CLASS_NO = C.CLASS_NO
AND EXTRACT(YEAR FROM (TO_DATE(G.TERM_NO,'YYYYMM'))) BETWEEN 2005 AND 2009
GROUP BY C.CLASS_NO, C.CLASS_NAME
ORDER BY 3 DESC;

SELECT V.과목번호
     , V.과목이름
     , V."누적수강생수(명)"
  FROM (SELECT C.CLASS_NO 과목번호
             , C.CLASS_NAME 과목이름
             , COUNT(*) "누적수강생수(명)"
          FROM TB_CLASS C
          JOIN TB_GRADE G ON(C.CLASS_NO = G.CLASS_NO)
         WHERE SUBSTR(G.TERM_NO, 1, 4) IN ('2005', '2006', '2007', '2008', '2009')
         GROUP BY C.CLASS_NO, C.CLASS_NAME
         ORDER BY 3 DESC) V
 WHERE ROWNUM < 4;


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

CREATE TABLE TB_학생일반정보
AS SELECT
    STUDENT_NO, 
    STUDENT_NAME, 
    STUDENT_ADDRESS
FROM TB_STUDENT;


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

CREATE TABLE TB_국어국문학과
AS 
SELECT STUDENT_NO 학번, STUDENT_NAME 학생이름, 
CONCAT('19',SUBSTR(STUDENT_SSN, 1,2)) 출생년도, PROFESSOR_NAME 교수이름
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
LEFT JOIN TB_PROFESSOR ON (PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE DEPARTMENT_NAME = '국어국문학과';



--4. 현 학과들의 정원을 10% 증가시키게 되었다. 
--이에 사용핛 SQL 문을 작성하시오. (단,
--반올림을 사용하여 소수점 자릿수는 생기지 않도록 핚다)

UPDATE TB_DEPARTMENT
SET CAPACITY = ROUND(CAPACITY * 1.1, 0);


--5. 학번 A413042 인 박건우 학생의 주소가 
--"서울시 종로구 숭인동 181-21 "로 변경되었다고핚다. 
--주소지를 정정하기 위해 사용핛 SQL 문을 작성하시오.
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
WHERE STUDENT_NO = 'A413042';


--6. 주민등록번호 보호법에 따라 
--학생정보 테이블에서 주민번호 뒷자리를 저장하지 않기로
--결정하였다. 이 내용을 반영핛 적젃핚 SQL 문장을 작성하시오.
--(예. 830530-2124663 ==> 830530 )
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);


--7. 의학과 김명훈 학생은 
--2005 년 1 학기에 자신이 수강핚 '피부생리학' 점수가
--잘못되었다는 것을 발견하고는 정정을 요청하였다. 
--담당 교수의 확인 받은 결과 해당 과목의 
--학점을 3.5 로 변경키로 결정되었다. 적젃핚 SQL 문을 작성하시오.

UPDATE TB_GRADE 
-- TERM_NO, STUDENT_NO, CLASS_NO, POINT 중 
-- JOIN 가능한 다른 테이블과 연관된 요소로 WHERE 잡기
SET POINT = 3.5 -- 1.5
WHERE (TERM_NO, STUDENT_NO) =
(
SELECT TERM_NO, STUDENT_NO
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_GRADE G USING(STUDENT_NO)
JOIN TB_CLASS C ON(C.CLASS_NO = G.CLASS_NO)
WHERE STUDENT_NAME = '김명훈'
AND DEPARTMENT_NAME = '의학과'
AND TERM_NO = 200501
);
ROLLBACK;

--8. 성적 테이블(TB_GRADE) 에서 휴학생들의 성적항목을 제거하시오.

DELETE FROM TB_GRADE G
WHERE POINT IN (
                SELECT POINT
                FROM TB_STUDENT S
                WHERE S.STUDENT_NO = G.STUDENT_NO
                AND ABSENCE_YN = 'Y'          
);
ROLLBACK;  
    

);