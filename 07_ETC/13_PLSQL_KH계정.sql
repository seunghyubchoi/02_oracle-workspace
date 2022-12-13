-- 후덜덜한 개념
/*
    < PL / SQL >
    PROCEDURE LANGUAGE EXTENTION TO SQL
    (프로시져 머시기 하면 이거라고 알면 됨)
    
    오라클 자체에 내장 되어 있는 절차적언어
    절차적언어 : 위에서 아래로 떨어지는 언어
    오라클 자체에도 위에서 아래로 떨어지는 머가 있는 것
    
    왜 쓰나요
    SQL 문장 내에서 변수의 정의, 조건처리(IF), 반복처리(LOOP, WHILE, FOR) 등을 지원하여
    SQL의 단점을 보완한다
    
    다수의 SQL문을 한 번에 실행 가능(BLOCK 구조) + 예외처리도 가능
    
    * PL/SQL 구조
    크게 3가지로 나눌 수 있음
    - [선언부] : DECLARE로 시작한다, 변수나 상수 선언 및 초기화
    - 실행부 : BEGIN으로 시작, 무조건 있어야 함!! = SQL문 또는 제어문(조건문, 반복문) 등의 로직을 기술하는 부분
    - [예외처리부] 
    : EXCEPTION으로 시작, 예외발생시 해결하기 위한 구문을 미리 기술해둘 수 있는 구문
    
*/

-- 간단하게 화면에 HELLO ORACLE 출력!

SET SERVEROUTPUT ON;

BEGIN
    -- System.out.println("HELLO ORACLE");
    DBMS_OUTPUT.PUT_LINE('HELLO ORACLE');
END;
/

/*
    1. DECLARE 선언부
    변수 및 상수 선언하는 공간 (선언과 동시에 초기화도 가능)
    일반타입변수, 레퍼런스타입변수, ROW타입변수
    
    1_1) 일반타입 변수 선언 및 초기화 방법
        [표현식] 변수명 [CONSTANT] 자료형 [:= 값] (자바에서는 초기화 방법이 = 값)
*/

DECLARE
    EID NUMBER; -- 변수 선언만 한 것
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14; 
BEGIN
    -- EID := 800;
    -- ENAME := '피차큐';
    
    EID := &번호;
    ENAME := '&이름'; -- 캐릭터형

    DBMS_OUTPUT.PUT_LINE('EID : '||EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : '||ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : '||PI);
END;
/
-------------------------------------------------------------------------------------

-- 1-2) 레퍼런스 타입 변수 선언 및 초기화
-- 어떤 테이블의 어떤 컬럼의 데이터 타입을 참조해서 그 타입으로 지정
-- [표현식] 변수명 테이블명,컬럼명%TYPE;

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE; -- 타입 불일치 방지
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    --EID := '300';
    --ENAME := '최등협';
    --SAL := 1000;
    
    
    -- 사번이 200번인 사원의 사번, 사원명, 급여 조회해서 각 변수에 대입
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO EID, ENAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    -- WHERE EMP_ID = 200;
    -- PL/SQL은 SELECT문을 이용하는 경우가 많음
    
    
    DBMS_OUTPUT.PUT_LINE('EID : '||EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : '||ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : '||SAL);
END;
/

-----------------------------------실습문제----------------------------------------------
/*
    레퍼런스타입 변수로 EID, ENAME, JCODE, SAL, DTITLE을 선언하고
    각 자료형이 EMPLOYEE, DEPARTMENT 테이블들을 참조하도록하고
    사용자가 입력한 사번의 사원의 사번, 사원명, 직급코드, 급여, 부서명 조회한 후 
    각 변수에 담아서 출력
*/

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
    
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
    INTO EID, ENAME, JCODE, SAL, DTITLE
    FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    --FROM EMPLOYEE E, DEPARTMENT D
    --WHERE E.DEPT_CODE = D.DEPT_ID
    WHERE EMP_ID = &사번;
    -- ':=' 는 값 데이터 입력 할 때만 사용함
    
    DBMS_OUTPUT.PUT_LINE('EID : '||EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : '||ENAME);
    DBMS_OUTPUT.PUT_LINE('JCODE : '||JCODE);
    DBMS_OUTPUT.PUT_LINE('SAL : '||SAL);
    DBMS_OUTPUT.PUT_LINE('DTITLE : '||DTITLE);
END;
/


---------------------------------------------------------------------------------------------------------

-- 1-3) ROW타입 변수 선언
-- 테이블의 한 행에 대한 모든 컬럼값을 한꺼번에 담을 수 있는 변수
-- [표현식] 변수명 테이블명%ROWTYPE;
DECLARE
    E EMPLOYEE%ROWTYPE; 
