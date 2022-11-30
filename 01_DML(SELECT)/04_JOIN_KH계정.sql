/*
    < JOIN >
    �� �� �̻��� ���̺��� �����͸� ��ȸ�ϰ��� �� �� ���Ǵ� ����
    ��ȸ ����� �ϳ��� �����(RESULT SET)�� ����
    
    ������ �����ͺ��̽��� �ּ����� �����ͷ� ������ ���̺� �����͸� ��� ����
    
    -- � ����� � �μ��� ���� �ִ��� �ñ���! �ڵ帻�� �̸�����
    => ������ �����ͺ��̽����� SQL���� �̿��� ���̺��� "����"�� �δ� ���
    (������ �� ��ȸ�� �ؿ��°� �ƴ϶� �� ���̺� ������ν��� �����͸� ��Ī�ؼ� ��ȸ�ؾ���)
    
                JOIN�� ũ�� "����Ŭ ���뱸��"�� "ANSI ����" (ANSI == �̱�����ǥ����ȸ => �ƽ�Ű�ڵ�)
*/
SELECT EMP_NAME, EMP_ID, DEPT_CODE
FROM EMPLOYEE; -- DEPT_CODE

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT; -- DEPT_ID

-- ��ü ������� ���, �����, �μ��ڵ�, �μ��� ��ȸ�ϰ��� �� ��
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE;

-- ��ü ������� ���, �����, �����ڵ�, ���޸� ��ȸ�ϰ��� �� ��
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE; -- JOB_CODE

SELECT *
FROM JOB; -- JOB_CODE

/*
    < � ���� >
    EQUAL JOIN / INNER JOIN
    �����Ű�� �÷��� ���� ��ġ�ϴ� ��鸸 ���εǼ� ��ȸ
    => ��ġ�ϴ� ���� ���� ���� ��ȸ���� ���� (�ִ� �͸� ���´ٴ� �Ҹ�)
    => NULL�� �ƴ� �͸� ���´�

*/

-- >> ����Ŭ ���� ���� !!
-- FROM ���� ��ȸ�ϰ��� �ϴ� ���̺�� �ϴ� ����
-- (,) �� �����ؾ� ��
-- WHERE���� ��Ī��ų �÷� (�����)�� ���� ������ ������

-- 1. ������ �� �÷� �̸��� �ٸ� ���(EMP : DEPT_CODE, DEP : DEPT_ID)
-- ���, �����, �μ��ڵ�, �μ��� ���� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_ID, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID;
-- ��ġ�ϴ� ���� ���� ���� ��ȸ���� ���ܵ� �� Ȯ�� ����
-- => DEPT_CODE�� NULL�� �ƴ� �ֵ鸸 ������
-- => �������̺� �ִ� ���鸸 ��� ������(D3, D7�̷��ֵ��� ������ �ʾ���)



-- 2. ������ �� �÷� �̸��� ���� ���(EMP : JOB_CODE, DEP : JOB_CODE)
-- ���, �����, �����ڵ�, ���޸�
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE JOB_CODE = JOB_CODE; -- �ȵǴ� ����
-- column ambiguously defined : ��ȣ�ϰ� ���ǵ� �÷�

-- �ذ��� 1. ���̺���� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, JOB.JOB_CODE, JOB_NAME
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

-- �ذ��� 2. ���̺� ��Ī�� �ο��ؼ� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE;

-- >> ANSI ���� !!
-- FROM ���� ������ �Ǵ� ���̺��� �ϳ��� ����� ��

-- JOIN ���� ���� ��ȸ�ϰ��� �ϴ� ���̺� ��� 
-- + ��Ī��ų �÷��� ���� ���ǵ� ���� ���

-- JOIN USING, JOIN ON

-- 1) ������ �� �÷����� �ٸ� ���(EMP : DEPT_CODE, DEP : DEPT_ID)
-- ������ JOIN ON �̶�� �������θ� ����
-- ���, �����, �μ��ڵ�, �μ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- 2) ������ �� �÷����� �������(EMP : JOB_CODE, JOB : JOB_CODE)
-- JOIN ON, JOIN USING ������ ��밡��
-- ���, �����, �����ڵ�, ���޸�
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB ON (JOB_CODE = JOB_CODE); -- �� �Ǵ� ����

-- �ذ��� 1) ���̺�� �Ǵ� ��Ī�� �̿��ϴ� ���
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON (J.JOB_CODE = E.JOB_CODE);

-- �ذ��� 2) JOIN USING ���� ����ϴ� ���
-- *****���÷����� ��ġ�� ���� ��밡��!!!!
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);

-- �������
-- �ڿ�����(NATUAL JOIN, ANSI������ ��� ����)
-- : �� ���̺��� ������ �÷��� �� �Ѱ��� ������ ���
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB;

