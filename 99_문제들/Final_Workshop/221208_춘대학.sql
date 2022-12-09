/* 
1. �迭 ������ ������ ī�װ� ���̺��� ������� ����. ������ ���� ���̺���
�ۼ��Ͻÿ�.

���̺� �̸�
    TB_CATEGORY
�÷�
    NAME, VARCHAR2(10)
    USE_YN, CHAR(1), �⺻���� Y �� ������
*/

CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);

/*
2. ���� ������ ������ ���̺��� ������� ����. ������ ���� ���̺��� �ۼ��Ͻÿ�.

���̺��̸�
    TB_CLASS_TYPE
�÷�
    NO, VARCHAR2(5), PRIMARY KEY   
    NAME , VARCHAR2(10)

*/
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

/*
3. TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
(KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� ���ٸ� �̸��� ������
�˾Ƽ� ������ �̸��� �������.)
*/

ALTER TABLE TB_CATEGORY
    ADD CONSTRAINT NAME_PK PRIMARY KEY(NAME);


-- 4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.

ALTER TABLE TB_CLASS_TYPE
    MODIFY NAME NOT NULL;

/*

5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 
ũ��� 10 ����, �÷����� NAME �� ���� ���C������ 
���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.

*/

ALTER TABLE TB_CATEGORY
    MODIFY NAME VARCHAR2(20);


ALTER TABLE TB_CLASS_TYPE
    MODIFY NO VARCHAR2(10)
    MODIFY NAME VARCHAR(20);
    

/*

6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� 
�� �� TB_ �� ������ ���̺� �̸��� �տ�
���� ���·� ��������.
(ex. CATEGORY_NAME)

*/

ALTER TABLE TB_CATEGORY
    RENAME COLUMN NAME TO CATEGORY_NAME;
    
    
    

ALTER TABLE TB_CATEGORY
    RENAME COLUMN USE_YN TO CATEGORY_USE_YN;    
    

/*

7. TB_CATAGORY ���̺�� TB_CLASS_TYPE 
���̺��� PRIMARY KEY �̸��� ������ ����
�����Ͻÿ�.
Primary Key �� �̸��� ?PK_ + �÷��̸�?���� 
�����Ͻÿ�. (ex. PK_CATEGORY_NAME )

*/

ALTER TABLE TB_CATEGORY
    RENAME CONSTRAINT NAME_PK TO PK_CATEGORY_NAME;
    
ALTER TABLE TB_CLASS_TYPE
    RENAME CONSTRAINT SYS_C007230 TO PK_CLASS_TYPE_NO;
    
/*

8. ������ ���� INSERT ���� ��������.
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;

*/
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT;

/*

9.TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ�
������ �����ϵ��� FOREIGN KEY �� �����Ͻÿ�. �� �� KEY �̸���
FK_���̺��̸�_�÷��̸����� ��������. (ex. FK_DEPARTMENT_CATEGORY )

*/

ALTER TABLE TB_DEPARTMENT(
    CATEGORY VARCHAR2(20) CONSTRAINT FK_DEPARTMENT_CATEGORY REFERENCES TB_CATEGORY(CATEGORY_NAME)
);

/*

10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.

�� �̸�
    VW_�л��Ϲ�����
�÷�
    �й�  
    �л��̸�
    �ּ�
*/

CREATE VIEW 'VW_�л��Ϲ�����'
AS (
SELECT
STUDENT_NO NUMBER,
STDUETN_NAME VARCHAR2(20),
ADDRESS VARCHAR2(30)
FROM 
);

/*

--15. �� ������б��� �ų� ������û �Ⱓ�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ����
--������ �ǰ� �ִ�. (2005~2009) �������� �����ο��� ���� ���Ҵ� 3 ������ ã�� ������
--�ۼ��غ��ÿ�.


*/


-- DML


-- 1. �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�.
INSERT INTO TB_CLASS_TYPE
VALUES(01, '�����ʼ�');

