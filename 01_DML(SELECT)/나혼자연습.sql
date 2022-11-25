/*
    < SELECT >
    ������ ��ȸ�� �� ���Ǵ� �����Դϴ�

    >> RESULT SET : SELECT���� ���� ��ȸ�� �����
    ��, ��ȸ�� ����� ������ �ǹ��մϴ�
    
    < ǥ���� >
    SELECT ��ȸ�ϰ��� �ϴ� Į��1, Į��2, Į��3 ...
    FROM ���̺��;
    
    ��ȸ�� �� ���� �ݵ�� �����ϴ� Į���� �̸��� ����� ���ٴϴ�
    => ���� Į���� ���� ������ ���ϴ�
    ����ƤǾƾ�ASDASDSADADSAasdfsaf sd
*/

-- EMPLOYTEE �� COLUMN_NAME Ȯ��.
-- DB�� ���ڿ��� ����(VARCHAR2, CHAR ��� ���ڿ�)

-- EMPLOYEE ���̺��� ��� �÷��� ��ȸ�սô�
-- SELECT EMP_ID, EMP_NAME, EMP_NO... = ��ȿ������ ��ȸ ���
-- �Ʒ��� ���� ��ȸ�սô�

SELECT *
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� ���, �̸�, �޿� ��ȸ
SELECT *
FROM EMPLOYEE;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, ����� ����(�޿� * 12) ��ȸ
SELECT EMP_NAME, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE ���̺��� �����, �޿�, ����, ���ʽ��� ���Ե� ���� ((�޿� + (���ʽ� * �޿�)) * 12) ��ȸ
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
SELECT EMP_ID AS "���", EMP_NAME AS "�̸�", SALARY AS "�޿�"
FROM EMPLOYEE;


/*
    < ���� ������ : ||>
    ���� �÷������� ��ġ �ϳ��� �÷��ΰ�ó�� �����ϰų�,
    �÷����� ���ͷ��� ������ �� ����
    System.out.println("num�� �� : " + num);
*/

-- EMPLOYEE ���, �̸�, �޿��� �ϳ��� �÷����� ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY AS "���, �̸�, �޿�"
FROM EMPLOYEE;

-- �÷����̶� ���ͷ� ����
-- XXX�� ������ XXX�� �Դϴ�
SELECT EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�.' AS "��������"
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

-- 1. �޿��� 3�鸸�� �̻��� ������� �����, �޿�, �Ի���, ����(���ʽ� ������) ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE, SALARY * 12
FROM EMPLOYEE
WHERE SALARY >= 3000000;

-- 2. ������ 5õ���� �̻��� ������� �����, �޿�, ����(���ʽ� ������), �μ� �ڵ� ��ȸ
SELECT EMP_NAME, SALARY, SALARY * 12, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY * 12 >= 50000000;


-- ���� ���� ���� : 
-- FROM�� => WHERE�� => SELECT��
-- SELECT���� ��Ī�� �� ���α׷��� ���ư��� ������ ����
-- SELECT�� ���� WHERE���� ���� Ȯ���ϱ� ������ 
-- WHERE���� ���� * 12 >= 50000000; �������� �ʴ�

-- 3. �����ڵ尡 'J3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

-- �μ��ڵ尡 'D9'�̸鼭 �޿��� 500���� �̻��� ������� ���, �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY >= 5000000;

-- �μ��ڵ尡 'D6'�̰ų� �޿��� 3�鸸�� �̻���
-- ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- �޿��� 350���� �̻� 600���� ���ϸ� �޴� ������� �����, ���, �޿� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000 AND SALARY <= 6000000;

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
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

-- �Ի����� '90/01/01' ~'01/01/01' ��� �÷� ��ȸ(BETWEEN)
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND ' 01/01/01';

-- ����� �� ���� '��'���� ������� ����� �޿� �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- �̸� �߿� '��'�� ���Ե� ������� �����, �ֹι�ȣ, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- �̸� �߿� �̸��� ��� ���ڰ� '��'�� ������� �����, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

-- ��ȭ��ȣ�� 3��° �ڸ��� 1�� ������� ���, �����, ����, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- �̸��� �� '_' �������� �ձ��ڰ� 3������ ������� ���, �̸�, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';


-- ���� ������� �ƴ� �� ���� ����� ��ȸ

SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE NOT EMAIL LIKE '___$_%' ESCAPE '$';

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

/*
    < IS NULL / IS NOT NULL >
    �÷����� NULL�� ���� ���, NULL �� �񱳿� ���Ǵ� ������
    
*/

-- ���ʽ��� ���� �ʴ� ���(BONUS�� ���� NULL)
-- ���, �̸�, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL;

-- �μ���ġ�� ���� ������ �ʾ����� ���ʽ��� �޴�
-- ��� �̸�, ���ʽ�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;

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
WHERE DEPT_CODE IN ('D6', 'D8', 'D5');

-- �����ڵ尡 'J7' �̰ų� 'J2'�� ����� ��
-- �޿��� 200���� �̻��� ������� ��� �÷� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE IN ('J7', 'J2') AND SALARY >= 2000000;