BEGIN
    SELECT * -- ROWTYPE이면 모든 컬럼에 해당하는 값을 넣어야함
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    -- DBMS_OUTPUT.PUT_LINE(E);
    DBMS_OUTPUT.PUT_LINE('사원명 : '||E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('급여 : '||E.SALARY);
    DBMS_OUTPUT.PUT_LINE('보너스 : '||NVL(E.BONUS,0));
    
    
END;
/

--------------------------------------------------------------------------------------------

/*

    2. BEGIN 실행부
    

*/

-- < 조건문 >
-- 1) IF 조건식 THEN 실행내용 END IF; (단독 IF문)

-- 2) 사번 입력 받은 후 해당 사원의 사번, 이름, 급여, 보너스율(%) 출력
-- 단, 보너스를 받지 않는 사원은 보너스율 출력 전 '보너스를 지급받지 않는 사원입니다.' 출력

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
   SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS,0)
   INTO EID, ENAME, SALARY, BONUS
   FROM EMPLOYEE
   WHERE EMP_ID = &사번;
   
   DBMS_OUTPUT.PUT_LINE('사번 : '||EID);
   DBMS_OUTPUT.PUT_LINE('이름 : '||ENAME);
   DBMS_OUTPUT.PUT_LINE('급여 : '||SALARY);
   
   IF BONUS = 0 
        THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    END IF;
   
   DBMS_OUTPUT.PUT_LINE('보너스율 : '||BONUS*100||'%');
END;
/

-- 2.IF 조건식 THEN 실행내용 ELSE 실행내용 END IF; (IF-ELSE문)
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN
   SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS,0)
   INTO EID, ENAME, SALARY, BONUS
   FROM EMPLOYEE
   WHERE EMP_ID = &사번;
   
   DBMS_OUTPUT.PUT_LINE('사번 : '||EID);
   DBMS_OUTPUT.PUT_LINE('이름 : '||ENAME);
   DBMS_OUTPUT.PUT_LINE('급여 : '||SALARY);
   
    IF BONUS = 0 
        THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('보너스율 : '||BONUS*100||'%');
    END IF;   
END;
/


-----------------------------------실습문제----------------------------------------------
-- 레퍼런스타입의 변수 (EID,ENAME,DTITLE,NCODE)
-- 참조할 테이블 EMPLOYEE, DEPARTMENT, LOCATION
-- 일반타입변수 (TEAM 문자형(10) <= 이따가 '국내팀' 또는 '해외팀'을 담을 예정)
-- 사용자가 입력한 사번의 사원의 사번, 이름, 부서명, 근무국가코드 조회 후 각 변수에 대입
-- NODE의 값이 KO일 경우, TEAM에 '국내팀', KO가 아닐 경우 TEAM에 '해외팀' 입력
-- 사번, 이름, 부서, 소속(국내팀, 해외팀)에 대해 출력

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NCODE LOCATION.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
BEGIN
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
    INTO EID, ENAME, DTITLE, NCODE
    FROM EMPLOYEE E, DEPARTMENT D, LOCATION L
    WHERE E.DEPT_CODE = D.DEPT_ID
    AND D.LOCATION_ID = L.LOCAL_CODE
    AND EMP_ID = &사번;
    
    IF NCODE ='KO'
        THEN TEAM := '국내팀';
    ELSE
        TEAM := '해외팀';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사번 : '||EID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||ENAME);
    DBMS_OUTPUT.PUT_LINE('부서 : '||DTITLE);
    DBMS_OUTPUT.PUT_LINE('근무국가코드 : '||NCODE);
    DBMS_OUTPUT.PUT_LINE('소속 : '||TEAM);

