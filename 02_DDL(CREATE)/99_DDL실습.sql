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


--�÷�: BK_NO(������ȣ) --�⺻Ű(BOOK_PK)

-- BK_TITLE(������) --NOT NULL(BOOK_NN_TITLE)

-- BK_AUTHOR(���ڸ�) --NOT NULL(BOOK_NN_AUTHOR)

-- BK_PRICE(����)

-- BK_STOCK(���) --�⺻�� 1�� ����

-- BK_PUB_NO(���ǻ��ȣ) --�ܷ�Ű(BOOK_FK)(TB_PUBLISHER ���̺��� �����ϵ���)

-- �̶� �����ϰ� �ִ� �θ����� ���� �� �ڽĵ����͵� �����ǵ��� ����
-- DELETE
--5�� ������ ���� ������ �߰��ϱ�












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











--4. ������ �뿩�� ȸ���� ���� �����͸� ��� ���� �뿩��� ���̺�(TB_RENT)

--�÷�:

--RENT_NO(�뿩��ȣ) --�⺻Ű(RENT_PK)

--RENT_MEM_NO(�뿩ȸ����ȣ) --�ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼ� ����

--RENT_BOOK_NO(�뿩������ȣ) --�ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���

--�̶� �θ����� ���� �� NULL���� �ǵ��� �ɼǼ���

--RENT_DATE(�뿩��) --�⺻�� SYSDATE

--���õ����� 3������ �߰��ϱ�





--2�� ������ �뿩�� ȸ���� �̸�, ���̵�, �뿩��, �ݳ�������(�뿩��+7)�� ��ȸ�Ͻÿ�.





