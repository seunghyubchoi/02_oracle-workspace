--
/*
    < GROUP BY 절 >
    그룹 기준을 제시할 수 있는 구문
    (해당 그룹 기준별로 여러 그룹을 묶을 수 있음)
    여러 개의 값들을 하나의 그룹으로 묶어서 처리할 목적으로 사용
*/
SELECT SUM(SALARY)
FROM EMPLOYEE; -- 전체 사원을 하나의 그룹으로 묶어서 총합을 구한 결과

-- 각 부서별 총 급여 합
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 사원 수
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 실행 순서
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

-- FROM => GROUP BY => SELECT => ORDER BY

SELECT JOB_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

SELECT BONUS, COUNT(*)
FROM EMPLOYEE
GROUP BY BONUS;


-- COUNT(BONUS) : 특정 직급에서 보너스 받는 사원 수 
-- 각 직급별로 총 사원 수, 보너스를 받는 사원 수, 급여 합, 평균 급여, 최저 급여, 최대 급여
SELECT JOB_CODE AS "직급", COUNT(*) || '명' AS "총 사원 수", COUNT(BONUS) || '명'  AS "보받수", TO_CHAR(SUM(SALARY), 'L99,999,999') AS "합", TO_CHAR(ROUND(AVG(SALARY)), 'L9,999,999') AS "평균", TO_CHAR(MIN(SALARY), 'L9,999,999') AS "최저", TO_CHAR(MAX(SALARY), 'L9,999,999') AS "최대"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

SELECT DEPT_CODE AS "직급", COUNT(*) || '명' AS "총 사원 수", COUNT(BONUS) || '명'  AS "보받수", TO_CHAR(SUM(SALARY), 'L99,999,999') AS "합", TO_CHAR(ROUND(AVG(SALARY)), 'L9,999,999') AS "평균", TO_CHAR(MIN(SALARY), 'L9,999,999') AS "최저", TO_CHAR(MAX(SALARY), 'L9,999,999') AS "최대"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- 사원 성별의 따른 수
-- GROUP BY 절에 함수식 기술이 가능
SELECT DECODE(SUBSTR(EMP_NO, 8,1), 1, '남자', 2, '여자') AS "성별", COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8,1);

-- GROUP BY 절에 여러 컬럼 기술 가능
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;

---------------------------------------------------------------------------------
/*
    < HAVING 절 >
    그룹에 대한 조건을 제시할 때 사용되는 구문
    (주로 그룹 함수식을 가지고 조건을 제시할 때 사용)
*/
-- 각 부서별 평균 급여 조회(부서코드, 평균 급여)
SELECT DEPT_CODE AS "부서", TO_CHAR(TRUNC(AVG(SALARY)), 'L9,999,999') AS "평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;


-- 부서별로 평균 급여가 삼백 만원 이상인 부서들만 조회
SELECT DEPT_CODE AS "부서", TO_CHAR(TRUNC(AVG(SALARY)), 'L9,999,999') AS "평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE

-- WHERE 절에는 "그룹함수" 가지고 조건제시 불가
HAVING AVG(SALARY) >= 3000000 

ORDER BY 1;



-- 직급별 총 급여합 (단, 직급별 급여 합이 천만원 이상인 직급만 조회), 직급코드, 급여합
SELECT JOB_CODE || '부' AS "부서", TO_CHAR(SUM(SALARY), 'L99,999,999') || '보노' AS "합"
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000
ORDER BY 1 DESC;

-- 부서별로 보너스를 받는 사원이 없는 부서만을 조회 부서코드만 나오게 해보셈
SELECT DEPT_CODE -- COUNT(BONUS)를 SELECT에 먼저 찍어봤어야 함
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0; -- COUNT는 숫자니까 숫자를 적기


------------------------------------------------------------------------------
/*
    < SELECT문 실행 순서 >
    5 SELECT * | 조회하고자 하는 컬럼 별칭 | 산술식 "별칭" | 함수식 AS "별칭"
    1 FROM 조회하고자 하는 테이블명
    2 WHERE 조건식 (연산자를 가지고 기술)
    3 GROUP BY 그룹기준으로 삼을 컬럼 || 함수식
    4 HAVING 조건식 (그룹함수를 가지고 기술) 그룹에 대한 조건
    6 ORDER BY 컬럼명|별칭|순서숫자 [ASC|DESC|NULLS FIRST| NULLS LAST]
    
    
    -- 선생님이 하시는 방법
    -- 1. FROM 적어주고
    -- 2. GROUP BY  묶어주고 
    -- 3. SELECT 채워 줌~!!
    -- 4. 정리할꺼면 ORDER BY
*/

/*
    < 집계함수 >
    그룹별 산출된 결과값에 중간집계를 계산해주는 함수
    
    ROLLUP 
    = > GROUP BY 절에 기술하는 함수
    
*/
-- 각 직급 별 급여 합
-- 마지막 행으로 전체 총  급여합까지 같이 조회하고 싶을 때
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY 1;
-- ROLLUP : GROUP BY를 통해 묶은 그룹의 중간 집계를 계산해주는 함수

-----------------------------------------------------------------------------

/*
    < 집합 연산자 == SET OPERATION >
    
    여러 개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자
    
    UNION     : OR : 합집합 = 두 쿼리문 수행한 결과값을 더한 후 중복되는 값은 한번만 더해지도록
    INTERSECT : AND : 교집합 = 두 쿼리문 수행한 결과값의 중복된 결과 값
    UNION ALL : 합집합 + 교집합 = 중복되는 부분이 두번 표현될 수 있음
    MINUS     : 차집합 = 선행 결과 값에서 후행 결과값을 뺀 나머지
*/

-- 1. UNION
-- 부서코드가 D5인 사원 또는 급여가 3백만원 초과인 사원들 조회
-- 사번, 이름, 부서코드, 급여

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6개행(박나라 하이유 김해술 심봉선 윤은해 대북혼)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 8개행(선동일 송종기 노옹철 유재식 정중하 *심봉선* *대북혼* 전지연)
-- 각각 6개 8개지만 UNION은 중복 값 한 번만 더해줘서 12개

    -- 위와 같은 쿼리문
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' OR  SALARY > 3000000;


-- 2.INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 중복값만 출력하는 INTERSECT

    -- 위와 같은 쿼리문
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' AND SALARY > 3000000;
    
-----------------------------------------------------------------------
-- 집합 연산자 유의사항

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6개행(박나라 하이유 김해술 심봉선 윤은해 대북혼)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 각 쿼리문의 SELECT 절에 작성되어 있는 "컬럼 개수"가 동일해야 함

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6개행(박나라 하이유 김해술 심봉선 윤은해 대북혼)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY -- HIRE_DATE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 각 쿼리문의 SELECT 절에 작성되어 있는 "컬럼 타입"이 동일해야 함

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6개행(박나라 하이유 김해술 심봉선 윤은해 대북혼)
-- ORDER BY EMP_NAME
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;
-- ORDER BY는 항상 가장 아래에 표기

-----------------------------------------------------------------------------
-- 3. UNION ALL : 여러개의 쿼리 결과를 무조건 다 더하는 연산자 (중복값 있음)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 중복값 포함
-----------------------------------------------------------------------------
-- 4. MINUS : 선행 SELECT 결과에서 후행 SELECT 결과를 뺀 나머지(차집합)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 'D5'인 사람들 중에서 SALARY가 3000000 넘는 사람들만 빼줌

-- 위 쿼리와 동일
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY < 3000000;


