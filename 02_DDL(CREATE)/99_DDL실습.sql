--�ǽ�����--

--�������� ���α׷��� ����� ���� ���̺��� �����

--�̶�, �������ǿ� �̸��� �ο��� ��

-- �� �÷��� �ּ��ޱ�


--1. ���ǻ�鿡 ���� �����͸� ��� ���� ���ǻ� ���̺�(TB_PUBLISHER)

--�÷�: PUB_NO(���ǻ��ȣ) --�⺻Ű(PUBLISHER_PK) -- Ÿ���� ����

-- PUB_NAME(���ǻ��) --NOT NULL(PUBLICHSER_NN)

-- PHONE(���ǻ���ȭ��ȣ) --�������� ����

-- 3�� ������ ���� ������ �߰��ϱ�



CREATE TABLE TB_PUBLISHER(
    PUB_NO NUMBER CONSTRAINT PUBLIHSER_PK PRIMARY KEY,
    PUB_NAME VARCHAR2(20) CONSTRAINT PUBLICHER_NN NOT NULL,
    PHONE VARCHAR(13)
);

SELECT * FROM TB_PUBLISHER;

DROP TABLE TB_PUBLISHER;

INSERT INTO TB_PUBLISHER
VALUES (
    1, '��������', '0310010001' 
);

INSERT INTO TB_PUBLISHER
VALUES (
    2, 'ȣ���̹���', '0327775555' 
);

INSERT INTO TB_PUBLISHER
VALUES (
    3, '���ڳ����ǻ�', '0881234567' 
);

COMMENT ON COLUMN TB_PUBLISHER.PUB_NO IS '���ǻ��ȣ';
COMMENT ON COLUMN TB_PUBLISHER.PUB_NAME IS '���ǻ��̸�';
COMMENT ON COLUMN TB_PUBLISHER.PHONE IS '���ǻ���ȭ��ȣ';


--2. �����鿡 ���� �����͸� ��� ���� ���� ���̺�(TB_BOOK)

--�÷�: BK_NO(������ȣ) --�⺻Ű(BOOK_PK)

-- BK_TITLE(������) --NOT NULL(BOOK_NN_TITLE)

-- BK_AUTHOR(���ڸ�) --NOT NULL(BOOK_NN_AUTHOR)

-- BK_PRICE(����)

-- BK_STOCK(���) --�⺻�� 1�� ����

-- BK_PUB_NO(���ǻ��ȣ) --�ܷ�Ű(BOOK_FK)(TB_PUBLISHER ���̺��� �����ϵ���)

-- �̶� �����ϰ� �ִ� �θ����� ���� �� �ڽĵ����͵� �����ǵ��� ����
-- DELETE
--5�� ������ ���� ������ �߰��ϱ�

CREATE TABLE TB_BOOK (
    BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
    BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
    BK_AUTHOR VARCHAR2(50) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
    BK_PRICE NUMBER,
    BK_STOCK NUMBER DEFAULT 1,
    BK_PUB_NO NUMBER REFERENCES TB_PUBLISHER ON DELETE CASCADE
);

COMMENT ON COLUMN TB_BOOK.BK_NO IS 'å��ȣ';
COMMENT ON COLUMN TB_BOOK.BK_TITLE IS 'å����';
COMMENT ON COLUMN TB_BOOK.BK_AUTHOR IS '����';
COMMENT ON COLUMN TB_BOOK.BK_PRICE IS '����';
COMMENT ON COLUMN TB_BOOK.BK_STOCK IS '���';
COMMENT ON COLUMN TB_BOOK.BK_PUB_NO IS '���ǻ��ȣ';

INSERT INTO TB_BOOK 
VALUES(001, '�Ƶ�����', '���뺸��', 9900, 5, 3);

INSERT INTO TB_BOOK 
VALUES(002, '�п����� ��Ƴ���', '�ֽ���', 8500, 10, 2);

INSERT INTO TB_BOOK 
VALUES(003, '����� ��������', '������', 15900, 30, 1);

INSERT INTO TB_BOOK 
VALUES(004, '�ղɳ����۴�', '����', 12000, 15, 1);

INSERT INTO TB_BOOK 
VALUES(005, '�츮���̰� �޶�����', '������', 33000, 25, 3);

SELECT * FROM TB_BOOK;

DROP TABLE TB_BOOK;



--3. ȸ���� ���� �����͸� ��� ���� ȸ�� ���̺�(TB_MEMBER)

--�÷���: MEMBER_NO(ȸ����ȣ) --�⺻Ű(MEMBER_PK)

-- MEMBER_ID(���̵�) --�ߺ�����(MEMBER_UQ)

--MEMBER_PWD(��й�ȣ) NOT NULL(MEMBER_NN_PWD)

--MEMBER_NAME(ȸ����) NOT NULL(MEMBER_NN_NAME)

--GENDER(����) 'M' �Ǵ� 'F'�� �Էµǵ��� ����(MEMBER_CK_GEN)

--ADDRESS(�ּ�)

--PHONE(����ó)

