-- �л� ���̺� ����
CREATE TABLE TB_STU(
    STU_NO NUMBER PRIMARY KEY,
    STD_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(1),
    PHONE VARCHAR2(13),
    STU_STATUS VARCHAR2(10) DEFAULT '����' CHECK(STU_STATUS 
    IN('����', '����', '����', '����'))
);

-- �й� ������ ����
CREATE SEQUENCE SEQ_STU_NO
START WITH 900
INCREMENT BY 1;

DROP TABLE TB_STU;


-- ���� ���̺� ����
CREATE TABLE TB_ABSENCE(
    ABS_NO NUMBER PRIMARY KEY,
    STU_NO NUMBER REFERENCES TB_STU,
    ABS_DATE DATE,
    ABS_STATUS CHAR(1)
);

DROP TABLE TB_ABSENCE;

-- ���� ������ ���� 
CREATE SEQUENCE SEQ_ABS_NO
START WITH 1
NOCACHE;

COMMIT;






CREATE OR REPLACE TRIGGER TRG_STU_01
AFTER UPDATE ON TB_STU -- AFTER UPDATE
FOR EACH ROW
BEGIN
    IF (:NEW.STU_STATUS = '����')
        THEN
           INSERT INTO TB_ABSENCE
           VALUES (SEQ_ABS_NO.NEXTVAL, :NEW.STU_NO, SYSDATE, 'Y');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_STU_04
AFTER INSERT ON TB_STU
FOR EACH ROW
BEGIN
    IF (:NEW.STU_STATUS = '����')
        THEN
            INSERT INTO TB_ABSENCE
            VALUES (SEQ_ABS_NO.NEXTVAL, :NEW.STU_NO, SYSDATE, 'Y');
        END IF;
END;
/




INSERT INTO TB_STU VALUES(SEQ_STU_NO.NEXTVAL, '��ÿ�', 'F', '01012314564','����');


CREATE OR REPLACE TRIGGER TRG_STU_02
AFTER UPDATE ON TB_ABSENCE
FOR EACH ROW
BEGIN
    -- ���п��� N
    IF (:NEW.ABS_STATUS = 'N')
        THEN
        UPDATE TB_STU
        SET STU_STATUS = '����'
        WHERE STU_NO = :NEW.STU_NO;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_STU_01
AFTER UPDATE ON TB_STU
FOR EACH ROW
BEGIN
    IF (:NEW.STU_STATUS = '����')
        THEN
        DELETE FROM TB_STU
        WHERE STU_NO = :NEW.STU_NO;
    END IF;
END;
/


-- �л� ���̺� ������
INSERT INTO TB_STU
VALUES(SEQ_STU_NO.NEXTVAL, '��Ѹ�', 'F', '01012345678', DEFAULT);

INSERT INTO TB_STU
VALUES(SEQ_STU_NO.NEXTVAL, '���浿', 'M', '01045678900', '����');

INSERT INTO TB_STU
VALUES(SEQ_STU_NO.NEXTVAL, '�����', 'M', '01177886655', '����');

INSERT INTO TB_STU
VALUES(SEQ_STU_NO.NEXTVAL, '����ġ', 'F', '01155442233', '����');

INSERT INTO TB_STU
VALUES(SEQ_STU_NO.NEXTVAL, '������', 'M', '01011447766', '����');

UPDATE TB_STU
SET STU_STATUS = '����'
WHERE STD_NAME = '��Ѹ�';