-- ������ �븮�� ����� �̸�, ���޸�, �޿� ��ȸ
-- ����Ŭ ���� ����
SELECT EMP_NAME, JOB.JOB_NAME, SALARY
FROM EMPLOYEE, JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE 
AND JOB_NAME = '�븮';

-- �Ƚ� ���� ����
SELECT EMP_NAME, JOB.JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB ON (EMPLOYEE.JOB_CODE = JOB.JOB_CODE)
WHERE JOB_NAME = '�븮';

SELECT EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '�븮';


-- �ǽ�����
-- 1. �μ��� �λ�������� ������� ���, �̸�, ���ʽ� ��ȸ
-- ����Ŭ
SELECT *
FROM DEPARTMENT;

SELECT *
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID AND DEPT_TITLE = '�λ������';

-- �Ƚ�
SELECT EMP_ID, EMP_NAME, BONUS
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
WHERE DEPT_TITLE = '�λ������';

-- 2. DEPARTMENT�� LOCATION ���̺��� ������ 
-- ��ü�μ��� �μ��ڵ�, �μ���, �����ڵ�, ������ ��ȸ
-- ����Ŭ

SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;


-- �Ƚ�
SELECT DEPT_ID, DEPT_TITLE, LOCATION_ID, LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);


-- 3. ���ʽ��� �޴� ������� ���, �����, ���ʽ�, �μ��� ��ȸ
-- ����Ŭ

SELECT *
FROM EMPLOYEE;

SELECT *
FROM DEPARTMENT;

SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND BONUS IS NOT NULL;

-- �Ƚ�
SELECT EMP_ID, EMP_NAME, BONUS, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
WHERE BONUS IS NOT NULL;

-- 4. �μ��� �ѹ��ΰ� �ƴ� ������� �����, �޿�, �μ��� ��ȸ
-- ����Ŭ
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND NOT DEPT_TITLE = '�ѹ���';
-- �Ƚ�
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_ID = DEPT_CODE)
WHERE NOT DEPT_TITLE = '�ѹ���';

--------------------------------------------------------------------------------
/*
    < ���� ���� >
    = �ܺ� ����, OUTER JOIN
    : �� ���̺��� JOIN�� ��ġ���� �ʴ� �൵ ���Խ��Ѽ� ��ȸ����
    ��, �ݵ�� LEFT / RIGHT �����ؾߵ�! (������ �Ǵ� ���̺� ����)
*/
-- �ܺ� ���ΰ� ���Ҹ��� INNER JOIN ��ȸ�صα�
-- ���� �ֱ� 
-- �����, �μ���, �޿�, ����


-- �Ƚ� ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID); -- 21��
-- �μ���ġ�� ���� �ȵ� ��� 2�� ���� ������ ��ȸ XXX
-- �μ��� ������ ����� ���� �μ� ���� ��쵵 ��ȸ�� �ȵ�

-- 1. LEFT [OUTER] JOIN : �� ���̺� �� ���� ����� ���̺� �������� JOIN
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE -- EMPLOYEE�� �ִ� �� �� ����
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- �μ���ġ�� ���� �ʾҴ� ������ 2���� ��� ������ ���

-- 2. RIGHT [OUTER] JOIN : �� ���̺� �� ������ ����� ���̺� �������� JOIN
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE 
RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- DEPARTMENT�� �ִ� �� �� ����


-- ����Ŭ ����
-- EMPLOYEE(LEFT)�� �ִ� ��� �� ������ ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);

-- DEPARTMENT(RIGHT)�� �ִ� ��� �� ������ ����
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

/*
    < FULL [OUTER] JOIN > *** �Ƚ� ����!!!!!!!!!
    : �� ���̺��� ���� ��� ���� ��ȸ�� �� ����
    ��, ����Ŭ ���뱸�����δ� �ȵ�
    

*/
SELECT EMP_NAME, DEPT_TITLE, SALARY, SALARY * 12
FROM EMPLOYEE
FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- ���ʿ��� NULL �� ���� ���� ���

---------------------------------------------------------------------------

/*
    < ��ü ���� : SELF JOIN > 
    ���� ���̺��� �ٽ� �ѹ� �����ϴ� ���
*/
SELECT * FROM EMPLOYEE;
-- ��ü ����� ���, �����, ����� �μ��ڵ� : EMPLOYEE E�� ��� ���⼭ MANAGER ID��
-- ����� ���, �����, ����� �μ��ڵ� : EMPLOYEE, M���� ��� ���⼭�� EMP_ID

-- ����Ŭ ���� ����
SELECT E.EMP_ID, E.EMP_NAME,E.DEPT_CODE, 
        M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID;

