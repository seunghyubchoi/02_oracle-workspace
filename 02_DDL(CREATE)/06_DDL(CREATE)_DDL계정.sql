-- DDL ����� �����ϰ� ����� Ŀ�ؼ�, ���ҽ� ���� �ο��� ��!! (��PC)

/*
    * DDL (DATA DEFINITION LANGUAGE) : ������ ���� ���
    ����Ŭ���� �����ϴ� ��ü(OBJECT)�� ������ �����(CREATE), ������ �����ϰ�(ALTER)�ϰ�,
    ���� ��ü�� ����(DROP)�ϴ� ���
    ��, ���� ������ ���� �ƴ� ���� ��ü�� �����ϴ� ���
    �ַ� DB������, �����ڰ� �����.

    ����Ŭ���� �����ϴ� ��ü(����) : ���̺�(TABLE), ��(VIEW), ������(SEQUENCE),
                                  �ε���(INDEX), ��Ű��(PACKAGE), Ʈ����(TRIGGER),
                                  ���ν���(PROCEDURE), �Լ�(FUNCTION), ���Ǿ�(SYNONYM),
                                  �����(USER)

    < CREATE >
    ��ü�� ������ �����ϴ� ����
/

/
    1. ���̺� ����
    - ���̺��̶�? ��(ROW)�� ��(COLUMN)�� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü
                 ��� �����͵��� ���̺��� ���ؼ� �����!!
                 (DBMS ��� �� �ϳ���, �����͸� ������ ǥ ���·� ǥ���� ��!)

    [ ǥ���� ]
    CREATE TABLE ���̺��(
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���(ũ��),
        �÷��� �ڷ���,
        ...
    );

    * �ڷ���
    - ���� (CHAR(����Ʈũ��) | VARCHAR2(����Ʈũ��)) => �ݵ�� ũ�� ���� �ؾ���!!
CHAR : �ִ� 2000����Ʈ ���� ���� ����. ������ ���� �ȿ����� ����� / �������� (������ ũ�⺸�� �� �������� ���͵� �������� ä����)
             ������ ���ڼ��� �����͸��� ��� ��� ��� (GENDER, Y N)

VARCHAR2 : �ִ� 4000����Ʈ ���� ���� ����, �������� (���� ���� ���� ������ ũ�Ⱑ ������)
                 ������� �����Ͱ� ������ �𸣴� ��� ��� 


    - ���� (NUMBER)

    - ��¥ (DATE)

*/
--> ȸ���� ���� �����͸� ������� MEMBER ����
CREATE TABLE MEMBER (
    MEM_NO NUMBER,
    MEM_ID VARCHAR2(20),
    MEM_PWD VARCHAR2(20),
    MEM_NAME VARCHAR2(20),
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    MEM_DATE DATE
);


SELECT * FROM MEMBER;
-- ���� �÷��� ��Ÿ�� �߻��ߴٸ�?
-- �ٽ� ����� �ɱ�? ���� �����ϰ� �ٽ��ϵ� �ؾ���

-- ���� USER_TABLES; = ���� �� ������ ������ �ִ� ���̺� ���� �� �� ����
SELECT * FROM USER_TABLES;

-- ���� USER_TAB_COLUMNS; = �� ����ڰ� ������ �ִ� ���̺� ���� ��� �÷� �� �� ����
SELECT * FROM USER_TAB_COLUMNS;



--------------------------------------------------------------------------------

/*
    2. �÷��� �ּ� �ޱ� (�÷��� ���� ���� ���� ��)
    
    ǥ����
    COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�����';

    >> �� �� �ۼ��ؼ� �������� ��� ���� �� �ٽ� �����ϸ� ��!
        
*/
-- ���̺� �����ϰ��� �� �� : DROP TABLE ���̺��;
DROP TABLE MEMBER;



COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ������';
COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ����ȣ';

COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ����';
COMMENT ON COLUMN MEMBER.GENDER IS '����(��/��)';
COMMENT ON COLUMN MEMBER.PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.MEM_DATE IS 'ȸ��������';

-- ���̺� �����͸� �߰���Ű�� ���� (DML : INSERT)
-- INSERT INTO ���̺�� VALUES(��1, ��2, ...);

SELECT * FROM MEMBER;

-- INSERT INTO MEMBER VALUES(1, 'user01', 'pass01', '�����');
-- : �� �Է� �� �ϸ� ����

