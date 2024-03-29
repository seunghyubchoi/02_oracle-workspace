-- QUIZ 1
-- ROWNUM을 활용해서 급여가 가장 높은 5명을 조회하고 싶었으나 제대로 조회가 안됨
-- 이 때 작성된 SQL문은 :
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;

-- 문제점
-- 정렬이 되기 전에 5명으로 추려지고 ROWNUM의 순서가 뒤죽박죽임


-- 해결된 SQL
-- 인라인뷰를 사용
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;


SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT * FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;



-- QUIZ 2
-- 부서별 평균급여가 270만원을 초과하는 부서들에 대해
-- 부서코드, 부서별 총 급여 합, 부서별 평균 급여, 부서별 사원 수
-- 이때 작성된 SQL문이 아래와 같음
SELECT DEPT_CODE, SUM(SALARY) 총합, FLOOR(AVG(SALARY)) 평균, COUNT(*) 인원수
FROM EMPLOYEE
HAVING AVG(SALARY) > 2700000
GROUP BY DEPT_CODE
ORDER BY 1;

-- 문제점
-- 부서별 인원수가 다르게 출력
-- AVG(SALARY) 다름
-- SUM(SALARY) 다름

-- 해결된 SQL

SELECT DEPT_CODE, 총합, FLOOR(평균급여), 인원수
FROM (SELECT DEPT_CODE, SUM(SALARY) 총합 ,AVG(SALARY) AS "평균급여",COUNT(*) 인원수 
FROM EMPLOYEE 
GROUP BY DEPT_CODE
ORDER BY 1)
WHERE 평균급여 > 2700000;

-----선생님꺼
SELECT DEPT_CODE, 총합, FLOOR(평균급여), 인원수
FROM (SELECT DEPT_CODE,SUM(SALARY) 총합 ,AVG(SALARY) AS "평균급여",COUNT(*) 인원수 
FROM EMPLOYEE 
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 2700000
ORDER BY 1);

-- '21/09/28'와 같은 문자열을 가지고 '2020-09-28'로 표현해보기
-- TO_DATE('문자열', [포맷]) : DATE
-- TO_CHAR(날짜, [포맷]) :CHARACTER
SELECT TO_CHAR(TO_DATE('21/09/28'),'YYYY-MM-DD')FROM DUAL;
-- '210908'와 같은 문자열을 가지고 2021년 9월 8일 표현(구글링 가능)
SELECT TO_CHAR(TO_DATE('210908'),'YYYY"년" FMMM"월" DD"일"') FROM DUAL;




SELECT EMP_NAME, JOB_CODE, SALARY,
    DECODE(JOB_CODE, 'J7', SALARY * 1.1,
                'J6', SALARY * 1.15,
                'J5', SALARY * 1.2,
                SALARY * 1.05) AS "인상된 급여"
FROM EMPLOYEE;




















