-- 3000 �̻��� �޿��� �޴� ������
-- ���� �μ��� �ٹ��ϰ� �ִ� ����� �����ȣ, �̸�, �޿�
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO
                    FROM EMP
                    WHERE SAL >= 3000);

-- ������ CLERK�� ����� ������ �μ��� �ٹ��ϰ� �ִ�
-- ������� �����ȣ, �̸�, �Ի���
SELECT EMPNO, ENAME,HIREDATE
FROM EMP
WHERE DEPTNO IN (
                SELECT DEPTNO
                FROM EMP
                WHERE JOB = 'CLERK'
                );


-- KING�� ���ӻ������ ������ �ִ� �������
-- �ٹ��ϰ� �ִ� �ٹ� �μ���, ������ ������ �´�

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
                             
-- CLERK���� ���ӻ���� �����ȣ, �̸�, �޿�

SELECT MGR
FROM EMP
WHERE JOB = 'CLERK';

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE EMPNO IN (SELECT MGR
                FROM EMP
                WHERE JOB = 'CLERK');

-- �� �μ��� �޿� ��պ��� �� ���� �޴� �����
-- �����ȣ, �̸�, �޿��� �����´�
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

-- �� �μ��� �޿� ����ġ���� �� ���� �޴�
-- ������� �����ȣ, �̸�, �޿�
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

-- SALESMAN ���� �޿��� ���� �޴� 
-- ������� �����ȣ, �̸�, �޿�
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
                
-- �� �μ��� ���� �޿��׼� ����
-- ���� �޴� ������� ���, �̸�, �޿�
SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT MIN(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
-- DALLAS�� �ٹ��ϰ� �ִ� ����� ��
-- ���� ���߿� �Ի��� ����� �Ի� ��¥���� �� ���� �Ի���
-- ������� �����ȣ, �̸�, �Ի���

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