INSERT INTO MEMBER VALUES(1, 'user01', 'pass01', '�����', '��', '010-1111-2222', 'aaa@naver.com', '20/12/30');
INSERT INTO MEMBER VALUES(2, 'user02', 'pass02', 'Ȳ����', '��', null, Null, SYSDATE);
INSERT INTO MEMBER VALUES(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
-- ��ȿ���� ���� �����Ͱ� ���� ����, �ǹ̰� ���� ������
-- ���� �� ������ �ɾ�����
-------------------------------------------------------------------------------
/*
    < �������� CONSTRAINTS >
    - ���ϴ� ������ ��(��ȿ�� ������ ��)�� �����ϱ� ���ؼ� Ư�� �÷��� �����ϴ� ��������
    - ������ ���Ἲ ������ �������� �Ѵ�
    
    - ���� : NOT NULL, UNIQUE, CHECK, PRIMACY KEY, FOREIGN KEY
*/

/*
    < NOT NULL �������� >
    �ش� �÷��� �ݵ�� ���� �����ؾ��� ���
    (��, �ش� �÷��� ���� NULL�� ���ͼ��� �ȵǴ� ���)
    ���� �Ǵ� ���� �� NULL���� ������� �ʵ��� ����
    
    ���� ������ �ο��ϴ� ����� ũ�� 2������ ���� (�÷�������� / ���̺������)
    * NOT NULL ���������� ������ �÷�������� �ۿ� �ȵ�!!
*/
-- �÷�������� : �÷��� �ڷ��� �������� 
CREATE TABLE MEM_NOTNULL(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
);

SELECT * FROM MEM_NOTNULL;

INSERT INTO MEM_NOTNULL VALUES(1, 'user01', 'pass01', '�����', '��', null, null);
INSERT INTO MEM_NOTNULL VALUES(2, 'user02', null, 'Ȳ����', '��', null, 'aaa@naver.com');
-- ORA-01400: cannot insert NULL into ("DDL"."MEM_NOTNULL"."MEM_PWD")
-- �ǵ��ߴ���� ������!! (NOT NULL �������ǿ� ����Ǿ� ���� �߻�)
INSERT INTO MEM_NOTNULL VALUES(2, 'user01', 'pass01', 'Ȳ����', null, null, null);
-- ���̵� �ߺ��Ǿ� �������� �ұ��ϰ� �� �߰���?!
----------------------------------------------------------------------------------
/*
    < UNIQUE �������� >
    �ش� �÷��� �ߺ��� ���� ������ �� �� ���
    �÷� ���� �ߺ� ���� �����ϴ� ��������
    ���� / ������ ������ �ִ� ������ �� �� �ߺ����� ���� ��� ���� �߻�
*/

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE, -- �÷��������
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
);

SELECT * FROM MEM_UNIQUE;

DROP TABLE MEM_UNIQUE;

-- ���̺� ���� ��� : ��� �÷� �� ���� �� �� �������� ���
--                  : ��������(�÷���)
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    UNIQUE(MEM_ID) -- ���̺������
);

SELECT * FROM MEM_UNIQUE;
INSERT INTO MEM_UNIQUE VALUES(1, 'user01', 'pass01', '�����', null, null, null);
INSERT INTO MEM_UNIQUE VALUES(2, 'user01', 'pass02', 'Ȳ����', null, null, null);
-- ORA-00001: unique constraint (DDL.SYS_C007059) violated
-- UNIQUE �������ǿ� �������, INSERT ����
--> ���� ������ �������Ǹ����� �˷���!! 
--> (Ư�� �÷��� � ������ �ִ��� ���� �˷������� �ʴ´�)
--> NOT NULL �������ǿ� ���ؼ� ������ ���� �ľ��ϱ� ��ƴ�
--> �������� �ο���, �������Ǹ��� �������� ������ �ý��ۿ��� ������ �������� �̸� �ο�

/*
    < �������� �ο��� �������� �̸����� �����ִ� ��� >
    
    > �÷��������
    CREATE TABLE ���̺��(
        �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] ��������,
        �÷��� �ڷ���
    );    
    
    > ���̺������
    CREATE TABLE ���̺��(
        �÷��� �ڷ���
        �÷��� �ڷ���
        [CONSTRAINT �������Ǹ�] ��������(�÷���)
    );    
*/
DROP TABLE MEM_UNIQUE;

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER CONSTRAINT MEMNO_NN NOT NULL,
    MEM_ID VARCHAR2(20) CONSTRAINT MEMID_NN NOT NULL,
    MEM_PWD VARCHAR2(20) CONSTRAINT MEMPWD_NN NOT NULL,
    MEM_NAME VARCHAR2(20) CONSTRAINT MEMNAME_NN NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    CONSTRAINT MEMID_UQ UNIQUE(MEM_ID) -- ���̺������
);