END;
/


-----------------------------------실습문제----------------------------------------------
-- 사원의 연봉을 구하는 PL/SQL 블럭 작성,
-- 보너스가 있는 사원은 보너스도 포함하여 계산
-- 보너스가 없으면 보너스 미포함 연봉
-- 보너스가 있으면 보너스 포함 연봉
-- 출력예시
-- 급여, 이름, (원)\999,999,999 
-- ROWTYPE
DECLARE
    E EMPLOYEE%ROWTYPE;
    YB EMPLOYEE.SALARY%TYPE;
BEGIN
    SELECT *
    INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    IF E.BONUS IS NULL
        THEN YB := E.SALARY * 12;
    ELSE
        YB := (E.SALARY + (E.SALARY * E.BONUS)) * 12;
    END IF;
   
    
    DBMS_OUTPUT.PUT_LINE(E.SALARY ||' '|| E.EMP_NAME||TO_CHAR(YB, '999,999,999L'));


END;
/



---------------------------------------------------------------------------------------------------------
-- 3) IF 조건식1 THEN 실행내용1 ELSIF 조건식2 THEN 실행내용 2 ELSE...END IF;
-- (IF - ELSEIF - ELSE 문)

-- 점수를 입력 받아 SCORE 변수에 저장
-- 90점 이상은 'A', 80점 이상 'B', 70점 이상 'C', 60점 이상 'D', 60점 미만은 'F'
-- GRADE 변수에 저장
-- '당신의 점수는 XX점이고, 학점은 X학점 입니다.'

DECLARE
    SCORE NUMBER;
    GRADE VARCHAR2(1);
BEGIN
    SCORE := &점수;
    IF SCORE >= 90 THEN GRADE := 'A';
    ELSIF SCORE >= 80 THEN GRADE := 'B';
    ELSIF SCORE >= 70 THEN GRADE := 'C';
    ELSIF SCORE >= 70 THEN GRADE := 'D';
    ELSE GRADE := 'F';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 ' || SCORE || '점이고, 학점은 ' || GRADE || '학점입니다.');
END;
/

-- 급여
-- 500만원 이상이면 '고급'
-- 300만원 이상이면 '중급'
-- 300만원 미만이면 '초급'
-- 해당 사원의 급여등급은 XX입니다

DECLARE
    SAL EMPLOYEE.SALARY%TYPE;
    GRADE VARCHAR2(10); -- 급여등급
BEGIN
    SELECT SALARY
    INTO SAL
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    IF SAL >= 5000000 THEN GRADE := '고급';
    ELSIF SAL >= 3000000 THEN GRADE := '중급';
    ELSE GRADE := '초급';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('해당 사원의 급여 등급은 '|| GRADE|| '입니다');
END;
/
---------------------------------------------------------------------------------------------------------
-- 4) CASE 비교 대상자 WHEN 동등비교할값1 THEN 결과값1 WHEN 비교값2 THEN 결과값2...ELSE 결과값 END;

DECLARE
    EMP EMPLOYEE%ROWTYPE;
    DNAME VARCHAR2(30); -- 부서명 보관하는 변수
BEGIN
    SELECT *
    INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    DNAME := CASE EMP.DEPT_CODE
                WHEN 'D1' THEN '인사팀'
                WHEN 'D2' THEN '회계팀'
                WHEN 'D3' THEN '마케팅팀'
                WHEN 'D4' THEN '국내영업팀'
                WHEN 'D9' THEN '총무팀'
                ELSE '해외영업팀'
            END;
        DBMS_OUTPUT.PUT_LINE(EMP.EMP_NAME || '은(는)' || DNAME || '입니다.');
