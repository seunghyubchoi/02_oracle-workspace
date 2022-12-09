/*

    < VIEW �� >
    SELECT��(��������)�� ������ �� �� �ִ� ��ü
    (���� ���� �� SELECT���� �����صθ� �� �� SELECT���� �Ź� �ٽ� ����� �ʿ� ����!)
    �ӽ����̺� ���� ����
    = ������ �����ϴ� �� �ƴ�
    �������� ���̺� : ���� 
    ������ ���̺� : ���� => ��� ������ ���̺�
    
*/
-- �� ����� ���� ������ ������ �ۼ�
-- ������ ������

-- '�ѱ�'���� �ٹ��ϴ� ������� ���, �̸�, �μ���, �޿� �Ǵ� �ٹ� ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�ѱ�';

-- '���þ�'���� �ٹ��ϴ� ������� ���, �̸�, �μ���, �޿� �Ǵ� �ٹ� ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '���þ�';

-- '�Ϻ�'���� �ٹ��ϴ� ������� ���, �̸�, �μ���, �޿� �Ǵ� �ٹ� ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
JOIN NATIONAL USING (NATIONAL_CODE)
WHERE NATIONAL_NAME = '�Ϻ�';


SELECT * FROM DEPARTMENT; -- LOCATION_ID
SELECT * FROM LOCATION; -- LOCAL_CODE   NATIONAL_CODE
SELECT * FROM NATIONAL; -- NATIONAL_CODE


-- �並 ����� ���ô�
/*

    1. �� ���� ���
    
    [ǥ����]
    CREATE [OR REPLACE] VIEW ��� 
    AS ��������;
    
    [OR REPLACE] : �� ������ ������ �ߺ��� �̸��� �䰡 ���ٸ� ������ �並 �����ϰ�, 
                             ������ �ߺ��� �̸��� �䰡 �ִٸ� �ش� �並 ����(����)�ϴ� �ɼ�
    
*/

CREATE VIEW VW_EMPLOYEE 
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
    FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
    JOIN NATIONAL USING (NATIONAL_CODE);
    -- ORA-01031: insufficient privileges
    -- privileges : ����
    
    -- ������ ������ �����ؼ� �Ʒ� ���� ������ ���� �ο�
    GRANT CREATE VIEW TO KH;

-- �̰� ���� �ִ� ���̺��� �ƴ�, �׷��� ���� �� ���̺��ΰ���
SELECT * FROM VW_EMPLOYEE;

-- �Ʒ��� ���� �ƶ�
SELECT *
FROM ( SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME
    FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
    JOIN NATIONAL USING (NATIONAL_CODE)
); -- �̰� �ζ��κ�, ������ ��

-- ��� ������ ���� ���̺� �������� �����͸� �����ϰ� ���� ����

-- �ѱ� ���þ� �Ϻ��� �ٹ��ϴ� ���
SELECT * 
FROM VW_EMPLOYEE
WHERE NATIONAL_NAME = '�ѱ�';

SELECT * 
FROM VW_EMPLOYEE
WHERE NATIONAL_NAME = '���þ�';

SELECT * 
FROM VW_EMPLOYEE
WHERE NATIONAL_NAME = '�Ϻ�';

-- ����
SELECT * FROM USER_VIEWS;

-- ���࿡ �信�ٰ� �� �ϳ� �� �߰��ϰ� ����

CREATE OR REPLACE VIEW VW_EMPLOYEE 
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, BONUS
    FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
    JOIN NATIONAL USING (NATIONAL_CODE);
-- ORA-00955: name is already used by an existing object
-- �̹� �ش� �̸��� ���� �䰡 �ִٰ� ������ ��

----------------------------------------------------------------------------------

/* 
    �� �÷��� ��Ī �ο�
    ���������� SELECT���� �Լ����̳� ���������� ����Ǿ� ���� ���
    �ݵ�� ��Ī �����ؾ���!!
*/