SELECT * FROM MEM_UNIQUE;

INSERT INTO MEM_UNIQUE VALUES(1, 'user01', 'pass01', '�����', null, null, null);
INSERT INTO MEM_UNIQUE VALUES(2, 'user01', 'pass02', 'Ȳ����', null, null, null);
-- ORA-00001: unique constraint (DDL.MEMID_UQ) violated

INSERT INTO MEM_UNIQUE VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null);

INSERT INTO MEM_UNIQUE VALUES(3, 'user03', 'pass03', '�̰���', '��', null, null);
-- ������ ��ȿ�� ���� �ƴѰ� ���͵� �� INSERT�� �ȴ� == �̷��� �ȵ�! ���� ����
--------------------------------------------------------------------------------

/*
    < CHECK(���ǽ�) �������� >
    �ش� �÷��� ���� �� �ִ� ���� ���� ������ �����ص� �� ����
    �ش� ���ǿ� �����ϴ� ������ ���� ��� �� ����
*/

CREATE TABLE MEM_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')), -- �÷��������
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
    -- CHECK(GENDER IN ('��', '��')) -- ���̺������
);
SELECT * FROM MEM_CHECK;

INSERT INTO MEM_CHECK 
VALUES(1, 'user01', 'pass01', '�����', '��', null, null);
INSERT INTO MEM_CHECK
VALUES(2, 'user02', 'pass02', 'Ȳ����', '��', null, null);
-- ORA-02290: check constraint (DDL.SYS_C007069) violated
-- CHECK �������ǿ� ����Ǿ� ���� �߻�
-- ���� GENDER �÷��� ������ ���� �ְ��� �Ѵٸ�
-- CHECK �������ǿ� �����ϴ� ���� �־�� ��
-- CHECK ���������� �� ���� ��� �� ���� ��� ��

INSERT INTO MEM_CHECK
VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null);
-- NOT NULL ���������� �ƴϸ� NULL�� �����ϱ� ��

INSERT INTO MEM_CHECK
VALUES(2, 'user03', 'pass03', '�̰���', null, null, null);
------------------------------------------------------------------------------------
/*
    < PRIMARY KEY(�⺻Ű) �������� >
    ���̺��� �� ����� �ĺ��ϱ� ���� ���� �÷��� �ο��ϴ� ���� ����(�ĺ����� ����)
    
    EX) �й�, ȸ����ȣ, ���(EMP_ID), �μ��ڵ�(DEPT_ID), �����ڵ�(JOB_CODE), �ֹ���ȣ, �����ȣ ��
    
    PRIMARY KEY ���������� �ο��ϸ� �� �÷��� �ڵ����� NOT NULL + UNIQUE ���������� ������
    * ���ǻ��� : �� ���̺� ��, ������ �� ���� ���� ����!!!
*/
CREATE TABLE MEM_PRI(
    MEM_NO NUMBER CONSTRAINT MEMNO_PK PRIMARY KEY, -- �÷��������
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
    -- CONSTRAINT MEMNO_PK PRIMARY KEY(MEM_NO) -- ���̺������
);

SELECT * FROM MEM_PRI;

INSERT INTO MEM_PRI
VALUES(1, 'user01', 'pass01', '�����', '��', '010-1111-2222', null);
-- ORA-00001: unique constraint (DDL.MEMNO_PK) violated
-- �⺻ Ű�� �ߺ� ���� �������� �� �� (UNIQUE �������ǿ� ����)

INSERT INTO MEM_PRI
VALUES(NULL, 'user02', 'pass02', 'Ȳ����', '��', null, null);
-- ORA-01400: cannot insert NULL into ("DDL"."MEM_PRI"."MEM_NO")
-- �⺻Ű�� NULL�� �������� �� �� (NOT NULL �������ǿ� ���� ��)

INSERT INTO MEM_PRI
VALUES(2, 'user02', 'pass02', 'Ȳ����', '��', null, null);



