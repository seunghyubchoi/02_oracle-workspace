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