-- �� ����� ���, �̸�, ���޸�, ����, �ٹ������ ��ȸ�� �� �ִ� SELECT���� ��(VW_EMP_JOB)�� ����
CREATE OR REPLACE VIEW VW_EMP_JOB
AS SELECT EMP_ID, EMP_NAME, JOB_NAME,
          DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��') AS "����",
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) AS "�ٹ����"
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);
-- ORA-00998: must name this expression with a column alias
-- ALIAS = ��Ī

SELECT * FROM VW_EMP_JOB; -- ������ �̷� ���̺��� �ִ°� �ƴ�


-- �Ʒ��� ���� ������ε� ��Ī�ο�����
CREATE OR REPLACE VIEW VW_EMP_JOB(���, �̸�, ���޸�, ����, �ٹ����)
-- �� ��� �÷��� ���ؼ� ��Ī�� �ο��ؾ���
AS SELECT EMP_ID, EMP_NAME, JOB_NAME,
          DECODE(SUBSTR(EMP_NO, 8, 1), 1, '��', 2, '��'),
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE);

-- ������ ������ ������� �̸�, ���޸� ��ȸ�Ͻÿ�
SELECT �̸�, ���޸� 
FROM VW_EMP_JOB
WHERE ���� = '��';

-- �ٹ������ 20�� �̻�� ������� ���, �̸�, ���޸�, ����, �ٹ���� ���ض�
SELECT ���, �̸�, ���޸�, ����, �ٹ���� -- *
FROM VW_EMP_JOB
WHERE �ٹ���� >= 20;

-- �並 �����ϰ� �ʹٸ�?
DROP VIEW VW_EMP_JOB;


-----------------------------------------------------------------------------

-- ������ �並 �̿��ؼ� DML(INSERT, UPDATE, DELETE) ��� ����
-- �並 ���ؼ� ������ �ϴ��� ���� �����Ͱ� ����ִ� ���̽����̺� �ݿ���
-- �ٵ� �� �ȵǴ� ��찡 ���Ƽ� �����δ� ���� ���� ����

CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_CODE, JOB_NAME 
FROM JOB;

SELECT * FROM VW_JOB; -- ������ ���̺�(���������Ͱ� ��������� ����)
SELECT * FROM JOB; -- ���̽����̺�(���� �����Ͱ� �������)

-- �並 ���ؼ� INSERT
INSERT INTO VW_JOB
VALUES('J8', '����');

-- �並 ���ؼ� UPDATE
UPDATE VW_JOB
SET JOB_NAME = '�˹�'
WHERE JOB_CODE = 'J8';

-- �並 ���ؼ� DELETE
DELETE FROM VW_JOB
WHERE JOB_CODE ='J8';

-----------------------------------------------------------------------------

/*

    ��, DML ��ɾ�� ������ �Ұ����� ��찡 �� ����
    1. �信 ���ǵǾ� ���� ���� �÷��� �����Ϸ��� �ϴ� ���
    2. �信 ���ǵǾ� ���� ���� �÷� �߿� ���̽����̺� �� NOT NULL ���������� �����Ǿ� �ִ� ���
    3. �������� �Ǵ� �Լ������� ���� �Ǿ� �ִ� ���
    4. �׷��Լ��� GROUP BY ���� ���Ե� ���
    5. DISTINCT ������ ���Ե� ���
    6. JOIN�� �̿��ؼ� ���� ���̺��� ���� ���� ���� ���
    
*/

-- 1. �信 ���ǵǾ� ���� ���� �÷��� �����Ϸ��� �ϴ� ���
CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_CODE FROM JOB;

SELECT * FROM VW_JOB;
SELECT * FROM JOB;


--INSERT (����)
INSERT INTO VW_JOB(JOB_CODE, JOB_NAME)
VALUES('J8', '����');
-- ORA-00904: "JOB_NAME": invalid identifier

-- UPDATE (����)
UPDATE VW_JOB
SET JOB_NAME = '����'
WHERE JOB_CODE = 'J7';
-- ORA-00904: "JOB_NAME": invalid identifier

-- DELETE (����)
DELETE FROM VW_JOB
WHERE JOB_NAME = '���';
-- ORA-00904: "JOB_NAME": invalid identifier