CREATE TABLE MEM_PRI2(
    MEM_NO NUMBER CONSTRAINT MEMNO_PK PRIMARY KEY, -- �÷��������
    MEM_ID VARCHAR2(20) PRIMARY KEY,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50)
    -- CONSTRAINT MEMNO_PK PRIMARY KEY(MEM_NO) -- ���̺������
);
-- ORA-02260: table can have only one primary key
-- PRIMARY KEY ����� �ϳ��� �ȴ�

CREATE TABLE MEM_PRI2(
    MEM_NO NUMBER ,
    MEM_ID VARCHAR2(20) ,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    PRIMARY KEY(MEM_NO, MEM_ID) -- ���̺������, ��� PRIMARY KEY �������� �ο�(����Ű)
);

SELECT * FROM MEM_PRI2;

INSERT INTO MEM_PRI2
VALUES(1, 'user01', 'pass01', '�����', null, null, null);


INSERT INTO MEM_PRI2
VALUES(1, 'user02', 'pass02', 'Ȳ����', null, null, null);

INSERT INTO MEM_PRI2
VALUES(1, 'user01', 'pass01', '�̰���', null, null, null);
-- ORA-00001: unique constraint (DDL.SYS_C007080) violated

INSERT INTO MEM_PRI2
VALUES(null, 'user01', 'pass01', '�̰���', null, null, null);
-- ORA-01400: cannot insert NULL into ("DDL"."MEM_PRI2"."MEM_NO")
-- PRIMARY KEY�� �����ִ� �� �÷����� ���� NULL�� ������� ����


-- ����Ű ��� ���� (���ϱ�, ���ƿ�, ����)
-- ���ϱ� : �� ��ǰ�� ������ �� ���� ���� �� ����
-- � ȸ���� � ��ǰ�� ���ϴ����� ���� �����͸� �����ϴ� ���̺�
CREATE TABLE TB_LIKE(
    MEM_ID VARCHAR2(20),
    PRODUCT_NAME VARCHAR2(10),
    LIKE_DATE DATE,
    PRIMARY KEY(MEM_ID, PRODUCT_NAME)
);

SELECT * FROM TB_LIKE;

INSERT INTO TB_LIKE
VALUES('user01', '��', SYSDATE);

INSERT INTO TB_LIKE
VALUES('user02', '��', SYSDATE);

INSERT INTO TB_LIKE
VALUES('user01', '��', SYSDATE);

---------------------------------------------------------------------------------

CREATE TABLE FRIENDS(
    FRI_ID NUMBER ,
    FRI_NAME VARCHAR2(20) CONSTRAINT FR_NAM NOT NULL,
    FRI_GENDER CHAR(3) CONSTRAINT FR_GEN CHECK(FRI_GENDER IN ('��', '��')),
    FRI_ADDRESS VARCHAR2(50) CONSTRAINT FR_ADR NOT NULL,
    FRI_NATION VARCHAR2(20) CONSTRAINT FR_NAT NOT NULL,
    FRI_PHONE VARCHAR2(15),
    FRI_BDAY DATE,
    PRIMARY KEY(FRI_ID, FRI_NAME)  
);

DROP TABLE FRIENDS;

SELECT * FROM FRIENDS;

INSERT INTO FRIENDS
VALUES(1, '��¯��', '��', '���ٸ���', '�ѱ�', '010-5555-5555',  '1994/5/5');

INSERT INTO FRIENDS
VALUES(2, '������', '��', '����', '�̱�', '818-510-7409', '1994/1/11');

INSERT INTO FRIENDS
VALUES(3, '������', '��', '����', '�Ϻ�', '080-1234-5678', NULL);

INSERT INTO FRIENDS
VALUES(4, '���뺸��', '��', '��ũ', '�׸�����', '010-6303-4682', '1995/9/20');

INSERT INTO FRIENDS
VALUES(5, 'ȣ����', '��', '�����̶�', '��������', '010-7777-7777', '1985/2/5');

COMMENT ON COLUMN FRIENDS.FRI_ID IS '����';
COMMENT ON COLUMN FRIENDS.FRI_NAME IS '�̸�';
COMMENT ON COLUMN FRIENDS.FRI_GENDER IS '����';
COMMENT ON COLUMN FRIENDS.FRI_ADDRESS IS '�ּ�';
COMMENT ON COLUMN FRIENDS.FRI_NATION IS '����';
COMMENT ON COLUMN FRIENDS.FRI_BDAY IS '����';
COMMENT ON COLUMN FRIENDS.FRI_PHONE IS '��ȭ��ȣ';

