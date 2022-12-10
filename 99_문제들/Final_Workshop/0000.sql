SELECT *
FROM EMP;

-- SMITH 사원의 사원번호, 이름, 직속상관 이름
-- A1 : SMITH 사원 정보용
-- A2 : 직속상관 정보용
SELECT A1.EMPNO, A1.ENAME, A2.ENAME
FROM EMP A1, EMP A2
WHERE A1.MGR = A2.EMPNO
AND A1.ENAME = 'SMITH';








-- SCOTT사원이 근무하고 있는 부서의 이름
SELECT DNAME  
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');
                
-- SMITH와 같은 부서에 근무하고 있는 
-- 사원들의 사원번호, 이름, 급여액, 부서이름을 가져온다
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE E.DEPTNO = (SELECT DEPTNO
                    FROM EMP
                    WHERE ENAME = 'SMITH');
                    
SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';

-- MARTIN과 같은 직무를 가지고 있는 사원들의 
-- 사원번호, 이름, 직무를 가져온다.

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = (SELECT JOB 
             FROM EMP
             WHERE ENAME = 'MARTIN');
             
-- ALLEN과 같은 직속상관을 가진
-- 사원들의 사원번호, 이름, 직속상관 이름
-- A1 : 사원의 정보
-- A2 : 직속상관 정보
SELECT
FROM EMP A1, EMP A2