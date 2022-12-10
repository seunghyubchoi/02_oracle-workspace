-- JOIN ==

-- 사원테이블(EMP)과 부서테이블(DEPT)를 조인한다
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP;

SELECT *
FROM DEPT;

-- 사원의 사원번호, 이름, 근무부서 이름을 가져온다
SELECT EMPNO, ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- 사원의 사원번호, 이름, 근무지역을 가져온다
SELECT EMPNO, ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- DALLAS에 근무하고 있는 사원들의 사원번호 이름 직무
SELECT EMPNO, ENAME, JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'DALLAS';

-- SALES 부서에 근무하고 있는 사원들의 급여 평균을 가져온다
SELECT AVG(SAL)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND DNAME = 'SALES';

-- 1982년에 입사한 사원들의 사번, 이름, 입사일, 근무부서 이름
SELECT E.EMPNO, E.ENAME, E.HIREDATE, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- 각 사원들의 사원번호, 이름, 급여, 급여등급
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- SALES 부서에 근무하고 있는 사원의 사원번호, 이름, 급여등급
SELECT E.EMPNO, E.ENAME, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.DEPTNO = D.DEPTNO
AND D.DNAME = 'SALES';

-- 각 급여 등급별 급여의 총합과 평균, 사원의수, 최대급여, 최소급여를 가져온다
SELECT SUM(E.SAL), ROUND(AVG(E.SAL), 1) ,COUNT(E.SAL), MAX(E.SAL), MIN(E.SAL)
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

-- 급여 등급이 4등급인 사원들의 사원번호, 이름, 급여, 근무부서이름, 근무지역을 가져온다
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME, D.LOC
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE = 4;


-- SELF JOIN
-- SMITH 사원의 사원번호, 이름, 직속상관 이름
SELECT E1.EMPNO, E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E1.ENAME = 'SMITH';

-- FORD 사원 밑에서 일하는 사원들의 사원번호, 이름, 직무를 가져온다
-- E1 = 사원 정보
-- E2 = FORD
SELECT E1.EMPNO,E1.ENAME, E1.JOB
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME = 'FORD';

-- SMITH사원의 직속상관과 동일한 직무를 가지고 있는 사원들의
-- 사원번호, 이름, 직무를 가져온다
-- E1 SMITH 사원
-- E2 SMITH의 직속상관
-- E3 그 직속상관과 동일한 직무를 가지고 있는 사원들의 정보

SELECT E3.EMPNO, E3.ENAME, E3.JOB
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO
AND E2.JOB = E3.JOB
AND E1.ENAME = 'SMITH';

-- 각 사원의 이름, 사원번호, 직장상사 이름을 가져온다.
-- 단 직속 상관이 없는 사원도 가져온다
-- E1 : 각 사원의 정보
-- E2 : 직장 상사의 정보
SELECT E1.ENAME, E1.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- 모든 부서의 소속 사원의 근무부서명, 사원번호, 사원이름, 급여
SELECT * FROM DEPT;

SELECT DISTINCT DEPTNO FROM EMP;

SELECT D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;


--------------------------------------------------------------------
-- SUBQUERY

-- ALLEN과 같은 직속상관을 가진 사원들의 사원번호, 이름, 직속상관이름
-- E1 = 사원의 정보
-- E2 = 직속상관의 정보
SELECT E1.EMPNO, E1.ENAME, E2.ENAME  
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E1.MGR = (SELECT MGR
                FROM EMP
                WHERE ENAME = 'ALLEN');
                
-- WARD와 같은 부서에 근무하고 있는 사원들의 사우너번호, 이름, 부서번호
-- WARD 부서
SELECT DNAME
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
AND ENAME = 'WARD';

-- 사원들
SELECT E.EMPNO, E.ENAME, D.DEPTNO
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
AND D.DNAME = (SELECT DNAME
                FROM DEPT D, EMP E
                WHERE D.DEPTNO = E.DEPTNO
                AND ENAME = 'WARD');


-- SALESMAN의 평균 급여보다 많이 받는 사원들의 사원번호, 이름, 급여
SELECT AVG(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                FROM EMP
                WHERE JOB = 'SALESMAN');
               
-- DALLAS 지역에 근무하는 사원들의 평균 급여를 가져온다
SELECT AVG(SAL)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND LOC = 'DALLAS';

SELECT DEPTNO
FROM DEPT
WHERE LOC = 'DALLAS';

SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

-- SALES 부서에 근무하는 사원들의 사원번호, 이름, 근무지역
SELECT DEPTNO
FROM DEPT
WHERE DNAME = 'SALES';

SELECT E.EMPNO, E.ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
                
-- CHICAGO에 근무하는 사원들 중
-- BLAKE가 직속상관인 사원들의 사번, 이름, 직무
SELECT DEPTNO
FROM DEPT
WHERE LOC = 'CHICAGO';

SELECT E1.EMPNO, E1.ENAME, E1.JOB
FROM EMP E1, EMP E2, DEPT D
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME = 'BLAKE'
AND E1.DEPTNO = D.DEPTNO
AND E1.DEPTNO = (SELECT DEPTNO
                    FROM DEPT
                    WHERE LOC = 'CHICAGO');
                    
                    
-- 3000 이상의 급여를 받는 사원들과 같은 부서에서 근무하고 있는 
-- 사원의 사원번호, 이름, 급여
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN (
        SELECT DEPTNO
        FROM EMP
        WHERE SAL >= 3000);

SELECT DEPTNO
FROM EMP
WHERE SAL >= 3000;
