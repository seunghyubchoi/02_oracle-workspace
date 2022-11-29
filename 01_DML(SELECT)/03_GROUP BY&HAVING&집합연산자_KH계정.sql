--
/*
    < GROUP BY �� >
    �׷� ������ ������ �� �ִ� ����
    (�ش� �׷� ���غ��� ���� �׷��� ���� �� ����)
    ���� ���� ������ �ϳ��� �׷����� ��� ó���� �������� ���
*/
SELECT SUM(SALARY)
FROM EMPLOYEE; -- ��ü ����� �ϳ��� �׷����� ��� ������ ���� ���

-- �� �μ��� �� �޿� ��
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �� �μ��� ��� ��
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- ���� ����
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


-- COUNT(BONUS) : Ư�� ���޿��� ���ʽ� �޴� ��� �� 
-- �� ���޺��� �� ��� ��, ���ʽ��� �޴� ��� ��, �޿� ��, ��� �޿�, ���� �޿�, �ִ� �޿�
SELECT JOB_CODE AS "����", COUNT(*) || '��' AS "�� ��� ��", COUNT(BONUS) || '��'  AS "���޼�", TO_CHAR(SUM(SALARY), 'L99,999,999') AS "��", TO_CHAR(ROUND(AVG(SALARY)), 'L9,999,999') AS "���", TO_CHAR(MIN(SALARY), 'L9,999,999') AS "����", TO_CHAR(MAX(SALARY), 'L9,999,999') AS "�ִ�"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

SELECT DEPT_CODE AS "����", COUNT(*) || '��' AS "�� ��� ��", COUNT(BONUS) || '��'  AS "���޼�", TO_CHAR(SUM(SALARY), 'L99,999,999') AS "��", TO_CHAR(ROUND(AVG(SALARY)), 'L9,999,999') AS "���", TO_CHAR(MIN(SALARY), 'L9,999,999') AS "����", TO_CHAR(MAX(SALARY), 'L9,999,999') AS "�ִ�"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- ��� ������ ���� ��
-- GROUP BY ���� �Լ��� ����� ����
SELECT DECODE(SUBSTR(EMP_NO, 8,1), 1, '����', 2, '����') AS "����", COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO, 8,1);

-- GROUP BY ���� ���� �÷� ��� ����
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;

---------------------------------------------------------------------------------
/*
    < HAVING �� >
    �׷쿡 ���� ������ ������ �� ���Ǵ� ����
    (�ַ� �׷� �Լ����� ������ ������ ������ �� ���)
*/
-- �� �μ��� ��� �޿� ��ȸ(�μ��ڵ�, ��� �޿�)
SELECT DEPT_CODE AS "�μ�", TO_CHAR(TRUNC(AVG(SALARY)), 'L9,999,999') AS "���"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;


-- �μ����� ��� �޿��� ��� ���� �̻��� �μ��鸸 ��ȸ
SELECT DEPT_CODE AS "�μ�", TO_CHAR(TRUNC(AVG(SALARY)), 'L9,999,999') AS "���"
FROM EMPLOYEE
GROUP BY DEPT_CODE

-- WHERE ������ "�׷��Լ�" ������ �������� �Ұ�
HAVING AVG(SALARY) >= 3000000 

ORDER BY 1;



-- ���޺� �� �޿��� (��, ���޺� �޿� ���� õ���� �̻��� ���޸� ��ȸ), �����ڵ�, �޿���
SELECT JOB_CODE || '��' AS "�μ�", TO_CHAR(SUM(SALARY), 'L99,999,999') || '����' AS "��"
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000
ORDER BY 1 DESC;

-- �μ����� ���ʽ��� �޴� ����� ���� �μ����� ��ȸ �μ��ڵ常 ������ �غ���
SELECT DEPT_CODE -- COUNT(BONUS)�� SELECT�� ���� ���þ�� ��
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0; -- COUNT�� ���ڴϱ� ���ڸ� ����


------------------------------------------------------------------------------
/*
    < SELECT�� ���� ���� >
    5 SELECT * | ��ȸ�ϰ��� �ϴ� �÷� ��Ī | ����� "��Ī" | �Լ��� AS "��Ī"
    1 FROM ��ȸ�ϰ��� �ϴ� ���̺��
    2 WHERE ���ǽ� (�����ڸ� ������ ���)
    3 GROUP BY �׷�������� ���� �÷� || �Լ���
    4 HAVING ���ǽ� (�׷��Լ��� ������ ���) �׷쿡 ���� ����
    6 ORDER BY �÷���|��Ī|�������� [ASC|DESC|NULLS FIRST| NULLS LAST]
    
    
    -- �������� �Ͻô� ���
    -- 1. FROM �����ְ�
    -- 2. GROUP BY  �����ְ� 
    -- 3. SELECT ä�� ��~!!
    -- 4. �����Ҳ��� ORDER BY
*/

/*
    < �����Լ� >
    �׷캰 ����� ������� �߰����踦 ������ִ� �Լ�
    
    ROLLUP 
    = > GROUP BY ���� ����ϴ� �Լ�
    
*/
-- �� ���� �� �޿� ��
-- ������ ������ ��ü ��  �޿��ձ��� ���� ��ȸ�ϰ� ���� ��
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(JOB_CODE)
ORDER BY 1;
-- ROLLUP : GROUP BY�� ���� ���� �׷��� �߰� ���踦 ������ִ� �Լ�

-----------------------------------------------------------------------------

/*
    < ���� ������ == SET OPERATION >
    
    ���� ���� �������� ������ �ϳ��� ���������� ����� ������
    
    UNION     : OR : ������ = �� ������ ������ ������� ���� �� �ߺ��Ǵ� ���� �ѹ��� ����������
    INTERSECT : AND : ������ = �� ������ ������ ������� �ߺ��� ��� ��
    UNION ALL : ������ + ������ = �ߺ��Ǵ� �κ��� �ι� ǥ���� �� ����
    MINUS     : ������ = ���� ��� ������ ���� ������� �� ������
*/

-- 1. UNION
-- �μ��ڵ尡 D5�� ��� �Ǵ� �޿��� 3�鸸�� �ʰ��� ����� ��ȸ
-- ���, �̸�, �μ��ڵ�, �޿�

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6����(�ڳ��� ������ ���ؼ� �ɺ��� ������ ���ȥ)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 8����(������ ������ ���ö ����� ������ *�ɺ���* *���ȥ* ������)
-- ���� 6�� 8������ UNION�� �ߺ� �� �� ���� �����༭ 12��

    -- ���� ���� ������
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
-- �ߺ����� ����ϴ� INTERSECT

    -- ���� ���� ������
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D5' AND SALARY > 3000000;
    
-----------------------------------------------------------------------
-- ���� ������ ���ǻ���

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6����(�ڳ��� ������ ���ؼ� �ɺ��� ������ ���ȥ)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- �� �������� SELECT ���� �ۼ��Ǿ� �ִ� "�÷� ����"�� �����ؾ� ��

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6����(�ڳ��� ������ ���ؼ� �ɺ��� ������ ���ȥ)
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY -- HIRE_DATE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- �� �������� SELECT ���� �ۼ��Ǿ� �ִ� "�÷� Ÿ��"�� �����ؾ� ��

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6����(�ڳ��� ������ ���ؼ� �ɺ��� ������ ���ȥ)
-- ORDER BY EMP_NAME
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;
-- ORDER BY�� �׻� ���� �Ʒ��� ǥ��

-----------------------------------------------------------------------------
-- 3. UNION ALL : �������� ���� ����� ������ �� ���ϴ� ������ (�ߺ��� ����)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- �ߺ��� ����
-----------------------------------------------------------------------------
-- 4. MINUS : ���� SELECT ������� ���� SELECT ����� �� ������(������)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' 
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 'D5'�� ����� �߿��� SALARY�� 3000000 �Ѵ� ����鸸 ����

-- �� ������ ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY < 3000000;