--STATUS(Ż�𿩺�) --�⺻������ 'N' �׸��� 'Y' Ȥ�� 'N'���� �Էµǵ��� ��������(MEMBER_CK_STA)

--ENROLL_DATE(������) --�⺻������ SYSDATE, NOT NULL ����(MEMBER_NN_EN)

--5�� ������ ���� ������ �߰��ϱ�

CREATE TABLE TB_MEMBER(
    MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
    MEMBER_ID VARCHAR2(30) CONSTRAINT MEMBER_UQ UNIQUE,
    MEMBER_PWD VARCHAR2(30) CONSTRAINT MEMBER_NN_PWD NOT NULL,
    MEMBER_NAME VARCHAR2(30) CONSTRAINT MEMBER_NN_NAME NOT NULL,
    GENDER CHAR(1) CONSTRAINT MEMBER_CK_GEN CHECK(GENDER IN ('M','F')),
    ADDRESS VARCHAR2(50),
    PHONE VARCHAR(13),
    STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN ('Y','N')),
    ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL
);

COMMENT ON COLUMN TB_MEMBER.MEMBER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN TB_MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN TB_MEMBER.MEMBER_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN TB_MEMBER.GENDER IS 'ȸ������';
COMMENT ON COLUMN TB_MEMBER.ADDRESS IS 'ȸ���ּ�';
COMMENT ON COLUMN TB_MEMBER.PHONE IS 'ȸ����ȭ��ȣ';
COMMENT ON COLUMN TB_MEMBER.STATUS IS 'ȸ��Ż�𿩺�';
COMMENT ON COLUMN TB_MEMBER.ENROLL_DATE IS 'ȸ��������';

SELECT * FROM TB_MEMBER;

DROP TABLE TB_MEMBER;

INSERT INTO TB_MEMBER
VALUES(01, 'samsungjoa', 'samsungsarang', '��￱', 'F', '��⵵ ������', '01033334444', DEFAULT, DEFAULT);

INSERT INTO TB_MEMBER
VALUES(02, 'steve_jobs', 'applemansei', '��Ƽ���⽺', 'M', '��⵵ ������', '01066667777', 'Y', '22/11/11');

INSERT INTO TB_MEMBER
VALUES(03, 'xiaomizzang', 'woshizhonguoren', '����', 'M', '��⵵ ��õ��', '01088882222', DEFAULT, '21/10/10');

INSERT INTO TB_MEMBER
VALUES(04, 'bonobono', 'nanunsudal', '���뺸��', 'F', '��⵵ �����', '01099996666', 'Y', '22/8/8');

INSERT INTO TB_MEMBER
VALUES(05, 'zzanggu', 'shinosuke', '��¯��', 'M', '��⵵ ���ٽ�', '01055005500', DEFAULT, DEFAULT);

INSERT 
    INTO TB_MEMBER
        (
          MEMBER_NO
        , MEMBER_ID
        , MEMBER_PWD
        , MEMBER_NAME
        , GENDER
        , ADDRESS
        , PHONE
        )
    VALUES
        (
        06
        , 'naruto'
        , 'sasuke'
        , '������'
        , 'F'
        , '��⵵ �����ٸ���'
        , '01055995544'
        );

--4. ������ �뿩�� ȸ���� ���� �����͸� ��� ���� �뿩��� ���̺�(TB_RENT)

--�÷�:

--RENT_NO(�뿩��ȣ) --�⺻Ű(RENT_PK)

--RENT_MEM_NO(�뿩ȸ����ȣ) --�ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼ� ����

--RENT_BOOK_NO(�뿩������ȣ) --�ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼǼ���

--RENT_DATE(�뿩��) --�⺻�� SYSDATE

--���õ����� 3������ �߰��ϱ�


CREATE TABLE TB_RENT(
    RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
    RENT_MEM_NO NUMBER CONSTRAINT RENT_FK_MEM REFERENCES TB_MEMBER ON DELETE SET NULL,
    RENT_BOOK_NO NUMBER CONSTRAINT RENT_FK_BOOK REFERENCES TB_BOOK ON DELETE SET NULL,
    RENT_DATE DATE DEFAULT SYSDATE
);

DROP TABLE TB_RENT;

SELECT * FROM TB_RENT;

INSERT INTO TB_RENT
VALUES(0001, 01, 002, DEFAULT);

INSERT INTO TB_RENT
VALUES(0002, 04, 001, '22/12/01');

INSERT INTO TB_RENT
VALUES(0003, 03, 003, '22/11/30');

SELECT MEMBER_NAME AS "ȸ�� �̸�", MEMBER_ID AS "���̵�", RENT_DATE AS "�뿩��", RENT_DATE + 7 AS "�ݳ���"
 FROM TB_MEMBER
 JOIN TB_RENT ON (RENT_MEM_NO = MEMBER_NO)
 WHERE RENT_BOOK_NO = 002;

--2�� ������ �뿩�� ȸ���� �̸�, ���̵�, �뿩��, �ݳ�������(�뿩��+7)�� ��ȸ�Ͻÿ�.





