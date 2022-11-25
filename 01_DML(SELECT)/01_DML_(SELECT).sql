/*

    < SELECT >
    ������ ��ȸ�� �� ���Ǵ� �����Դϴ�
    
    >> RESULT SET : SELECT���� ���� ��ȸ�� �����
    ��, ��ȸ�� ����� ������ �ǹ��մϴ�
    
    < ǥ���� >
    SELECT ��ȸ�ϰ��� �ϴ� �÷�1, �÷�2, �÷�3 ... 
    FROM ���̺��;
    
    * ��ȸ�� �� ���� �ݵ�� �����ϴ� �÷��� �̸��� ������մϴ�
    => ���� �÷��� ���� ������ ���ϴ�

*/

-- EMPLOYEE �� COMLUMN_NAME Ȯ��!
-- DB�� ���ڿ��� ����(VARCHAR2, CHAR �� ���ڿ�)

-- EMPLOYEE ���̺��� ��� �÷��� ��ȸ
-- SELECT EMP ID, EMP NAME, EMP NO .... : ��ȿ������ ��ȸ ���
-- �Ʒ��� ���� ��ȸ�սô�
SELECT *
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ���, �̸�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

-- JOB ���̺��� ��� �÷� ��ȸ
SELECT *
FROM JOB;

----------------------------�ǽ�����----------------------
-- 1. JOB���̺��� ���޸� ��ȸ
SELECT JOB_NAME
FROM JOB;

-- 2. DEPARTMENT ���̺��� ��� �÷� ��ȸ
SELECT *
FROM DEPARTMENT;

-- 3. DEPARTMENT ���̺��� �μ��ڵ�, �μ��� ��ȸ
SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

-- 4. EMPLOYEE ���̺��� �����, �̸���, ��ȭ��ȣ, �Ի���, �޿� ��ȸ
SELECT EMP_NAME, EMAIL,PHONE, HIRE_DATE, SALARY
FROM EMPLOYEE;

/*
    <�÷� ���� ���� ��� ����>
    SELECT�� �÷��� �ۼ��κп� ������� ��� ����
    (�� ��, �������� ��� ��ȸ)
    
*/