-- 2. �信 ���ǵǾ� ���� ���� �÷� �߿� ���̽����̺� �� NOT NULL ���������� �����Ǿ� �ִ� ���
CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_NAME FROM JOB;

SELECT * FROM VW_JOB; -- JOB_CODE ����
SELECT * FROM JOB;


-- INSERT (����)
INSERT INTO VW_JOB
VALUES('����'); -- ���� ���̽����̺� INSERT�� ��, (NULL, '����')�� ���� ����
-- cannot insert NULL into ("KH"."JOB"."JOB_CODE")

-- UPDATE
UPDATE VW_JOB
SET JOB_NAME = '�˹�'
WHERE JOB_NAME = '���';
ROLLBACK;

-- DELETE (�� �����͸� ���� �ִ� �ڽ� �����Ͱ� �����ϱ� ������ ���� ����)
DELETE FROM VW_JOB
WHERE JOB_NAME = '���';
-- ORA-02292: integrity constraint (KH.SYS_C007165) violated - child record found

-- 3. �������� �Ǵ� �Լ������� ���� �Ǿ� �ִ� ���
CREATE OR REPLACE VIEW VW_EMP_SAL
AS SELECT EMP_ID, EMP_NAME, SALARY * 12 AS "����" FROM EMPLOYEE;

SELECT * FROM VW_EMP_SAL; -- ��
SELECT * FROM EMPLOYEE; -- ����

-- INSERT(����)
INSERT INTO VW_EMP_SAL
VALUES(400, '������', 3000000, 36000000);
-- SQL ����: ORA-01733: virtual column not allowed here
-- EMPLOYEE�� �����̶�� �÷� ����

-- UPDATE (����)
-- 200�� ����� ������ 80000��������
UPDATE VW_EMP_SAL
SET ���� = 8000000
WHERE EMP_ID = 200;
-- SQL ����: ORA-01733: virtual column not allowed here

-- 200 ����� �޿��� 700��������
UPDATE VW_EMP_SAL
SET SALARY = 7000000
WHERE EMP_ID = 200;

ROLLBACK;

-- DELETE
DELETE FROM VW_EMP_SAL
WHERE ���� = 72000000;

SELECT * FROM VW_EMP_SAL;

ROLLBACK;

-- 4. �׷��Լ��� GROUP BY ���� ���Ե� ���
CREATE OR REPLACE VIEW VW_GROUPDEPT
AS SELECT DEPT_CODE, SUM(SALARY) "�հ�", FLOOR(AVG(SALARY)) "���"
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT * FROM VW_GROUPDEPT;

-- INSERT (����)
INSERT INTO VW_GROUPDEPT VALUES('D3', 8000000, 4000000);
-- SQL ����: ORA-01733: virtual column not allowed here
-- ���� EMPLOYEE�� ���� �÷��� ����

-- UPDATE(����)
UPDATE VW_GROUPDEPT
SET �հ� = 8000000
WHERE DEPT_CODE = 'D1';
-- SQL ����: ORA-01732: data manipulation operation not legal on this view
-- ���� ��� �����ϱⰡ �ָ���

-- 5. DISTINCT ������ ���Ե� ���
CREATE OR REPLACE VIEW VW_DT_JOB
AS SELECT DISTINCT JOB_CODE FROM EMPLOYEE;
SELECT * FROM VW_DT_JOB;
-- INSERT 
INSERT INTO VW_DT_JOB VALUES('J8');

-- UPDATE (����) => �信 DISTINCT ������ �־ �ȵ�
UPDATE VW_DT_JOB
SET JOB_CODE = 'J8'
WHERE JOB_CODE = 'J7';

--  6. JOIN�� �̿��ؼ� ���� ���̺��� ���� ���� ���� ���
CREATE OR REPLACE VIEW VW_JOINEMP
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

SELECT * FROM VW_JOINEMP;

-- INSERT(����)
INSERT INTO VW_JOINEMP
VALUES(300, '�����', '������̺�');

-- UPDATE
UPDATE VW_JOINEMP
SET DEPT_TITLE = 'ȸ���'
WHERE EMP_ID ='200';

-- DELETE
DELETE FROM VW_JOINEMP
WHERE EMP_ID = 200;

