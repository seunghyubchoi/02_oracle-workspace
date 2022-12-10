

/*
    DQL (QUERY ������ ���� ���) : SELECT

    DML (MANIPULATION ������ ���� ���) : (SELECT), INSERT, UPDATE, DELETE
    DDL (DEFINITION ������ ���� ���) : CREATE, ALTER, DROP
    DCL (CONTROL ������ ���� ���) : GRANT, REVOKE (COMMIT, ROLLBACK)
    
    TCL (TRANSACTION Ʈ������ ���� ���) : COMMIT, ROLLBACK


    DML
    : DATA MANIPULATOIN LANGUAGE
    : ������ ���� ���
    : ���̺� ���� ����(INSERT)
                    ����(UPDATE)
                    ����(DELETE) �ϴ� ����
*/

/*
    1. INSERT
        ���̺� ���ο� ���� �߰��ϴ� ����
        
        [ǥ����]
        1. INSERT INTO ���̺�� VALUES(��1, ��2..)
            ���̺� ��� �÷��� ���� ���� ���� �����ؼ� �� �� INSERT �ϰ��� �� �� ���
            �÷� ������ ���Ѽ� VALUES�� ���� �����ؾߵ�
            
        �����ϰ� ���� �������� ��� => not enough values ����!
        ���� �� ���� �������� ��� => too many values ����
*/

INSERT INTO EMPLOYEE
VALUES(900, '������', '900101-1234567', 'cha_00@kh.or.kr', '01011112222',
        'D1', 'J7', 'S3', 4000000, 0.2, 200, SYSDATE, NULL, DEFAULT);

/*
    2. INSERT INTO ���̺��(�÷���1, �÷���2..) VALUES(��1, ��2..)
        ���̺� ���� ������ �÷��� ���� ���� INSERT �� �� ���
        ������ �ȵ� �÷��� �⺻�����δ� NULL�� ��
        => NOT NULL ���������� �ɷ��ִ� �÷��� �ݵ�� �����ؼ� ���� ���� �����ؾߵ�!!
        ��, DEFAULT ���� �ִ� ���� NULL�� �ƴ� DEFAULT�� ����
*/

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES(901, '������', '880202-1111111', 'J2', 'S2', SYSDATE);
-- ENT_YN�� ����Ʈ ������ �� ����!!
-- ������ �� ���� ����


INSERT 
    INTO EMPLOYEE
        (
              EMP_ID
            , EMP_NAME
            , EMP_NO
            , JOB_CODE
            , SAL_LEVEL
            , HIRE_DATE
        )
    VALUES
        (
               901
            , '������'
            , '880202-1111111'
            , 'J2'
            , 'S2'
            , SYSDATE
        );

SELECT * FROM EMPLOYEE;

/*
    3. INSERT INTO ���̺�� (��������)
        VALUES�� ��, ���� ����ϴ� �� ��ſ�
        ���������� ��ȸ�� ��� ���� ��°�� INSERT ����
        = (���� �� INSERT ����)
*/

CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_TITLE VARCHAR2(20)    
);

SELECT * FROM EMP_01;
-- ��ü ������� ���, �̸�, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE);

INSERT INTO EMP_01 (
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_ID = DEPT_CODE)
);

SELECT * FROM EMP_01;

INSERT 
INTO EMP_01
    (
      EMP_ID
    , EMP_NAME
    , DEPT_TITLE
    ) 
VALUES
    (
    888,'��ī��','ȣ�ںμ�'
    );
    
CREATE TABLE EMP_02(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    EMP_NO VARCHAR2(20),
    DEPT_CODE VARCHAR2(20),
    JOB_CODE VARCHAR2(20),
    LOCAL_NAME VARCHAR2(20)
);

DROP TABLE EMP_02;

INSERT INTO EMP_02(
SELECT EMP_ID, EMP_NAME, EMP_NO, DEPT_CODE, JOB_CODE, LOCAL_NAME
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
LEFT JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
);

SELECT * FROM EMP_02;

/*
    [ǥ����]
    INSERT ALL
    INTO ���̺��1 VALUES(�÷���, �÷���..)
    INTO ���̺��2 VALUES(�÷���, �÷���..)
    ��������;
*/

-- �׽�Ʈ�� ���̺� �����
-- ������ ������
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
    FROM EMPLOYEE
    WHERE 1=0;
    
SELECT * FROM EMP_DEPT;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
    FROM EMPLOYEE
    WHERE 1=0;
    
SELECT * FROM EMP_DEPT;
SELECT * FROM EMP_MANAGER;

-- �μ��ڵ尡 'D1'�� ������� ���, �̸�, �μ��ڵ� , �Ի���, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

INSERT ALL
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

-- ������ ����ؼ��� �� ���̺� �� INSERT ����
-- 2000�⵵ ���� �Ի��� �Ի��ڵ鿡 ���� �������� ���̺�
-- ���̺� ������ �貸�� ���� �����(AS �� WHERE 1=0; ���)

-- EMP_OLD
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1=0;
-- EMP_NEW   
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1=0;
    
SELECT * FROM EMP_OLD; -- 2000�⵵ ���� �Ի���
SELECT * FROM EMP_NEW; -- 2000�⵵ ���� �Ի���

/*
    [ǥ����]
    
    INSERT ALL
    WHEN ����1 THEN 
        INTO ���̺��1 VALUES(�÷���, �÷���..)
    WHEN ����2 THEN
        INTO ���̺��2 VALUES(�÷���, �÷���..)
    ��������;
*/

INSERT ALL
WHEN HIRE_DATE < '2000/01/01' THEN
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE > '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE;

SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

