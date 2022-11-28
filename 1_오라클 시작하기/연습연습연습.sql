/*
    < 함수 FUNCTION >
    전달된 컬럼값을 읽어들여서 함수를 실행한 결과를 반환 함
    
    - 단일행 함수 : N개의 값을 일어들여서 'N'개의 결과값을 리턴
                    (매 행마다 함수 실행 결과 반환)
                    
    - 그룹 함수 : N개의 값을 읽어들여서 '1'개의 결과 값을 리턴
                    (그룹을 지어 그룹 별로 함수 실행 결과 반환)
                    
    >> SELECT 절에 단일행 함수랑 그룹 함수를 함께 사용 못 함
    >> 왜? 결과행의 개수가 다르기 때문
    
    >> 함수식을 기술할 수 있는 위치 : SELECT절, WHERE절, ORDER BY절, GROUP BY절, HAVING절
    
*/

/*
    < 문자 처리 함수 >
    LENGTH / LENGTHB => 결과값 NUMBER 타입
    
    LENGTH(컬럼|'문자열값'): 해당 문자열 값의 글자수 반환
    LENGTHB(컬럼|'문자열값'): 해당 문자열 값의 바이트수 반환
    
    '김', '나', 'ㄱ' : 한글자당 3바이트 김시연 = 9바이트
    영문자, 숫자, 특문 : 한글자당 1바이트
    
    
*/

SELECT SYSDATE FROM DUAL;

SELECT LENGTH('오라클'), LENGTHB('오라클') FROM DUAL;
SELECT LENGTH('oracle'), LENGTHB('oracle') FROM DUAL;
SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;
-- 매 행마다 다 실행되고 있는 함수를 단일행 함수라고 한다

/*
    INSTR : 문자열로부터 특정 문자의 시작 위치를 찾아서 반환
    
    INSTR (컬럼|'문자열', '찾고자하는 문자', ['찾을 위치의 시작 값', [순번]])
    = 결과 값은 NUBER 타입
    
    찾을 위치의 시작 값
    1: 앞에서부터 찾겠다.
    -1 : 뒤에서부터 찾겠다.
    
*/

SELECT INSTR('AABAACAABBAA','B') FROM DUAL;
SELECT INSTR('AABAACAABBAA','B',1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;
-- 뒤에서 처음 나오는 B를 왼쪽에서부터 세서 10이 나옴
SELECT INSTR('방가방갑룽룽방갈웅', '방', 1,2) FROM DUAL;
SELECT INSTR('방가방가햄토리우리친구햄토리', '리', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1,1) AS "_위치", INSTR(EMAIL, '@') AS "골뱅이 위치" FROM EMPLOYEE;


SELECT SUBSTR('방가방가햄토리우리친구햄토리', 6) FROM DUAL;
SELECT SUBSTR('방가방가햄토리우리친구햄토리', 5,2) FROM DUAL;
SELECT SUBSTR('방가방가햄토리우리친구햄토리', 1,7) FROM DUAL;
SELECT SUBSTR('방가방가햄토리우리친구햄토리', -7, 6) FROM DUAL;

SELECT EMP_NAME, SUBSTR(EMP_NO, 1,8), SUBSTR(EMP_NO, 8,1) AS "성별"
FROM EMPLOYEE;


    -- 여자 사원들만 조회
    SELECT EMP_NAME
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) = '2';

    -- 남자 사원들만 조회
    SELECT EMP_NAME
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) = '1';

    -- 함수 중첩 사용
    SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1)
    FROM EMPLOYEE;
    
    
     -- 20만큼의 길이 중 EMAIL 컬럼 값은 오른쪽으로 정렬, 나머지 공백으로 채움
     SELECT EMP_NAME, LPAD(EMAIL, 20)
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
     FROM EMPLOYEE;
     
     
----------------------------------------------------------------------------------

    -- ROUND
    SELECT ROUND(123.456, 1) FROM DUAL;
    
    SELECT ROUND(123.456, -1) FROM DUAL;

    -- CEIL
    SELECT CEIL(123.456) FROM DUAL;
    SELECT CEIL(0.9) FROM DUAL;
    
    -- FLOOR
    SELECT FLOOR(123.456) FROM DUAL;
    SELECT CEIL(0.9) FROM DUAL;
    SELECT CEIL(-1.5) FROM DUAL;
    
    - TRUNC
    SELECT TRUNC(123.456) FROM DUAL;
    SELECT TRUNC(123.456, 1) FROM DUAL;
    SELECT TRUNC(123.456, 2) FROM DUAL;
    SELECT TRUNC(0.9) FROM DUAL;
    
    SELECT SYSDATE FROM DUAL;
    
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) FROM EMPLOYEE;
    
    SELECT ADD_MONTHS(SYSDATE,6) FROM DUAL;
    
    SELECT EMP_NAME, ADD_MONTHS(HIRE_DATE, 6) FROM EMPLOYEE;
    
    SELECT NEXT_DAY(SYSDATE, '금요일') FROM DUAL;
    
    SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL;
    
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    
    SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), (LAST_DAY(HIRE_DATE) - HIRE_DATE)
    FROM EMPLOYEE;
    
    SELECT EMP_NAME, HIRE_DATE, EXTRACT(YEAR FROM HIRE_DATE) AS "입사년도", EXTRACT(MONTH FROM HIRE_DATE) AS "입사월", EXTRACT(DAY FROM HIRE_DATE) AS "입사일"
    FROM EMPLOYEE
    ORDER BY 2;
    
    
--------------------------------------------------------------------------------

    SELECT TO_CHAR(1234) FROM DUAL;
    SELECT TO_CHAR(1234, '99999') FROM DUAL;
    SELECT TO_CHAR(1234, '00000') FROM DUAL;
    SELECT TO_CHAR(1234, 'L99999') FROM DUAL;
    SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;
    SELECT TO_CHAR(SALARY, 'L999,999,999') FROM EMPLOYEE;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH:MI:SS') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL;
    
    SELECT TO_CHAR(HIRE_DATE, 'YYYY"년" MM"월" DD"일" DY"요일"') FROM EMPLOYEE;
    
    SELECT TO_CHAR(-123, '0000') FROM DUAL;
    
    SELECT TO_DATE(20100101) FROM DUAL;
    
    SELECT TO_DATE('070101') FROM DUAL;
    
    SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'DL') FROM DUAL;
    
    SELECT TO_CHAR