-- �Ƚ� ���� ����
SELECT E.EMP_ID, E.EMP_NAME,E.DEPT_CODE, 
        M.EMP_ID, M.EMP_NAME, M.DEPT_CODE
FROM EMPLOYEE E
FULL JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);
---------------------------------------------------------------------------

/*
    < ���� ���� >
    2�� �̻��� ���̺��� ������ JOIN�� ��
    
*/

-- ���, �����, �μ���, ���޸�

SELECT * -- DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

SELECT * -- DEPT_ID
FROM DEPARTMENT;

SELECT * -- JOB_CODE
FROM JOB;

-- ����Ŭ ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J -- JOB_CODE �����ϱ� ���� �ٿ��ֱ�
WHERE (DEPT_CODE = DEPT_ID) AND (E.JOB_CODE = J.JOB_CODE);

-- �Ƚ� ����
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON (DEPT_CODE = DEPT_ID)
JOIN JOB J USING(JOB_CODE);



-- ���, �����, �μ���, ������


SELECT * FROM EMPLOYEE; -- DEPT_CODE 
SELECT * FROM DEPARTMENT; -- DEPT_ID, LOCATION_ID
SELECT * FROM LOCATION; -- LOCAL_CODE

-- ����Ŭ ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION
WHERE (DEPT_CODE = DEPT_ID) 
AND (LOCATION_ID = LOCAL_CODE);

-- �Ƚ� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);




-- �������� �ǽ�����

SELECT * FROM EMPLOYEE; -- DEPT_CODE
SELECT * FROM DEPARTMENT; -- DEPT_ID, LOCATION_ID
SELECT * FROM LOCATION; -- LOCAL_CODE
SELECT * FROM SAL_GRADE;

-- 1. ���, �����, �μ���, ������, ������ ��ȸ


-- ����Ŭ ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE, LOCAL_NAME
FROM EMPLOYEE, DEPARTMENT, LOCATION
WHERE DEPT_CODE = DEPT_ID AND LOCATION_ID = LOCAL_CODE;

-- �Ƚ� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE, LOCAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

-- 2. ���, �����, �μ���, ���޸�, ������ ������ �ش� �޿� ��޿��� ���� �� �ִ� �ִ� �ݾ� ( �� ����)

-- ����Ŭ ����


SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE, LOCAL_NAME, MAX_SAL
FROM EMPLOYEE E, DEPARTMENT, LOCATION, SAL_GRADE S
WHERE E.SAL_LEVEL = S.SAL_LEVEL AND  DEPT_CODE = DEPT_ID AND LOCATION_ID = LOCAL_CODE;

/*
    ���� �����ֱ�
    
    SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME, N.NATIONAL_NAME, L.LOCAL_NAME, M.MAX_SAL
    FROM EMPLOYEE E, DEPARTMENT D, JOB J,  LOCATION L, NATIONAL N, SAL_GRADE S
    WHERE E.DEPT_CODE = D.DEPT_ID 
    AND E.JOB_CODE = J.JOB_CODE
    AND D.LOCATION_ID = L.LOCAL_CODE
    AND L.NATIONAL_CODE = N.NATIONAL_CODE
    AND E.SAL_LEVEL = S.SAL_LEVEL
*/

-- �Ƚ� ����
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE, LOCAL_NAME, MAX_SAL
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
JOIN SAL_GRADE USING(SAL_LEVEL);

/*
    
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE, LOCAL_NAME, MAX_SAL
FROM EMPLOYEE E
JOIN DEPARTMENT ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB USING (JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN SAL_GRADE USING(SAL_LEVEL);

*/

-- 2. ���, �����, �μ���, ���޸�, ������, ������ �ش� �޿� ��޿��� ���� �� �ִ� �ִ� �ݾ� ( �� ����)
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM JOB;
SELECT * FROM LOCATION;
SELECT * FROM NATIONAL;
SELECT * FROM SAL_GRADE;


-- ����Ŭ ����
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_ID, J.JOB_NAME, L.LOCAL_NAME, N.NATIONAL_NAME, S.MAX_SAL
FROM EMPLOYEE E, DEPARTMENT D, JOB J, LOCATION L, NATIONAL N, SAL_GRADE S
WHERE E.DEPT_CODE = D.DEPT_ID
AND E.JOB_CODE = J.JOB_CODE
AND D.LOCATION_ID = L.LOCAL_CODE
AND N.NATIONAL_CODE = L.NATIONAL_CODE
AND S.SAL_LEVEL = E.SAL_LEVEL;

-- �Ƚ� ����
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_ID, J.JOB_NAME, L.LOCAL_NAME, N.NATIONAL_NAME, S.MAX_SAL
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J USING (JOB_CODE)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN SAL_GRADE S USING(SAL_LEVEL);