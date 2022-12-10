SELECT *
FROM EMP;

-- SMITH ����� �����ȣ, �̸�, ���ӻ�� �̸�
-- A1 : SMITH ��� ������
-- A2 : ���ӻ�� ������
SELECT A1.EMPNO, A1.ENAME, A2.ENAME
FROM EMP A1, EMP A2
WHERE A1.MGR = A2.EMPNO
AND A1.ENAME = 'SMITH';








-- SCOTT����� �ٹ��ϰ� �ִ� �μ��� �̸�
SELECT DNAME  
FROM DEPT
WHERE DEPTNO = (SELECT DEPTNO
                FROM EMP
                WHERE ENAME = 'SCOTT');
                
-- SMITH�� ���� �μ��� �ٹ��ϰ� �ִ� 
-- ������� �����ȣ, �̸�, �޿���, �μ��̸��� �����´�
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME
FROM EMP E
JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE E.DEPTNO = (SELECT DEPTNO
                    FROM EMP
                    WHERE ENAME = 'SMITH');
                    
SELECT DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';

-- MARTIN�� ���� ������ ������ �ִ� ������� 
-- �����ȣ, �̸�, ������ �����´�.

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = (SELECT JOB 
             FROM EMP
             WHERE ENAME = 'MARTIN');
             
-- ALLEN�� ���� ���ӻ���� ����
-- ������� �����ȣ, �̸�, ���ӻ�� �̸�
-- A1 : ����� ����
-- A2 : ���ӻ�� ����
SELECT
FROM EMP A1, EMP A2