-- EMPLOYEE ���̺��� �����, �޿� ��ȸ
SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, ����� ����(�޿�*12) ��ȸ
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ���ʽ�, ����, ���ʽ��� ���Ե� ����(((�޿� + (���ʽ� * �޿�)) * 12) ��ȸ
SELECT EMP_NAME, SALARY, BONUS, SALARY * 12, ((SALARY + (BONUS * SALARY)) * 12)
FROM EMPLOYEE;
-- NULL�� ���� ��������� �ϸ� �� ��� ���� NULL�̴�

-- EMPLOYEE ���̺��� �����, �Ի���
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �Ի���, �ٹ��ϼ�(���� ��¥ - �Ի���)
-- ���� ��¥ : SYSDATE, ��/��/�� ������ �� ����
SELECT EMP_NAME, HIRE_DATE, SYSDATE - HIRE_DATE
FROM EMPLOYEE;
-- DATE - DATE : ���� ����(����)
-- => ��� ���� �� �����δ� ����!
-- => DATE ������ ��/��/��/��/��/�� ������
-- => �ð� �������� �����ϱ� ������ ����� �������� �� �����ϴ�
-- => �Լ��� �����ϸ� ����� ����� Ȯ���� �� �־��
--------------------------------------------------------------------------------

/*
    < �÷��� ��Ī �����ϱ� >
    ��� ������ �ϰ� �Ǹ� �÷����� �����������µ� 
    �̶� �÷������� ��Ī�� �ο��ؼ� ����ϰ� ������
    
    [ǥ����]
    �÷��� ��Ī / �÷��� AS ��Ī / �÷��� "��Ī" / �÷��� AS "��Ī"
    
    AS ���̵� �� ���̵� ���� �ο��ϰ��� �ϴ� ��Ī�� ����,
    Ȥ�� Ư�����ڰ� ���Ե� ���, �ݵ�� �ֵ���ǥ("") ����ؾ��մϴ�
    
*/
SELECT EMP_NAME �����, SALARY AS �޿�, SALARY * 12 "����(��)", ((SALARY + (BONUS * SALARY)) * 12) AS "���ʽ� ���� ����"
FROM EMPLOYEE;

-- "����(��)" = O
-- ����(��) = X
-- �÷��� AS "��Ī" = ���� ���� ���̴� ǥ���

--------------------------------------------------------------------------------

/*
    < ���ͷ� >
    ���Ƿ� ������ ���ڿ�('')�� ���ͷ��̶�� �մϴ�
    
    SELECT ���� ���ͷ��� �����ϸ� ��ġ ���̺� �� �����ϴ� ������ó�� ��ȸ ����
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ���� ���
    
*/

-- EMPLOYEE ���̺��� ���, �����, �޿� ��ȸ
SELECT EMP_ID AS "���", EMP_NAME AS "�̸�", SALARY AS "�޿�", '��' AS "����"
FROM EMPLOYEE;

/*
    < ���� ������ : ||>
    ���� �÷������� ��ġ �ϳ��� �÷��ΰ�ó�� �����ϰų�,
    �÷����� ���ͷ��� ������ �� ����
    System.out.println("num�� �� : " + num);
*/

-- EMPLOYEE ���, �̸�, �޿��� �ϳ��� Ŀ������ ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY AS "���, �̸�, �޿�"
FROM EMPLOYEE;

-- �÷����̶� ���ͷ� ����
-- XXX�� ������ XXX�� �Դϴ�
SELECT EMP_NAME || '�� ������ ' ||  SALARY || '�� �Դϴ�' AS "�޿�����"
FROM EMPLOYEE;


--------------------------------------------------------------------------------

/*
    < DISTINCT >
    �÷��� �ߺ��� ������ �� ������ ǥ���ϰ��� �� �� ���
*/
-- ���� �츮 ȸ�翡 � ������ ������� �����ϴ��� �ñ���.

-- EMPLOYEE ���̺��� �����ڵ� ��ȸ
SELECT JOB_CODE
FROM EMPLOYEE;
-- �ߺ� ���� �Ǳ� �� 23���� ��ȸ �ƴ�

SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;
-- �ߺ� ���� �� �� 7�ุ ��ȸ �ƴ�

-- ������� � �μ��� ���� �ִ��� Ȯ��
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE; 
-- NULL : ���� �μ���ġ�� �ȵ� ���

-- DISTINCT�� SELECT ���� �� �� ���� ����� ����
/*
    ���� ��� ����
    SELECT DISTINCT JOB_CODE, DISTINCT DEPT_CODE
    FROM EMPLOYEE;
*/

-- ���� �÷��� DISTINCT�� ����ϱ�
SELECT DISTINCT JOB_CODE, DEPT_CODE 
FROM EMPLOYEE;
-- JOB_CODE�� DEPT_CODE�� �� ������ ��� �ߺ� �Ǻ�

--------------------------------------------------------------------------------

/*
    < WHERE �� >
    ��ȸ�ϰ��� �ϴ� ���̺�κ��� 
    Ư�� ���ǿ� �����ϴ� �����͸��� ��ȸ�ϰ��� �� �� ����մϴ�~!
    �� ��, WHERE ������ ���ǽ��� �����ϰ� �˴ϴ�
    ���ǽĿ����� �پ��� �����ڵ��� ����� �� �ֽ��ϴ�
    
    [ǥ����]
    SELECT �÷�1, �÷�2, ...
    FROM ���̺��
    WHERE ���ǽ�;
    
    [�񱳿�����]
    >, <, >=, <=    => ��Һ�
    =               => �����              
    !=, ^=, <>      => �������� ������ ��
    
*/

-- EMPLOYEE ���̺��� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ (�̶�, ��� �÷� ��ȸ)
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';
-- ��Ī �� �� ����� ���� Ȭ����ǥ�� ���

-- EMPLOYEE ���̺��� �μ��ڵ尡 'D1'�� ������� ������ �޿�, �μ��ڵ常 ��ȸ
SELECT EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- �μ��ڵ尡 D1�� �ƴ� ������� ���, �����, �μ��ڵ带 ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
-- WHERE DEPT_CODE != 'D1';
-- WHERE DEPT_CODE ^= 'D1';
WHERE DEPT_CODE <> 'D1';

-- �޿��� 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;


-- ENPLOYEE���� ���� ���� ȸ�翡�� 
-- ������(ENT_YN �÷����� 'N')�� ������� ���, �̸�, �Ի��� ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

---------------------------------------------------------------------------
-- 1. �޿��� 3�鸸�� �̻��� ������� �����, �޿�, �Ի���, ����(���ʽ� ������) ��ȸ

SELECT EMP_NAME AS "�̸�", SALARY AS "�޿�", HIRE_DATE AS "�Ի���", SALARY * 12 AS "����"
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����(���ʽ� ������), �μ� �ڵ� ��ȸ

SELECT EMP_NAME || '�� �޿��� ' || SALARY || '�� �̸�, ������ ' || SALARY * 12 || '�̰�, ���� �ڵ�� ' || DEPT_CODE || '�Դϴ�.' AS "��������"
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;

/*
    < SELECT�� SALARY�� ��Ī�� �ָ� WHERE���� ��Ī�� ����� �� ������? > 
    
    SELECT EMP_NAME, SALARY, SALARY * 12 AS "����", DEPT_CODE || '�Դϴ�.'
    FROM EMPLOYEE
    WHERE ���� * 12 >= 50000000;
*/

-- ���� ���� ���� : 
-- FROM�� => WHERE�� => SELECT��
-- SELECT���� ��Ī�� �� ���α׷��� ���ư��� ������ ����
-- SELECT�� ���� WHERE���� ���� Ȯ���ϱ� ������ 
-- WHERE���� ���� * 12 >= 50000000; �������� �ʴ�


-- 3. �����ڵ尡 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT '��� : ' || EMP_ID || ', ����� : ' ||  EMP_NAME || ', �����ڵ� : ' || JOB_CODE || ', ��翩�� : ' || ENT_YN AS "���ѻ�� ��������"
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

-- �μ��ڵ尡 'D9'�̸鼭 �޿��� 500���� �̻��� ������� ���, �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;

-- �μ��ڵ尡 'D6'�̰ų� �޿��� 3�鸸�� �̻���
-- ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- �޿��� 350���� �̻� 600���� ���ϸ� �޴� ������� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;
-- �Ϲ������� ���Ϸ��� �÷� ���(SALARY)�� ����, ���ڰ� ������

--------------------------------------------------------------------------------

/*
    < BETWEEN A AND B > 
    ���ǽĿ��� ���Ǵ� �����̸� 
    '�� �̻� �� ����'�� ������ ���� ������ ������ �� ��� �Ǵ� ������
    
    [ǥ����]
    �񱳴���÷� BETWEEN A(��1) AND B(��2)
    -> �ش� �÷� ���� A �̻��̰� B ������ ���
*/

SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;


-- ���� ���� ���� ���� ������� ��ȸ�ϱ�(350�� �̸�, 600�� �ʰ�)
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
-- WHERE SALARY < 3500000 OR SALARY > 6000000;
-- WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
-- NOT : ������������
-- �÷��� �� �Ǵ� BETWEEN �տ� ���� ����

-- �Ի����� '90/01/01' ~'01/01/01' ��� �÷� ��ȸ(BETWEEN)
SELECT *
FROM EMPLOYEE
-- WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '01/01/01';
-- DATE ������ ��� �� ����
--------------------------------------------------------------------------------
/*
    < LIKE >
    ���ϰ����ϴ� �÷� ���� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    [ǥ����]
    �񱳴���÷� LIKE 'Ư������'
    - Ư�� ���� ���ý� '%', '_'�� '���ϵ�ī��'�� ����� �� ����

    '%' = 0���� �̻�
    EX) �񱳴���÷� LIKE '����%' 
    = �񱳴���� �÷� ���� '����'�� ���۵Ǵ� ���� ��ȸ
    
    EX2) �񱳴���÷� LIKE '%����' 
    = �񱳴���� �÷� ���� '����'�� ������ ���� ��ȸ
    
    EX3) �񱳴���÷� LIKE '%����%' 
    = �񱳴���� �÷� ���� '����'�� �����ϴ� ���� ��ȸ
    (Ű���� �˻����� ���� ���� ����)      
  
    '_' = 1����
    
    EX1) �񱳴���÷� LIKE '_����' 
    = �񱳴���� �÷� ���� '����' �տ� ������ �� ���ڰ� ���� ��� ��ȸ
    
    EX2) �񱳴���÷� LIKE '����_' 
    = �񱳴���� �÷� ���� '����' �ڿ� ������ �� ���ڰ� ���� ��� ��ȸ
    
    EX3) �񱳴���÷� LIKE '_����_' 
    = �񱳴���� �÷� ���� '����' ��, �ڿ� ������ �� ���ڰ� ���� ��� ��ȸ
    
    
    
    
*/

-- ����� �� ���� '��'���� ������� ����� �޿� �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%'; -- Ű���� �˻�

-- �̸� �߿� '��'�� ���Ե� ������� �����, �ֹι�ȣ, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%'; -- '%' ������ ���ڸ� �����ϴ� ��� �̸�

-- �̸� �߿� �̸��� ��� ���ڰ� '��'�� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_'; -- '_' �ѱ��ڸ� ��, �̸��� 3���ڶ�� ���� ��������


-- ��ȭ��ȣ�� 3��° �ڸ��� 1�� ������� ���, �����, ����, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%'; -- '_'�� �ѱ��ھ��� ������ '%'�� �ڸ��� ������� ���� ���

-- Ư�����̽�
-- �̸��� �� '_' �������� �ձ��ڰ� 3������ ������� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%'; -- ���ߴ� ��� ���� �� ��
-- ���ϵ�ī��� ���ǰ� �ִ� ���ڿ� �÷� ���� ��� ���ڰ� �����ϱ� ������
-- ����� ��ȸ�� �ȵǴ� ��Ȳ
-- => ��� ���ϵ�ī��� ��� ������ ������ ������ ����� �մϴ�
-- => ������ ������ ����ϰ��� �ϴ� �� �տ�
-- => ������ ���ϵ� ī�带 �����ϰ� �װ��� ESCAPE OPTION���� ����ؾ� �մϴ�

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$'; -- � ���ڵ� �������
-- �����ڸ� ������ �̽������� ���� ������ '_'

-- ���� ������� �ƴ� �� ���� ����� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
-- WHERE NOT EMAIL LIKE '___$_%' ESCAPE '$';
WHERE EMAIL NOT LIKE '___$_%' ESCAPE '$';
-- NOT�� �÷��� �� �Ǵ� LIKE �տ� ���� ����

----------------------------------------------------------------------

-- 1. EMPLOYEE ���̺��� �̸��� '��'���� ������ �������
-- �����, �Ի��� ��ȸ
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';


-- 2. EMPLOYEE ���̺��� �̸��� '��'�� ���ԵǾ� �ְ�,
-- �޿��� 240���� �̻��� ������� �����, �޿� ��ȸ
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%' AND SALARY >= 2400000;


-- 3. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� �������
-- ����� ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%'; 


-- 4. DEPARTMENT ���̺��� �ؿܿ������� �μ����� �μ��ڵ�� �μ��� ��ȸ
-- SELECT *
-- FROM DEPARTMENT �� ���� DEPARTMENT�� � �����Ͱ� �� �ִ��� Ȯ��

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '�ؿܿ���%';

-----------------------------------------------------------------------------
/*
    < IS NULL / IS NOT NULL >
    �÷����� NULL�� ���� ���, NULL �� �񱳿� ���Ǵ� ������
    
*/

-- ���ʽ��� ���� �ʴ� ���(BONUS�� ���� NULL)
-- ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
-- WHERE BONUS = NULL;
-- WHERE BONUS IS NULL;
-- WHERE BONUS IS NOT NULL;
WHERE NOT BONUS IS NULL;
-- NOT�� �÷��� �� �Ǵ� IS �ڿ��� ��� �����ϴ�

-- �μ���ġ�� ���� ������ �ʾ����� ���ʽ��� �޴�
-- ��� �̸�, ���ʽ�, �μ��ڵ� ��ȸ

SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND NOT BONUS IS NULL;

-------------------------------------------------------
/*
    < IN >
    �񱳴�� �÷����� ���� ������ ����߿� ��ġ�ϴ� ���� �ִ��� ã���ϴ�
    
    [ǥ����]
    �񱳴���÷� IN ('��1', '��2', '��3', ...)
*/
-- �μ��ڵ尡 'D6' �̰ų� 'D8' �̰ų� 'D5'��
-- �μ������� �̸�, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
-- WHERE DEPT_CODE = 'D6' OR DEPT_CODE = 'D8' OR DEPT_CODE = 'D5';
WHERE DEPT_CODE IN ('D6', 'D8', 'D5'); -- OR�� �ǹ���

-- �� ���� �����
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE NOT DEPT_CODE IN ('D6', 'D8', 'D5');

-------------------------------------------------------

/*
    < ������ �켱���� >
    0. ()
    1. ��������� + - * /
    2. ���Ῥ���� || 
    3. �񱳿�����
    4. IS NULL / LIKE / IN
    5. BETWEEN A AND B
    6. NOT(��������)
    7. AND(��������) 
    8. OR(��������)
    * AND�� OR�� ���� �� AND�� ���� ����
    
*/

-- �����ڵ尡 'J7' �̰ų� 'J2'�� ����� ��
-- �޿��� 200���� �̻��� ������� ��� �÷� ��ȸ

SELECT *
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J2') AND SALARY >= 2000000;

--------------------------------------------------------------------------------

-- 1. ����� ���� �μ���ġ�� ���� ���� ������� 
-- (�����, ������, �μ��ڵ�) ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;
-- 2��

-- 2. ����(���ʽ�������)�� 3000���� �̻��̰� 
-- ���ʽ��� ���� �ʴ� ������� (���, �����, �޿�, ���ʽ�) ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE SALARY * 12 >= 30000000 AND BONUS IS NULL;
-- 7��


-- 3. �Ի����� '95/01/01' �̻��̰� �μ���ġ�� ���� ������� 
-- (���, �����, �Ի���, �μ��ڵ�) ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE, DEPT_CODE
FROM EMPLOYEE
WHERE HIRE_DATE >= '95/01/01' AND DEPT_CODE IS NOT NULL;
-- 18��


-- 4. �޿��� 200���� �̻� 500���� �����̰� 
-- �Ի����� '01/01/01' �̻��̰� ���ʽ��� ���� �ʴ� �������
-- (���, �����, �޿�, �Ի���, ���ʽ�) ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE, BONUS
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND 5000000 AND HIRE_DATE >= '01/01/01' AND BONUS IS NULL;
-- 7��


-- 5. ���ʽ����Կ����� NULL�� �ƴϰ� �̸��� '��'�� ���ԵǾ��ִ� 
-- ������� (���, �����, �޿�, ���ʽ����Կ���) ��ȸ (��Ī�ο�)
SELECT EMP_ID AS "���", EMP_NAME AS "�����", SALARY AS "�޿�", ((SALARY + (BONUS * SALARY)) * 12) AS "���ʽ� ���� ����"
FROM EMPLOYEE 
WHERE ((SALARY + (BONUS * SALARY)) * 12) IS NOT NULL AND EMP_NAME LIKE '%��%';
-- 2��


--------------------------------------------------------------------------------

SELECT EMP_ID, EMP_NAME, SALARY -- ������� 3��
FROM EMPLOYEE -- ������� 1��
WHERE DEPT_CODE IS NULL; -- ������� 2��

--------------------------------------------------------------------------------

/*
    < ORDER BY ��>
    ���� �������ٿ� �ۼ� ! �Ӹ� �ƴ϶� ������� ���� �������� ����
    
    [ǥ����]
    SELECT ��ȸ�� �÷�1, �÷�2, �÷�3, �������� AS "��Ī", ...
    FROM ��ȸ�ϰ����ϴ� ���̺�� 
    WHERE ���ǽ�   
    ORDER BY �����ϰ� ���� �÷�|��Ī|�÷����� [ASC|DESC] [NULLS FIRST | NULLS LAST]
    
    - ASC : �������� ����
    �Ⱦ��� ����Ʈ, ����Ʈ ���� ASC
    
    - DESC : �������� ����
    
    - NULLS FIRST : �����ϰ��� �ϴ� �÷� ���� NULL�� ���� ��� 
                    �ش� �����͸� �� ������ ��ġ
                    (������ DESC�� ���� �⺻ ��)
    - NULLS LAST : �����ϰ��� �ϴ� �÷� ���� NULL�� ���� ���
                    �ش� �����͸� �� �ڷ� ��ġ
                    (������ ASC�� ���� �⺻ ��)
    
*/

    SELECT *
    FROM EMPLOYEE
    -- ORDER BY BONUS ASC;  -- �������� ������ �� �⺻������ NULLS LAST
    -- ORDER BY BONUS DESC;  -- �������� ������ �� �⺻������ NULLS FIRST
    ORDER BY BONUS DESC, SALARY ASC; -- ���� ���� ������ ���� ����, (ù��° ������ �÷����� ������ ���, �ι� ° ���� �÷��� ������ �����մϴ�)
    
    -- �� ����� �����, ���� ��ȸ (�� �� ������ �������� ���� ��ȸ)
    SELECT EMP_NAME, SALARY * 12 AS "����"
    FROM EMPLOYEE
    -- ORDER BY SALARY * 12 DESC;
    -- ORDER BY "����" DESC; -- ��Ī ��� ����
    ORDER BY 2 DESC; -- �÷� ���� ��� ����(�÷� �������� ū ���� �ȵ�)
    
    
    






































































































































































