INSERT INTO TB_CLASS_TYPE 
VALUES(02, '��������');

INSERT INTO TB_CLASS_TYPE 
VALUES(03, '�����ʼ�');

INSERT INTO TB_CLASS_TYPE 
VALUES(04, '���缱��');

INSERT INTO TB_CLASS_TYPE 
VALUES(05, '������');

-- 2. �� ������б� �л����� ������ ���ԵǾ� �ִ� 
-- �л��Ϲ����� ���̺��� ������� ����.
-- �Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�)

CREATE TABLE TB_�л��Ϲ�����
    
    STUDENT_NO 
    STUDENT_NAME 
    STUDENT_ADDRESS 


SELECT * FROM TB_�л��Ϲ�����;

DROP TABLE TB_�л��Ϲ�����;

SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT;

INSERT INTO TB_�л��Ϲ�����(
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS FROM TB_STUDENT
);

/*

3. ������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ�
�ۼ��Ͻÿ�)

*/

SELECT STUDENT_NO, STUDENT_NAME, CONCAT('19',SUBSTR(STUDENT_SSN, 1, 2), PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '������а�';


CREATE TABLE TB_������а�(
    STUDENT_NO VARCHAR2(10),
    STUDENT_NAME VARCHAR2(40),
    STUDENT_BDAY VARCHAR2(10),
    PROFESSOR_NAME VARCHAR2(40));
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/*    
10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� ����.
�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.

�� �̸�
VW_�л��Ϲ�����
�÷�
�й�
�л��̸�
�ּ�
*/

CREATE OR REPLACE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT;


/*
11. �� ������б��� 1 �⿡ �� ���� �а����� �л��� ���������� ���� ����� ��������.
�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW �� ����ÿ�.
�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ� SELECT
���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)
�� �̸�
VW_�������
�÷�
�л��̸�
�а��̸�
���������̸�
*/

CREATE OR REPLACE VIEW VW_�������
AS SELECT STUDENT_NAME, DEPARTMENT_NAME, PROFESSOR_NAME
   FROM TB_STUDENT
   JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
   LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
   ORDER BY 2;
   

SELECT * FROM VW_�������;


/*
12. ��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����.
�� �̸�
VW_�а����л���
�÷�
DEPARTMENT_NAME
STUDENT_COUNT

25
*/



CREATE OR REPLACE VIEW VW_�а����л���
AS SELECT DEPARTMENT_NAME, COUNT(STUDENT_NAME) AS "STUDENT_COUNT"
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING (DEPARTMENT_NO)
GROUP BY DEPARTMENT_NAME;

SELECT * FROM VW_�а����л���;


/*
13. ������ ������ �л��Ϲ����� View �� ���ؼ� �й��� A213046 �� �л��� �̸��� ����
�̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
*/

UPDATE VW_�л��Ϲ�����
SET STUDENT_NAME = '�ֽ���'
WHERE STUDENT_NO = 'A213046';

SELECT STUDENT_NAME FROM VW_�л��Ϲ�����
WHERE STUDENT_NO = 'A213046';


/*
14. 13 �������� ���� VIEW �� ���ؼ� �����Ͱ� ����� �� �ִ� ��Ȳ�� �������� VIEW ��
��� �����ؾ� �ϴ��� �ۼ��Ͻÿ�.
*/

-- �� ������ WITH READ ONLY�� ��������
CREATE OR REPLACE VIEW VW_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WITH READ ONLY;

/*
15. �� ������б��� �ų� ������û ��A�� �Ǹ� Ư�� �α� ����鿡 ���� ��û�� ����
������ �ǰ� �ִ�. �ֱ� 3 ���� �������� �����ο��� ���� ���Ҵ� 3 ������ ã�� ������
�ۼ��غ��ÿ�.
�����ȣ �����̸� ������������(��)
---------- ------------------------------ ----------------
C1753800 �������� 29
C1753400 ���ü�� 23
C2454000 �����۹�������Ư�� 22
*/    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
);