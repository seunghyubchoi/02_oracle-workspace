-- JOIN ==

-- ������̺�(EMP)�� �μ����̺�(DEPT)�� �����Ѵ�
SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP;

SELECT *
FROM DEPT;

-- ����� �����ȣ, �̸�, �ٹ��μ� �̸��� �����´�
SELECT EMPNO, ENAME, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- ����� �����ȣ, �̸�, �ٹ������� �����´�
SELECT EMPNO, ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- DALLAS�� �ٹ��ϰ� �ִ� ������� �����ȣ �̸� ����
SELECT EMPNO, ENAME, JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.LOC = 'DALLAS';

-- SALES �μ��� �ٹ��ϰ� �ִ� ������� �޿� ����� �����´�
SELECT AVG(SAL)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND DNAME = 'SALES';

-- 1982�⿡ �Ի��� ������� ���, �̸�, �Ի���, �ٹ��μ� �̸�
SELECT E.EMPNO, E.ENAME, E.HIREDATE, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.HIREDATE BETWEEN '1982/01/01' AND '1982/12/31';

-- �� ������� �����ȣ, �̸�, �޿�, �޿����
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- SALES �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿����
SELECT E.EMPNO, E.ENAME, S.GRADE
FROM EMP E, SALGRADE S, DEPT D
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.DEPTNO = D.DEPTNO
AND D.DNAME = 'SALES';

-- �� �޿� ��޺� �޿��� ���հ� ���, ����Ǽ�, �ִ�޿�, �ּұ޿��� �����´�
SELECT SUM(E.SAL), ROUND(AVG(E.SAL), 1) ,COUNT(E.SAL), MAX(E.SAL), MIN(E.SAL)
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
GROUP BY S.GRADE;

-- �޿� ����� 4����� ������� �����ȣ, �̸�, �޿�, �ٹ��μ��̸�, �ٹ������� �����´�
SELECT E.EMPNO, E.ENAME, E.JOB, D.DNAME, D.LOC
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND S.GRADE = 4;


-- SELF JOIN
-- SMITH ����� �����ȣ, �̸�, ���ӻ�� �̸�
SELECT E1.EMPNO, E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E1.ENAME = 'SMITH';

-- FORD ��� �ؿ��� ���ϴ� ������� �����ȣ, �̸�, ������ �����´�
-- E1 = ��� ����
-- E2 = FORD
SELECT E1.EMPNO,E1.ENAME, E1.JOB
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E2.ENAME = 'FORD';

-- SMITH����� ���ӻ���� ������ ������ ������ �ִ� �������
-- �����ȣ, �̸�, ������ �����´�
-- E1 SMITH ���
-- E2 SMITH�� ���ӻ��
-- E3 �� ���ӻ���� ������ ������ ������ �ִ� ������� ����

SELECT E3.EMPNO, E3.ENAME, E3.JOB
FROM EMP E1, EMP E2, EMP E3
WHERE E1.MGR = E2.EMPNO
AND E2.JOB = E3.JOB
AND E1.ENAME = 'SMITH';

-- �� ����� �̸�, �����ȣ, ������ �̸��� �����´�.
-- �� ���� ����� ���� ����� �����´�
-- E1 : �� ����� ����
-- E2 : ���� ����� ����
SELECT E1.ENAME, E1.EMPNO, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- ��� �μ��� �Ҽ� ����� �ٹ��μ���, �����ȣ, ����̸�, �޿�
SELECT * FROM DEPT;

SELECT DISTINCT DEPTNO FROM EMP;

SELECT D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;


--------------------------------------------------------------------
-- SUBQUERY

-- ALLEN�� ���� ���ӻ���� ���� ������� �����ȣ, �̸�, ���ӻ���̸�
-- E1 = ����� ����
-- E2 = ���ӻ���� ����
SELECT E1.EMPNO, E1.ENAME, E2.ENAME  
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
AND E1.MGR = (SELECT MGR
                FROM EMP
                WHERE ENAME = 'ALLEN');
                
-- WARD�� ���� �μ��� �ٹ��ϰ� �ִ� ������� ���ʹ�ȣ, �̸�, �μ���ȣ
-- WARD �μ�
SELECT DNAME
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
AND ENAME = 'WARD';

-- �����
SELECT E.EMPNO, E.ENAME, D.DEPTNO
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
AND D.DNAME = (SELECT DNAME
                FROM DEPT D, EMP E
                WHERE D.DEPTNO = E.DEPTNO
                AND ENAME = 'WARD');


-- SALESMAN�� ��� �޿����� ���� �޴� ������� �����ȣ, �̸�, �޿�
SELECT AVG(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
                FROM EMP
                WHERE JOB = 'SALESMAN');
               
-- DALLAS ������ �ٹ��ϴ� ������� ��� �޿��� �����´�
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

-- SALES �μ��� �ٹ��ϴ� ������� �����ȣ, �̸�, �ٹ�����
SELECT DEPTNO
FROM DEPT
WHERE DNAME = 'SALES';

SELECT E.EMPNO, E.ENAME, LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'SALES');
                
-- CHICAGO�� �ٹ��ϴ� ����� ��
-- BLAKE�� ���ӻ���� ������� ���, �̸�, ����
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
                    
                    
-- 3000 �̻��� �޿��� �޴� ������ ���� �μ����� �ٹ��ϰ� �ִ� 
-- ����� �����ȣ, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN (
        SELECT DEPTNO
        FROM EMP
        WHERE SAL >= 3000);

SELECT DEPTNO
FROM EMP
WHERE SAL >= 3000;