ROLLBACK;

-------------------------------------------------------------------------------
/*

    !!VIEW �ɼ�!!
    
    [��ǥ����]
    
    CREATE [OR REPLACE] [FORCE | "NOFORCE"] VIEW ��� 
    AS ��������
    [WITH CHECK OPTION]
    [WITH READ ONLY] = ������ ��ȸ�� ����(DML �ȵ�!!)
    
    1. OR REPLACE : ������ ������ �䰡 ���� ��� ���� ��Ű��, �������� ������ ������ ������Ų��
    2. FORCE | "NOFORCE" : 
        > FORCE          : ���������� ����� ���̺��� �������� �ʾƵ� �䰡 �����ǰ� �ϴ�
        > NOFORCE        : ���������� ����� ���̺��� �����ϴ� ���̺��̿��߸� �䰡 �����ǰ� �ϴ�(NOFORCE�� ����Ʈ ��)
    3. WITH CHECK OPTION : DML�� ���������� ����� ���ǿ� ������ �����θ� DML �����ϵ���
    4. WITH READ ONLY    : �信 ���� ��ȸ�� ���� (DML ����Ұ�)
    
*/

-- 2. FORCE | "NOFORCE" : 
-- >  NOFORCE : ���������� ����� ���̺��� �����ϴ� ���̺��̿��߸� �䰡 �����ǰ� �ϴ�(NOFORCE�� ����Ʈ ��)
CREATE OR REPLACE /*NOFORCE*/ VIEW VW_EMP
AS SELECT TCODE, TNAME, TCONTENT
FROM TT;
-- ORA-00942: table or view does not exist ���̺�� �̻��ϰ� ���� ���� �� �� �ִ� ����
-- �ش� ���̺��� ��� ������, ���� �䵵 ���� �� ��

-- > FORCE: ���������� ����� ���̺��� �����ϴ� ���̺��̿��߸� �䰡 �����ǰ� �ϴ�(NOFORCE�� ����Ʈ ��)
CREATE OR REPLACE FORCE VIEW VW_EMP
AS SELECT TCODE, TNAME, TCONTENT
FROM TT;
-- ORA-00942: table or view does not exist 
-- ���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.
-- ���߿� TT��� ���̺��� ��������� ��� �� ���� ����
SELECT * FROM VW_EMP;
-- ���������� ������ ��ȸ�� �ȵ�

CREATE TABLE TT(
    TCODE NUMBER,
    TNAME VARCHAR2(20),
    TCONTENT VARCHAR2(50)
);

-- 3. WITH CHECK OPTION : ���������� ����� ���ǿ� �������� �ʴ� ������ ������ ���� �߻�
-- WITH CHECK OPTION �Ⱦ���
CREATE OR REPLACE VIEW VW_EMP
AS SELECT *
FROM EMPLOYEE
WHERE SALARY >= 3000000;

SELECT * FROM VW_EMP;

-- 200�� ����� �޿��� 200�������� ����
UPDATE VW_EMP
SET SALARY = 2000000
WHERE EMP_ID = 200;

ROLLBACK;

-- WITH CHECK OPTION ����
CREATE OR REPLACE VIEW VW_EMP
AS SELECT *
FROM EMPLOYEE
WHERE SALARY >= 3000000
WITH CHECK OPTION;

SELECT * FROM VW_EMP;

-- 200�� ����� �޿��� 200�������� ����
UPDATE VW_EMP
SET SALARY = 2000000
WHERE EMP_ID = 200;
-- ORA-01402: view WITH CHECK OPTION where-clause violation
-- ��������
ROLLBACK;

--  4. WITH READ ONLY : �信 ���� ��ȸ�� ���� (DML ����Ұ�)
CREATE OR REPLACE VIEW VW_EMP
AS SELECT EMP_ID, EMP_NAME, BONUS
    FROM EMPLOYEE
    WHERE BONUS IS NOT NULL
WITH READ ONLY;

SELECT * FROM VW_EMP;

DELETE FROM VW_EMP
WHERE EMP_ID = 200;
-- SQL ����: ORA-42399: cannot perform a DML operation on a read-only view