CREATE TABLE GF(
   GF_ID NUMBER,
   GF_NAME VARCHAR2(20),
   GF_SPIECIES VARCHAR2(20),
   PRIMARY KEY(GF_ID)
);

DROP TABLE GF;

SELECT * FROM GF;

INSERT INTO GF
VALUES(1, '�Ѽ���', '2D');

INSERT INTO GF
VALUES(2, NULL, NULL);

INSERT INTO GF
VALUES(3, '�Ʊ���','������');

INSERT INTO GF
VALUES(4, '�ʺθ�','����');

INSERT INTO GF
VALUES(5, '�޽�','���');

SELECT FRI_NAME, GF_NAME FROM FRIENDS, GF
WHERE FRI_ID = GF_ID;

SELECT FRI_NAME �̸�, FRI_ADDRESS �ּ�, 
FRI_BDAY ����, NVL(GF_NAME, '��Ʈ�� ����') ��Ʈ��, NVL(GF_SPIECIES, '��Ʈ�� ����') ��Ʈ������
FROM FRIENDS
JOIN GF ON (FRI_ID = GF_ID)
--WHERE EXTRACT(YEAR FROM (FRI_BDAY)) = '1994';
WHERE NOT GF_NAME IS NULL;

-----------------------------------------------------------------------------------

-- ȸ����޿� ���� �����͸� ���� �����ϴ� ���̺�
CREATE TABLE MEM_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(50) NOT NULL
);
SELECT * FROM MEM_GRADE;

INSERT INTO MEM_GRADE
VALUES(10, '�Ϲ�ȸ��');

INSERT INTO MEM_GRADE
VALUES(20, '���ȸ��');

INSERT INTO MEM_GRADE
VALUES(30, 'Ư��ȸ��');

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')), -- CHECK �־ null ��
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    GRADE_ID NUMBER -- ȸ����޹�ȣ ���� ������ �÷�
);

SELECT * FROM MEM;

INSERT INTO MEM
VALUES(1, 'user01', 'pass01', '�����', '��', null, null, null);

INSERT INTO MEM
VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null, 10);

INSERT INTO MEM
VALUES(3, 'user03', 'pass03', '�̰���', null, null, null, 40);
-- ��ȿ�� ȸ����� ��ȣ�� �ƴԿ��� �ұ��ϰ� �� insert ��

--------------------------------------------------------------------------------

/*
    < FOREIGN KEY �ܷ�Ű �������� >
    �ٸ� ���̺� �����ϴ� ���� ���;� �Ǵ� Ư�� �÷��� �ο��ϴ� ��������
    --> �ٸ� ���̺��� �����Ѵٰ� ǥ��
    --> �ַ� FOREIGN KEY ���� ���ǿ� ���� ���̺� ���� ���谡 ����
    
    > �÷��������
    �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] REFERENCES ������ ���̺�� (������ �÷���) 
    
    > ���̺������
    [CONSTRAINT �������Ǹ�] FOREIGN KEY(�÷���) REFERENCES ������ ���̺��[(������ �÷���)]
    
    --> ������ �÷��� ������ ������ ���̺� PRMARY KEY�� ������ �÷����� ��Ī 

*/

DROP TABLE MEM;

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')), -- CHECK �־ null ��
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    GRADE_ID NUMBER REFERENCES MEM_GRADE(GRADE_CODE) -- �÷����� ���, ������ PRIMARY KEY ����
    -- FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE
);

SELECT * FROM MEM;

INSERT INTO MEM
VALUES(1, 'user01', 'pass01', '�����', '��', null, null, null);

INSERT INTO MEM
VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null, 10);

INSERT INTO MEM
VALUES(3, 'user03', 'pass03', '�̰���', null, null, null, 20);
-- ��ȿ�� ȸ����� ��ȣ�� �ƴԿ��� �ұ��ϰ� �� insert ��
-- ORA-02291: integrity constraint (DDL.SYS_C007137) violated - parent key not found
-- PARENTS KEY �� ã�� �� ���ٴ� ���� �߻�

INSERT INTO MEM
VALUES(4, 'user04', 'pass04', '�̽¿�', null, null, null, 10);

-- MEM_GRADE(�θ����̺�) ------|----------------<------ MEM(�ڽ����̺�)

