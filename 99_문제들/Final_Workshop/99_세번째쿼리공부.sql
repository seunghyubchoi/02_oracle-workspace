-- QUIZ1
-- CREATE USER TEST IDENTIFIED 1234; 실행
-- USER TEST이(가) 생성 됐습니다.
-- 계정 생성만 하고 접속 => 에러!!

-- 왜 오류가 났는지?
-- 문제점 :  계정생성만 했고, 접속권한을 부여하지 않았기 때문에
-- 조치된 쿼리문 : GRANT CONNECT, RESOURCE TO TEST;

-- QUIZ2
CREATE TABLE TB_JOB(
    JOBCODE NUMBER PRIMARY KEY,
    JOBNAME VARCHAR2(10) NOT NULL
);

CREATE TABLE TB_EMP(
    EMPNO NUMBER PRIMARY KEY,
    EMPNAME VARCHAR2(10) NOT NULL,
    JOBNO NUMBER REFERENCES TB_JOB(JOBCODE)
);

-- 위의 두 테이블이 있다는 가정하에
-- 두 테이블을 조인해서 EMPNO, EMPNAME, JOBNO, JOBNAME 컬럼을 조회할 것
-- 이 때 실행한 SQL문
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
JOIN TB_JOB USING (JOBNO);
-- 실행했더니 에러 발생
-- ORA-00904: "TB_JOB"."JOBNO": invalid identifier
-- 문제점 : JOBNO 컬럼이 TB_EMP에는 존재하지만 TB_JOB에는 존재하지 않기 때문에 USING 구문 안 됨
-- 해결내용 : UYSING(JOBNO)이 아니라 ON 절 (JOBNO=JOBCODE)을 사용한다
-- 조치한 쿼리 : 
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
JOIN TB_JOB ON (JOBCODE=JOBNO);

-- 테이블 생성 관련 데이터 타입 (CHAR, VARCHAR2 차이점)
-- 오라클 객체 관련 문제 (SEQUENCE, VIEW .. ) 각각 무엇인지 정의에 관하여
-- 제약조건 => 뒤늦게 제약조건을 추가할 수 있는 ALTER 문 작성
-- DCL? = GRANT, REVOKE
-- COMMIT? ROLLBACK?

-- QUIZ3 (JOIN 복습)

-- 아래의 SQL 구문은 부서별 월급합계가 15,000,000을 초과하는 부서를 조회한 것이다
-- 그 결과가 올바르지 않다고 할 때 그 원인과 조치사항
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
WHERE SALARY > 15000000
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, SUM(SALARY) -- SUM 나오면 HAVING을 써보세요
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 15000000;

-- QUIZ4 제약조건
CREATE TABLE QUIZ4(
    QNO NUMBER PRIMARY KEY,
    QNAME VARCHAR2(10),
    SCORE NUMBER
);

INSERT INTO QUIZ4 VALUES(1, '퀴즈1번', 30);
INSERT INTO QUIZ4 VALUES(1, '퀴즈2번', 35); -- 안 되는 이유? = QNO가 PRIMARY KEY로 설정되어 있기 때문 

-- JOIN => DECODE
-- J7인 사원은 급여를 10% 인상
-- J6인 사원은 급여를 15% 인상

--'21/09/28' 문자열을 '2021-09-28'로 바꾸는 방법
--'210908'을 2021년 9월 8일로 바꾸는 방법

-- 초급개발자, 중급개발자, 고급개발자
-- CASE WHEN 