----------------------------------------------------------------------------------

/*
Create	==	INSERT (����)
Read(�Ǵ� Retrieve)	== SELECT �б�(�Ǵ� ����)	
Update	== UPDATE ����
Delete(�Ǵ� Destroy) ==	DELETE ����(�Ǵ� �ı�)
*/

/*
    3. UPDATE
    ���̺� ��ϵǾ� �ִ� ������ �����͸� �����ϴ� ����
    
    [ǥ����]
    UPDATE ���̺��
    SET �÷��� = �ٲ� ��, 
        �÷��� = �ٲ� ��,
        �÷��� = �ٲ� ��,
                      --> �������� �÷��� ���� ���� ����(,�� �����ؾ� �� AND�� ���� XXX)
    [WHERE ����];     --> �����ϸ� ��ü���� ������� �����Ͱ� ����ȴ� => �׷��� �� ������ ��� �ؾߵ�!!
                 
*/

-- ���纻 ���̺� ���� �� �۾�
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

ROLLBACK;

-- 'D9' �μ����� '������ȹ��'���� ����
UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��' -- �ѹ���
WHERE DEPT_ID ='D9';

-- ���纻
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
   FROM EMPLOYEE;
 

-- ���ö ����� �޿��� �鸸������, ������ �ּ����� ����صα�
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '���ö';

-- ������ ����� �޿��� ĥ�鸸������, ���ʽ��� 0.2�� ����
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '������';

SELECT * FROM EMP_SALARY;

UPDATE EMP_SALARY
SET SALARY = 1000000 -- 3700000
WHERE EMP_NAME = '���ö';

UPDATE EMP_SALARY
SET SALARY = 7000000, -- 8000000
    BONUS = 0.2 -- 0.3
WHERE EMP_NAME ='������';


-- ��ü ����� �޿��� ������ �޿��� 10���� �λ��� �ݾ� (���� �ݾ� * 1.1)
-- ��ü: ������� �׳� ����
SELECT * FROM EMP_SALARY;
UPDATE EMP_SALARY
SET SALARY = SALARY * 1.1;

-- UPDATE �� ���������� ��� ����
/*
    UPDATE ���̺��
    SET �÷��� = ��
    WHERE ����

    =

    UPDATE ���̺��
    SET �÷��� = ��������
    WHERE ����
*/

-- ���� ����� �޿�, ���ʽ� ���� ���缮 ����� �޿��� ���ʽ� ������ ����
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '����'; -- 1518000, NULL

SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '�����';

-- ������ ��������
UPDATE EMP_SALARY
SET SALARY = 
        (
        SELECT SALARY FROM EMP_SALARY
        WHERE EMP_NAME = '�����'
        ),
    BONUS = 
        (
        SELECT BONUS FROM EMP_SALARY
        WHERE EMP_NAME = '�����'
        )
WHERE EMP_NAME = '����';

-- ���߿� ��������
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME = '�����')
WHERE EMP_NAME = '����';

-- ASIA �������� �ٹ��ϴ� ������� ���ʽ� ���� 0.3���� ����
SELECT *
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE LOCAL_NAME LIKE 'ASIA%';

UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE EMP_NAME IN
            (
            SELECT EMP_NAME
            FROM EMP_SALARY
            JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
            JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
            WHERE LOCAL_NAME LIKE 'ASIA%'
            );   

-- UPDATE�ÿ��� �ش� �÷��� ���� �������� �����ϸ� �ȵ�
-- ����� 200���� ����� �̸��� NULL�� �����ϰڴ�

UPDATE EMPLOYEE
SET EMP_NAME = NULL
WHERE EMP_ID = '200'; -- ������
-- ORA-01407: cannot update ("KH"."EMPLOYEE"."EMP_NAME") to NULL
-- NOT NULL �������� ����

-- ���ö ����� �����ڵ带 J9�� ����
UPDATE EMPLOYEE
SET JOB_CODE = 'J9'
WHERE EMP_NAME = '���ö';
-- ORA-02291: integrity constraint (KH.SYS_C007165) violated - parent key not found
-- FOREIGN KEY �������� ����
--------------------------------------------------------------------------------
COMMIT;

/*
    4. DELETE
    ���̺� ��ϵ� �����͸� �����ϴ� ���� (�� �� ������ ������)
    
    [ǥ����]
    DELETE FROM ���̺��
    [WHERE ����;] -- ���� �� ���� ���� �׻� ��!!!
                  -- ���� ���� ���ϸ� ��ü �� ����
        
*/
-- ������ ����� ������ �����
SELECT * FROM EMPLOYEE
WHERE EMP_NAME = '������';
ROLLBACK;
DELETE FROM EMPLOYEE
WHERE EMP_NAME = '������';


COMMIT;

-- DEPT_ID�� D1�� �μ��� ����
SELECT * FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';
-- ORA-02292: integrity constraint (KH.SYS_C007164) violated - child record found
-- �ܷ�Ű �������� ����
-- D1�� ���� ������ ���� �ڽĵ����Ͱ� �ֱ� ������ ������ �ȵ�

SELECT * FROM EMPLOYEE
WHERE DEPT_CODE = 'D3';

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D3';

ROLLBACK;

-- * TRUNCATE : ���̺��� ��ü ���� ������ �� ���Ǵ� ����
--              DELETE���� ����ӵ��� ����
--              ������ ���� ���� �Ұ�, ROLLBACK �Ұ���

-- [ǥ����] TRUNCATE TABLE ���̺��;
SELECT * FROM EMPLOYEE_COPY3;
TRUNCATE TABLE EMPLOYEE_COPY3;
ROLLBACK;