--> �̶� �θ����̺�(MEM_GRADE)���� ������ ���� ������ ��� � ������ ������???
--> ������ ���� : DELET FROM ���̺�� WHERE ����;

--> MEM_GRADE ���̺��� 10�� ��� ����!!
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = '10'; -- WHERE�� �׻� �׻� ����!!!!! �� �׷��� ���� ���ư�
-- ORA-02292: integrity constraint (DDL.SYS_C007137) violated - child record found
--> �ڽ����̺�(MEM)���� '10'�̶�� ���� ����ϰ� �ֱ� ������ ������ �ȵ�

DELETE FROM MEM_GRADE
WHERE GRADE_CODE = '30';
--> �ڽ����̺�(MEM)���� 30 �̶�� ���� ����ϰ� ���� �ʱ� ������ ������ �� ��
--> �ڽ����̺� �̹� ����ϰ� �ִ� ���� ���� ���
--> �θ����̺�� ���� ������ ������ �ȵǰ� �ϴ� "�������ѿɼ�"�� �ɷ� �ִ� ��

ROLLBACK;

/*
    
    < �ڽ� ���̺� ���� �� �ܷ�Ű �������� �ο��� �� �����ɼ� �������� >
    * �����ɼ� : �θ����̺��� ������ ������ �� �����͸� ����ϰ� �ִ� �ڽ����̺��� ����
                ��� ó���Ұ��� 
    
    - ON DELETE RESTRICTED(�⺻��) : �������ѿɼ�����, �ڽĵ����ͷ� ���̴� �θ����ʹ� ���� �Ұ�
    - ON DELETE SET NULL : �θ����� ������, �ش� �����͸� ���� �ִ� �ڽĵ������� ���� NULL�� ��ü
    - ON DELETE CASCADE : �θ����� ������, �ش� �����͸� ���� �ִ� �ڽĵ����͵� ���� ���� 
*/

DROP TABLE MEM;

-- ON DELETE SET NULL �׽�Ʈ 


CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')), 
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    GRADE_ID NUMBER REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE SET NULL 
    -- FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE
);

SELECT * FROM MEM;

INSERT INTO MEM
VALUES(1, 'user01', 'pass01', '�����', '��', null, null, null);

INSERT INTO MEM
VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null, 10);

INSERT INTO MEM
VALUES(3, 'user03', 'pass03', '�̰���', null, null, null, 20);

INSERT INTO MEM
VALUES(4, 'user04', 'pass04', '�̽¿�', null, null, null, 10);

DELETE FROM MEM_GRADE
WHERE GRADE_CODE = '10';
-- �� ���� ��! �� 10�� ������ ���� �ִ� �ڽ� ������ ���� NULL�� ����

ROLLBACK;

DROP TABLE MEM;

-- ON DELETE CASCADE

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')), 
    PHONE VARCHAR2(13),
    EMAIL VARCHAR2(50),
    GRADE_ID NUMBER REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE CASCADE
    -- FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE
);


SELECT * FROM MEM;

INSERT INTO MEM
VALUES(1, 'user01', 'pass01', '�����', '��', null, null, null);

INSERT INTO MEM
VALUES(2, 'user02', 'pass02', 'Ȳ����', null, null, null, 10);

INSERT INTO MEM
VALUES(3, 'user03', 'pass03', '�̰���', null, null, null, 20);

INSERT INTO MEM
VALUES(4, 'user04', 'pass04', '�̽¿�', null, null, null, 10);

-- 10 ��� �����غ���
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = '10';
-- �� ������, �� �ش� �����͸� ����ϰ� �ִ� �ڽĵ����͵� �Բ� ������

---------------------------------------------------------------------------------

/*

    < DEFAULT �⺻�� > ** �������� �ƴ�
    �÷��� �������� �ʰ� INSERT��  NULL�� �ƴ� �⺻ ���� �����ص� �� �ִ�
    
*/

DROP TABLE MEMBER;
-- �÷��� �ڷ��� DEFAULT �⺻��

CREATE TABLE MEMBER(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_NAME VARCHAR2(20) NOT NULL,
    MEM_AGE NUMBER,
    HOBBY VARCHAR2(20) DEFAULT '����',
    ENROLL_DATE DATE DEFAULT SYSDATE
);

SELECT * FROM MEMBER;

INSERT INTO MEMBER
VALUES(1, '�����', 20, '�౸', '19/12/13');

