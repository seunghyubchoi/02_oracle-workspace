----

/*
    DQL (QUERY 데이터 질의 언어) : SELECT

    DML (MANIPULATION 데이터 조작 언어) : (SELECT), INSERT, UPDATE, DELETE
    DDL (DEFINITION 데이터 정의 언어) : CREATE, ALTER, DROP
    DCL (CONTROL 데이터 제어 언어) : GRANT, REVOKE (COMMIT, ROLLBACK)
    
    TCL (TRANSACTION 트랜젝션 제어 언어) : COMMIT, ROLLBACK


    DML
    : DATA MANIPULATOIN LANGUAGE
    : 데이터 조작 언어
    : 테이블에 값을 삽입(INSERT)
                    수정(UPDATE)
                    삭제(DELETE) 하는 구문
*/

/*
    1. INSERT
        테이블에 새로운 행을 추가하는 구문
        
        [표현식]
        1. INSERT INTO 테이블명 VALUES(값1, 값2..)
            테이블에 모든 컬럼에 대한 값을 직접 제시해서 한 행 INSERT 하고자 할 때 사용
            컬럼 순번을 지켜서 VALUES에 값을 나열해야됨
            
        부족하게 값을 제시했을 경우 => not enough values 오류!
        값을 더 많이 제시했을 경우 => too many values 오류
*/

INSERT INTO EMPLOYEE
VALUES(900, '차은우', '900101-1234567', 'cha_00@kh.or.kr', '01011112222',
        'D1', 'J7', 'S3', 4000000, 0.2, 200, SYSDATE, NULL, DEFAULT);

/*
    2. INSERT INTO 테이블명(컬럼명1, 컬럼명2..) VALUES(값1, 값2..)
        테이블에 내가 선택한 컬럼에 대한 값만 INSERT 할 때 사용
        선택이 안된 컬럼은 기본적으로는 NULL이 들어감
        => NOT NULL 제약조건이 걸려있는 컬럼은 반드시 선택해서 직접 값을 제시해야됨!!
        단, DEFAULT 값이 있는 경우는 NULL이 아닌 DEFAULT값 들어간다
*/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES(901, '주지훈', '880202-1111111', 'J2', 'S2', SYSDATE);
-- ENT_YN은 디폴트 값으로 들어가 있음!!
-- 가독성 안 좋은 예시


INSERT 
    INTO EMPLOYEE
        (
              EMP_ID
            , EMP_NAME
            , EMP_NO
            , JOB_CODE
            , SAL_LEVEL
            , HIRE_DATE
        )
    VALUES
        (
               901
            , '주지훈'
            , '880202-1111111'
            , 'J2'
            , 'S2'
            , SYSDATE
        );

SELECT * FROM EMPLOYEE;

/*
    3. INSERT INTO 테이블명 (서브쿼리)
        VALUES로 값, 직접 명시하는 것 대신에
        서브쿼리로 조회된 결과 값을 통째로 INSERT 가능
        = (여러 행 INSERT 가능)
*/

CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_TITLE VARCHAR2(20)    
);

SELECT * FROM EMP_01;
-- 전체 사원들의 사번, 이름, 부서명 조회
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE);

INSERT INTO EMP_01 (
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
);

SELECT * FROM EMP_01;

INSERT 
INTO EMP_01
    (
      EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    ) 
VALUES
    (
    888,'피카츄','호박부서'
    );
    
CREATE TABLE EMP_02(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    EMP_NO VARCHAR2(20),
    DEPT_CODE VARCHAR2(20),
    JOB_CODE VARCHAR2(20),
    LOCAL_NAME VARCHAR2(20)
);

DROP TABLE EMP_02;

INSERT INTO EMP_02(
SELECT EMP_ID, EMP_NAME, EMP_NO, DEPT_CODE, JOB_CODE, LOCAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
);

SELECT * FROM EMP_02;

/*
    [표현식]
    INSERT ALL
    INTO 테이블명1 VALUES(컬럼명, 컬럼명..)
    INTO 테이블명2 VALUES(컬럼명, 컬럼명..)
    서브쿼리;
*/

-- 테스트할 테이블 만들기
-- 구조만 베끼기
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM EMPLOYEE
    WHERE 1=0;
    
SELECT * FROM EMP_DEPT;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE 1=0;
    
SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

-- 부서코드가 'D1'인 사원들의 사번, 이름, 부서코드 , 입사일, 사수사번 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

INSERT ALL
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';


