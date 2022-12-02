--KH_연습문제
--1. 70년대 생(1970~1979) 중 여자이면서 전씨인 사원의 이름과 주민번호, 부서 명, 직급 조회
SELECT EMP_NAME, EMP_NO, DEPT_TITLE,  JOB_NAME
FROM EMPLOYEE E, JOB J, DEPARTMENT D
WHERE  E.JOB_CODE = J.JOB_CODE AND DEPT_ID = DEPT_CODE
AND EMP_NAME LIKE '전%'
AND SUBSTR(EMP_NO, 8,1) = 2
AND SUBSTR(EMP_NO, 1,2) BETWEEN 70 AND 79;

--2. 나이 상 가장 막내의 사원 코드, 사원 명, 나이, 부서 명, 직급 명 조회
SELECT EMP_ID, EMP_NAME,
EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6))) 나이,
DEPT_TITLE,
JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE DEPT_ID = DEPT_CODE AND J.JOB_CODE = E.JOB_CODE
AND EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6))) 
= (SELECT MIN(EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6)))) FROM EMPLOYEE
);

--3. 이름에 ‘형’이 들어가는 사원의 사원 코드, 사원 명, 직급 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
AND EMP_NAME LIKE '%형%';

--4. 부서코드가 D5이거나 D6인 사원의 사원 명, 직급 명, 부서 코드, 부서 명 조회
SELECT EMP_NAME, JOB_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE E, JOB J, DEPARTMENT D
WHERE E.JOB_CODE = J.JOB_CODE
AND DEPT_ID = DEPT_CODE
AND E.DEPT_CODE = 'D5' OR E.DEPT_CODE = 'D6';

--5. 보너스를 받는 사원의 사원 명, 부서 명, 지역 명 조회
--6. 사원 명, 직급 명, 부서 명, 지역 명 조회
--7. 한국이나 일본에서 근무 중인 사원의 사원 명, 부서 명, 지역 명, 국가 명 조회
--8. 한 사원과 같은 부서에서 일하는 사원의 이름 조회
--9. 보너스가 없고 직급 코드가 J4이거나 J7인 사원의 이름, 직급 명, 급여 조회(NVL 이용)
--10. 보너스 포함한 연봉이 높은 5명의 사번, 이름, 부서 명, 직급, 입사일, 순위 조회
--11. 부서 별 급여 합계가 전체 급여 총 합의 20%보다 많은 부서의 부서 명, 부서 별 급여 합계 조회
--11-1. JOIN과 HAVING 사용
--11-2. 인라인 뷰 사용
--12. 부서 명과 부서 별 급여 합계 조회