-- 3000 이상의 급여를 받는 사원들과
-- 같은 부서에 근무하고 있는 사원의 사원번호, 이름, 급여
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                    WHERE SAL >= 3000);

-- 직무가 CLERK인 사원과 동일한 부서에 근무하고 있는
-- 사원들의 사원번호, 이름, 입사일
SELECT EMPNO, ENAME,HIREDATE
FROM EMP
WHERE DEPTNO IN (
                SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'CLERK'
                );


-- KING을 직속상관으로 가지고 있는 사원들이
-- 근무하고 있는 근무 부서명, 지역을 가지고 온다

-- 1.
SELECT EMPNO
FROM EMP
WHERE ENAME = 'KING';

-- 2.
SELECT DEPTNO
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'KING');
             
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO IN (SELECT DEPTNO
                FROM EMP
                WHERE MGR = (SELECT EMPNO
                             FROM EMP
                             WHERE ENAME = 'KING'));
                             
-- CLERK들의 직속상관의 사원번호, 이름, 급여

SELECT MGR
FROM EMP
WHERE JOB = 'CLERK';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                WHERE JOB = 'CLERK');

-- 각 부서별 급여 평균보다 더 많이 받는 사원의
-- 사원번호, 이름, 급여를 가져온다
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL(SELECT AVG(SAL)
                FROM EMP
                GROUP BY DEPTNO);

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT MAX(AVG(SAL))
                FROM EMP
                GROUP BY DEPTNO);

-- 각 부서별 급여 최저치보다 더 많이 받는
-- 사원들의 사원번호, 이름, 급여
SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ALL (
            SELECT MIN(SAL)
            FROM EMP
            GROUP BY DEPTNO
                );

-- SALESMAN 보다 급여를 적게 받는 
-- 사원들의 사원번호, 이름, 급여
SELECT SAL
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < ALL(SELECT SAL
                FROM EMP
                WHERE JOB = 'SALESMAN');
                
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL < (SELECT MIN(SAL)
                FROM EMP
                WHERE JOB = 'SALESMAN');
                
-- 각 부서별 최저 급여액수 보다
-- 많이 받는 사원들의 사번, 이름, 급여
SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT MIN(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
-- DALLAS에 근무하고 있는 사원들 중
-- 가장 나중에 입사한 사원의 입사 날짜보다 더 먼저 입사한
-- 사원들의 사원번호, 이름, 입사일

SELECT EMPNO, ENAME, HIREDATE
FROM EMP 
WHERE HIREDATE < (SELECT MAX(HIREDATE)
                    FROM EMP 
                    WHERE DEPTNO = (SELECT DEPTNO
                                    FROM DEPT
                                    WHERE LOC = 'DALLAS'));

SELECT MAX(HIREDATE)
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');