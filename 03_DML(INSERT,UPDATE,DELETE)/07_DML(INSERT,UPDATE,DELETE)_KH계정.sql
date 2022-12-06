----

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


