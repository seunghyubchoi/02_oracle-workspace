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



















































































































































































































































































