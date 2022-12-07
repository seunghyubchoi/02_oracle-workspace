/*

    DDL (DATA DEFINITION LANGUAGE) : ������ ���� ���
    
    ��ü���� ����(CREATE), ����(ALTER), ����(DROP) �ϴ� ����
    
    < ALTER >
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    ALTER TABLE ���̺�� ������ ����, 
    
    * ������ ����?
    1. �÷� �߰� / ���� / ����
    2. �������� �߰� / ���� => ��, ������ �Ұ�(�����ϰ������ �����ϰ� ���� �߰�)
    3. �÷��� / �������Ǹ� / ���̺�� ���� ����
*/

-- 1. �÷� �߰� / ���� / ����
-- 1.1 �÷� �߰� (ADD) : ADD �÷��� �ڷ��� [DEFAULT �⺻��] [CONSTRAINT] ��������

-- DEPT_COPY ���̺� CNAME �÷� �߰�
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(30);
-- ���ο� �÷��� ��������� �⺻������ NULL�� ä����

-- LNAME �÷� �߰�, VARCHAR2(20), �⺻�� = �ѱ�
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR(20) DEFAULT '�ѱ�';

-- 1.2 �÷� ���� (MODIFY)
-- �ڷ��� ����          : MODIFY �÷��� �ٲٰ��� �ϴ� �ڷ���
-- DEFAULT ����         : MODIFY �÷��� DEFAULT �ٲٰ��� �ϴ� �⺻ ��

-- �ڷ��� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;
-- ORA-01439: column to be modified must be empty to change datatype
-- �̹� �����Ͱ� ���ڰ� �ƴ� ���� �����ϰ� �ֱ� ������
-- ������ ���ϸ� �����ϴ� �����Ͱ� ����� NUMBER Ÿ������ ���� ����

ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(10);
-- ORA-01441: cannot decrease column length because some value is too big
-- �̹� DEPT_TITLE �ȿ� 10����Ʈ�� �Ѵ� �����Ͱ� �ֱ� ������ ���� �Ұ���

-- DEPT_TITLE �÷��� VARCHAR2(50)����
-- LOCATION_ID �÷��� VARCHAR2(4)��
-- LNAME �÷��� �⺻ ���� '����'���� ����

ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(50);
ALTER TABLE DEPT_COPY MODIFY LOCATION_ID VARCHAR2(4);
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT '����';
-- ���� DEFAULT ���� �ٲ㵵 ������ �߰��� DEFAULT ���� �ٲ��� ����


-- ���� ���� ����
ALTER TABLE DEPT_COPY
    MODIFY DEPT_TITLE VARCHAR2(40)
    MODIFY LOCATION_ID VARCHAR2(2)
    MODIFY LNAME DEFAULT '�̱�';

-- 1.3 �÷� ����(DROP COLUMN) : DROP COLUMN �����ϰ��� �ϴ� �÷���
-- ������ ���� ���纻 ���̺� ����
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY;

SELECT * FROM DEPT_COPY2;

-- DEPT_COPY2 �κ��� DEPT_ID �÷� ����
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;

ALTER TABLE DEPT_COPY2
    DROP COLUMN DEPT_ID
    DROP COLUMN DEPT_TITLE;
-- ���� ������ �Ұ���

ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;
ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;

ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;
-- ORA-12983: cannot drop all columns in a table
-- ���̺� �ּ� �� ���� �÷��� �����ؾ� ��

-- 2. �������� �߰� / ����
/*
    2.1 �������� �߰�
    PRIMARY KEY : ADD PRIMARY KEY(�÷���)
    FOREIGN KEY : ADD FOREIGN KEY(�÷���) REFERENCES ���������̺�� ([�÷���])
    UNIQUE      : ADD UNIQUE(�÷���) 
    CHECK       : ADD CHECK(�÷��� ���� ����)
    NOT NULL    : MODIFY �÷��� NOT NULL | NULL => �̰ž��� NULL ���

    �������Ǹ��� �����ϰ��� �Ѵٸ� [CONSTRAINT �������Ǹ�] ��������
*/

--------------------------------------------------------------------------------
-- DEPT_ID �� PRIMARY KEY ���� ���� �߰� ADD
-- DEPT_TITLE �� UNIQUE ���� ���� �߰� ADD
-- LNAME�� NOT NULL �������� �߰� MODIFY

SELECT * FROM DEPT_COPY;


ALTER TABLE DEPT_COPY 
    ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)

    ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_TITLE)
  
    MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL;

-- 2.2 �������� ���� : DROP CONSTRAINT �������Ǹ�
-- NOT NULL�� ������ �ȵǰ� MODIFY NULL �̰ɷ� ����������Ѵ�

ALTER TABLE DEPT_COPY DROP CONSTRAINT DCOPY_PK;

ALTER TABLE DEPT_COPY
    DROP CONSTRAINT DCOPY_UQ
    MODIFY LNAME NULL;

ROLLBACK;
--------------------------------------------------------------------------------

-- 3. �÷��� / �������Ǹ� / ���̺�� ���� (RENAME)

-- 3.1 �÷��� ���� : RENAME COLUMN �����÷��� TO �ٲ��÷���

-- DEPT_TITLE => DEPT_NAME
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

-- 3.2 �������Ǹ� ���� : RENAME CONSTRAINT �������Ǹ� TO �ٲ� �������Ǹ�
-- SYS_C007212 => DCOPY_DID_NN
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C007212 TO DCOPY_DID_NN;

-- 3.3 ���̺�� ���� : RENAME [�������̺��] TO �ٲ����̺��
-- DEPT_COPY => DEPT_TEST
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST;

--------------------------------------------------------------------------------

-- ���̺� ����
DROP TABLE DEPT_TEST;

-- ��, ��򰡿��� �����ǰ� �ִ� �θ����̺��� �Ժη� �����ϸ� �ȵ�

-- ����, �����ϰ��� �Ѵٸ�

-- ��� 1. �ڽ����̺� ���� ������ �� �θ����̺� ����

-- ��� 2. �θ����̺� ������ �ϴµ� �������Ǳ��� ���� �����ϴ� ���
-- DROP TABLE ���̺�� CASCADE CONSTRAINT;