END;
/


SET SERVEROUTPUT ON;


-- < 반복문 >
/*
    1. BASIC LOOP문 
    
    [표현식]
    LOOP
        반복적으로 실행할 구문
        * 반복문을 빠져나갈 수 있는 구문 
    END LOOP;
    
    * 반복문을 빠져나갈 수 있는 구문(2가지)
    1. IF 조건식 THEN EXIT;
    2. EXIT WHEN 조건식;
    
*/

-- 1~5까지 순차적으로 1씩 증가해서 출력
DECLARE
    I NUMBER := 1;
BEGIN 
    LOOP 
        DBMS_OUTPUT.PUT_LINE(I);
        I := I+1;
        -- IF I = 6 THEN EXIT;
        -- END IF;
        EXIT WHEN I =6;
    END LOOP;
END;
/

---------------------------------------------------------------------------------
/*
    2. FOR LOOP문 
    
    [표현식]
    FOR 변수 IN [REVERSE] 초기값..최종값  => REVERSE = 값을 점점 작아지게 하고 싶을시
    LOOP
        반복적으로 실행할 구문
    END LOOP;
*/

BEGIN
    FOR I  IN 1..5
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/


BEGIN
    FOR I IN REVERSE 1..5
    LOOP
    DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

SELECT * FROM TEST;



CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE 
);


CREATE SEQUENCE SEQ_TNO
START WITH 1
INCREMENT BY 2
MAXVALUE 1000
NOCYCLE
NOCACHE;

BEGIN
    FOR I IN 1..100 -- 기본적으로는 1씩 증가
    LOOP
        INSERT INTO TEST VALUES(SEQ_TNO.NEXTVAL, SYSDATE);
    END LOOP;
END;
/

SELECT * FROM TEST;

----------------------------------------------------------------------------------
/*
    3. WHILE LOOP문
    [표현식]
    WHILE 반복문이 수행될 조건
    LOOP
        반복적으로 실행할 구문
        
    END LOOP;
*/
DECLARE
    I NUMBER := 1;
BEGIN
    WHILE I < 6
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I +1 ;
    END LOOP;
END;
/

----------------------------------------------------------------------------------
/*
    3. 예외처리부
    
    예외(EXCEPTION) : 실행 중 발생하는 오류
    
    [표현식]
    EXCEPTION 
        WHEN 예외명1 THEN 예외처리구문1;
        WHEN 예외명2 THEN 예외처리구문2;
        ...............
        WHEN OTHERS THEN 예외처리구문N;
        
        -- OTHERS는 예외 부모
        
        # 예외명에 뭘 써야할까?
        - 시스템 예외(오라클에서 미리 정의해둔 예외)
        1. NO_DATA_FOUND : SELECT 한 결과가 한 행도 없을 경우 
        2. TOO_MANY_ROWS : SELECT 한 결과가 여러 행일 경우
        3. ZERO_DIVIDE   : 0으로 나눌 때 발생하는 에러
        4. DUP_VAL_ON_INDEX : UNIQUE 제약조건에 위배 됐을 경우
        
*/

-- 사용자가 입력한 수로 나눗셈 연산한 결과 출력 
DECLARE
    RESULT NUMBER;
BEGIN
    RESULT := 10 / &숫자;
    DBMS_OUTPUT.PUT_LINE('결과 : ' || RESULT);
EXCEPTION   
    -- WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('나누기 연산시 0으로 나눌 수 없습니다.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('나누기 연산시 0으로 나눌 수 없습니다.');
END;
/

-- UNIQUE 제약조건 위배
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = '&변경할사번'
    WHERE EMP_NAME = '노옹철';
    
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('이미 존재하는 사번입니다'); 
END;
/

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO EID, ENAME
    FROM EMPLOYEE
    WHERE MANAGER_ID = &사번;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || ENAME);


EXCEPTION
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('너무 많은 행이 조회됐습니다.');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('해당 사수를 가진 사원이 없습니다');
END;
/