INSERT INTO MEMBER
VALUES(2, 'Ȳ����', NULL, NULL, NULL);

INSERT INTO MEMBER
VALUES(3, '�̰���', NULL,DEFAULT, DEFAULT);
-- ���� ������ ����Ʈ ������ ��

-- INSERT INTO ���̺��(�÷���, �÷���) VALUES(��1, ��2);
-- NOT NULL �ΰ� �� ����� ������ ���� �ʴ´�
INSERT INTO MEMBER(MEM_NO, MEM_NAME) VALUES(4, '�̽¿�');
-- ���õ��� ���� �÷����� �⺻������ NULL�� ��
-- ��, �ش� �÷��� DEFAULT ���� ���� ���, NULL�� �ƴ� DEFAULT ���� ��

--------------------------------------------------------------------------------
/*
    ���⼭���ʹ�
    KH ����
    ���� �� �͵�
    < SUBQUERY�� �̿��� ���̺� ���� >
    ���̺��� ���� �ߴ� ����
    
    [ ǥ���� ]
    CREATE TABLE ���̺��
    AS ��������;
*/

-- EMPLOYEE ���̺��� ������ ���ο� ���̺� ����
CREATE TABLE EMPLOYEE_COPY
AS SELECT *
    FROM EMPLOYEE;
    
SELECT * FROM EMPLOYEE_COPY;
-- �÷�, �����Ͱ� GOOD
-- ���������� NOT NULL�� �����

CREATE TABLE EMPLOYEE_COPY2
AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    FROM EMPLOYEE -- ���̺� ������ �������� �ʹ�!
    WHERE 1=0; -- ������ FALSE�� ���� : �������� �����ϰ��� �� �� ���̴� ����(������ ���� �ʿ� ���� ��)

SELECT * FROM EMPLOYEE_COPY2;

CREATE TABLE EMPLOYEE_COPY3
AS SELECT EMP_ID, EMP_NAME, SALARY, SALARY * 12 AS "����"
    FROM EMPLOYEE;
-- ORA-00998: must name this expression with a column alias
-- alias : ��Ī
-- �������� SELECT ���� ����� �Ǵ� �Լ��� ��� �� ��� �ݵ�� ��Ī �����ؾߵ�

SELECT EMP_NAME, ���� FROM EMPLOYEE_COPY3;

--------------------------------------------------------------------------------

/*
    ���̺� �� ������ �Ŀ� �ڴʰ� �������� �߰�
    
    ALTER TABLE ���̺�� ������ ����
    
    - PRIMARY KEY 
    : ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���)
    
    - FOREIGN KEY 
    : ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFERENCES ������ ���̺��([������ �÷���])
    
    - UNIQUE : ALTER TABLE ���̺�� ADD UNIQUE(�÷���);
    
    - CHECK : ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�);
    
    - NOT NULL : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;
    
*/

-- ���������� �̿��ؼ� ������ ���̺��� NN �������� ���� ���� �ȵ�
-- EMPLOYEE_COPY ���̺� PRIMARY KEY �������� �߰�(EMP_ID)
ALTER TABLE EMPLOYEE_COPY ADD PRIMARY KEY(EMP_ID);

-- EMPLOYEE ���̺� DEPT_CODE�� �ܷ�Ű(FK) �������� �߰�
-- �����ϴ� ���̺�(�θ�) : DEPARTMENT(DEPT_ID)
ALTER TABLE EMPLOYEE ADD FOREIGN KEY(DEPT_CODE) REFERENCES DEPARTMENT;-- �����ϸ� �θ����̺��� PK�� ��;

-- EMPLOYEE ���̺� JOB_CODE�� �ܷ�Ű �������� �߰� (JOB ���̺� �����ϱ�)
ALTER TABLE EMPLOYEE ADD FOREIGN KEY(JOB_CODE) REFERENCES JOB(JOB_CODE);

-- EMPLOYEE ���̺� SAL_LEVEL�� �ܷ�Ű �������� �߰�(SAL_GRADE ���̺�)
ALTER TABLE EMPLOYEE ADD FOREIGN KEY(SAL_LEVEL) REFERENCES SAL_GRADE;

-- DEPARTMENT ���̺� LOCATION_ID�� �ܷ�Ű �������� �߰�(LOCATION ���̺�)
ALTER TABLE DEPARTMENT ADD FOREIGN KEY(LOCATION_ID) REFERENCES LOCATION(LOCAL_CODE);
