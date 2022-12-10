-- 3. �������� 25�� �̻��� å ��ȣ�� �������� ȭ�鿡 ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM TB_BOOK;

SELECT BOOK_NO, BOOK_NM
FROM TB_BOOK
WHERE LENGTH(BOOK_NM) >= 25;

-- 4. �޴��� ��ȣ�� ��019���� �����ϴ� �达 ���� ���� �۰��� �̸������� �������� �� ���� ���� ǥ�õǴ� �۰�
-- �̸��� �繫�� ��ȭ��ȣ, �� ��ȭ��ȣ, �޴��� ��ȭ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_WRITER;

SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO
FROM 
(SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO 
FROM TB_WRITER
WHERE MOBILE_NO LIKE '019%'
AND WRITER_NM LIKE '��%'
ORDER BY 1)
WHERE ROWNUM <= 1;



-- 5. ���� ���°� ���ű衱�� �ش��ϴ� 
-- �۰����� �� �� ������ ����ϴ� SQL ������ �ۼ��Ͻÿ�. 
--(��� ����� ���۰�(��)������ ǥ�õǵ��� �� ��)
SELECT * FROM TB_BOOK_AUTHOR;

SELECT  COUNT(WRITER_NM) AS "�۰�(��)"
FROM (SELECT WRITER_NM
FROM TB_WRITER
JOIN TB_BOOK_AUTHOR USING(WRITER_NO)
WHERE COMPOSE_TYPE = '�ű�'
GROUP BY WRITER_NM);

-- 6. 300�� �̻� ��ϵ� ������ ���� ���� �� ��ϵ� ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
-- (�������°� ��ϵ��� ���� ���� ������ ��)

SELECT * FROM TB_BOOK_AUTHOR;

SELECT COMPOSE_TYPE,COUNT(COMPOSE_TYPE)
FROM TB_BOOK_AUTHOR
GROUP BY COMPOSE_TYPE
HAVING COUNT(COMPOSE_TYPE) >= 300;


-- 7. ���� �ֱٿ� �߰��� �ֽ��� �̸��� ��������, ���ǻ� �̸��� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM
FROM (SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM 
        FROM TB_BOOK
        ORDER BY 2 DESC)
WHERE ROWNUM =1;
-- 8. ���� ���� å�� �� �۰� 3���� �̸��� ������ ǥ���ϵ�, 
-- ���� �� ������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
-- ��, ��������(��٣���) �۰��� ���ٰ� �����Ѵ�. 
-- (��� ����� ���۰� �̸���, ���� ������ ǥ�õǵ��� �� ��)

SELECT "�۰� �̸�","�� ��"
FROM (SELECT WRITER_NM AS "�۰� �̸�", COUNT(WRITER_NM) AS "�� ��"
FROM TB_BOOK B
JOIN TB_BOOK_AUTHOR A USING(BOOK_NO)
JOIN TB_WRITER W USING(WRITER_NO)
GROUP BY WRITER_NM
ORDER BY 2 DESC)
WHERE ROWNUM <= 3;




-- 9. �۰� ���� ���̺��� ��� ������� �׸��� �����Ǿ� �ִ� �� �߰��Ͽ���. 
-- ������ ������� ���� �� �۰��� ������ ���ǵ����� �����ϰ� ������ ��¥���� 
-- �����Ű�� SQL ������ �ۼ��Ͻÿ�. (COMMIT ó���� ��)

-- �� �۰��� å�� REGIST_DATE Ȯ���� ����
-- TB_WRITER�� WRITER_NO
-- TB_BOOK�� BOOK_NO
-- TB_BOOK_AUTHOR�� BOOK_NO, WRITER_NO
SELECT REGIST_DATE, ISSUE_DATE 
FROM TB_WRITER
JOIN TB_BOOK_AUTHOR USING(WRITER_NO)
JOIN TB_BOOK USING(BOOK_NO);

SELECT REGIST_DATE, ISSUE_DATE
FROM TB_BOOK B, TB_WRITER W, TB_BOOK_AUTHOR A
WHERE B.BOOK_NO = A.BOOK_NO
AND W.WRITER_NO = A.WRITER_NO;

UPDATE TB_WRITER W
SET REGIST_DATE =
    (
    SELECT MIN(ISSUE_DATE) 
    FROM TB_WRITER
    JOIN TB_BOOK_AUTHOR USING(WRITER_NO)
    JOIN TB_BOOK USING(BOOK_NO)
    WHERE WRITER_NO = W.WRITER_NO
    );


    
SELECT * FROM TB_BOOK_AUTHOR;


SELECT * FROM TB_BOOK
WHERE BOOK_NO IN (2001092003, 2001092002, 2001092001); -- ISSUE_DATE ���ϱ� ���� ����


-- 10. ���� �������� ���� ���̺��� ������ �������� ���� ���� �����ϰ� �ִ�. 
-- �����δ� �������� ���� �����Ϸ��� �Ѵ�. 
-- ���õ� ���뿡 �°� ��TB_BOOK_ TRANSLATOR�� ���̺��� �����ϴ� SQL ������ �ۼ��Ͻÿ�. 
-- (Primary Key ���� ���� �̸��� ��PK_BOOK_TRANSLATOR���� �ϰ�, Reference ���� ���� �̸���
-- ��FK_BOOK_TRANSLATOR_01��, ��FK_BOOK_TRANSLATOR_02���� �� ��)
SELECT * FROM TB_BOOK_AUTHOR;
SELECT * FROM TB_WRITER;

CREATE TABLE TB_BOOK_TRANSLATOR(
        BOOK_NO VARCHAR2(10) REFERENCES TB_BOOK NOT NULL, 
        WRITER_NO VARCHAR2(10) REFERENCES TB_WRITER NOT NULL,  
        TRANS_LANG VARCHAR2(60),
        PRIMARY KEY(BOOK_NO, WRITER_NO)  
    );
ALTER TABLE TB_BOOK_TRANSLATOR
    RENAME CONSTRAINT SYS_C007159 TO FK_BOOK_TRANSLATOR_01;
ALTER TABLE TB_BOOK_TRANSLATOR
    RENAME CONSTRAINT SYS_C007160 TO FK_BOOK_TRANSLATOR_02;
ALTER TABLE TB_BOOK_TRANSLATOR    
    RENAME CONSTRAINT SYS_C007158 TO PK_BOOK_TRANSLATOR;

DROP TABLE TB_BOOK_TRANSLATOR;

-- 11. ���� ���� ����(compose_type)�� '�ű�', '����', '��', '����'�� �ش��ϴ� �����ʹ�
-- ���� ���� ���� ���̺��� ���� ���� ���� ���̺�(TB_BOOK_ TRANSLATOR)�� �ű�� SQL 
-- ������ �ۼ��Ͻÿ�. ��, ��TRANS_LANG�� �÷��� NULL ���·� �ε��� �Ѵ�. (�̵��� �����ʹ� ��
-- �̻� TB_BOOK_AUTHOR ���̺� ���� ���� �ʵ��� ������ ��)

SELECT COMPOSE_TYPE
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE = '�ű�' 
   OR COMPOSE_TYPE = '����'
   OR COMPOSE_TYPE = '��'
   OR COMPOSE_TYPE = '����';

INSERT INTO TB_BOOK_TRANSLATOR (
    BOOK_NO
    , WRITER_NO
    )    
    SELECT BOOK_NO, WRITER_NO
        FROM TB_BOOK_AUTHOR
        WHERE COMPOSE_TYPE = '�ű�' 
           OR COMPOSE_TYPE = '����'
           OR COMPOSE_TYPE = '��'
           OR COMPOSE_TYPE = '����';

DELETE FROM TB_BOOK_AUTHOR
    WHERE COMPOSE_TYPE = '�ű�' 
           OR COMPOSE_TYPE = '����'
           OR COMPOSE_TYPE = '��'
           OR COMPOSE_TYPE = '����';

-- 12. 2007�⵵�� ���ǵ� ������ �̸��� ������(����)�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT BOOK_NM, WRITER_NM
FROM TB_BOOK B, TB_BOOK_TRANSLATOR T, TB_WRITER W
WHERE B.BOOK_NO = T.BOOK_NO
AND T.WRITER_NO = W.WRITER_NO
AND EXTRACT(YEAR FROM (TO_DATE(B.ISSUE_DATE))) = 2007;


-- 13. 12�� ����� Ȱ���Ͽ� ��� ���������� �������� ������ �� ������ �ϴ� �並 �����ϴ� SQL
-- ������ �ۼ��Ͻÿ�. (�� �̸��� ��VW_BOOK_TRANSLATOR���� �ϰ� ������, ������, ��������
-- ǥ�õǵ��� �� ��)
CREATE OR REPLACE VIEW VW_BOOK_TRANSLATOR
AS SELECT BOOK_NM, WRITER_NM
    FROM TB_BOOK B, TB_BOOK_TRANSLATOR T, TB_WRITER W
    WHERE B.BOOK_NO = T.BOOK_NO
    AND T.WRITER_NO = W.WRITER_NO
    AND EXTRACT(YEAR FROM (TO_DATE(B.ISSUE_DATE))) = 2007
WITH READ ONLY;


SELECT * FROM VW_BOOK_TRANSLATOR;

-- 14. ���ο� ���ǻ�(�� ���ǻ�)�� �ŷ� ����� �ΰ� �Ǿ���. 
-- ���õ� ���� ������ �Է��ϴ� SQL
-- ������ �ۼ��Ͻÿ�.(COMMIT ó���� ��)
INSERT INTO TB_PUBLISHER
    (
    PUBLISHER_NM
    , PUBLISHER_TELNO
    , DEAL_YN
    )
    VALUES
    (
    '�� ���ǻ�'
    , '02-6710-3737'
    , DEFAULT
    );
    
    COMMIT;


-- 15. ��������(��٣���) �۰��� �̸��� ã������ �Ѵ�. 
-- �̸��� �������� ���ڸ� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT WRITER_NM, COUNT(WRITER_NM)
FROM TB_WRITER
GROUP BY WRITER_NM
HAVING COUNT(WRITER_NM) > 1;

-- 16. ������ ���� ���� �� ���� ����(compose_type)�� 
-- ������ �����͵��� ���� �ʰ� �����Ѵ�. 
-- �ش� �÷��� NULL�� ��� '����'���� �����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- (COMMIT ó���� ��)
SELECT COMPOSE_TYPE 
FROM TB_BOOK_AUTHOR
WHERE COMPOSE_TYPE IS NULL;

UPDATE TB_BOOK_AUTHOR
SET COMPOSE_TYPE = '����'
WHERE COMPOSE_TYPE IS NULL;


SELECT COMPOSE_TYPE
FROM TB_BOOK_TRANSLATOR;

COMMIT;

-- 17. �������� �۰� ������ �����Ϸ��� �Ѵ�. 
-- �繫���� �����̰�, �繫�� ��ȭ ��ȣ ������ 3�ڸ��� �۰���
-- �̸��� �繫�� ��ȭ ��ȣ�� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT WRITER_NM, OFFICE_TELNO
FROM TB_WRITER
WHERE OFFICE_TELNO LIKE '02-___-____';

-- 18. 2006�� 1�� �������� ��ϵ� �� 31�� �̻� �� 
-- �۰� �̸��� �̸������� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.

SELECT WRITER_NM
FROM TB_WRITER
WHERE TRUNC(MONTHS_BETWEEN('20060101', REGIST_DATE ) / 12 ) >= 31
ORDER BY 1; 


-- 19. ���� ��� �ٽñ� �α⸦ ��� �ִ� 'Ȳ�ݰ���' ���ǻ縦 ���� ��ȹ���� ������ �Ѵ�. 
-- 'Ȳ�ݰ���' ���ǻ翡�� ������ ���� �� 
-- ��� ������ 10�� �̸��� ������� ����, �����¸� ǥ���ϴ� SQL ������
-- �ۼ��Ͻÿ�. ��� ������ 5�� �̸��� ������ ���߰��ֹ��ʿ䡯��, 
-- �������� ���ҷ��������� ǥ���ϰ�, 
-- �������� ���� ��, ������ ������ ǥ�õǵ��� �Ѵ�.

SELECT BOOK_NM, 
    CASE WHEN STOCK_QTY < 5 THEN '�߰��ֹ��ʿ�'
    ELSE '�ҷ�����'
    END AS "������"
FROM TB_BOOK
WHERE PUBLISHER_NM = 'Ȳ�ݰ���'
AND STOCK_QTY < 10;


-- 20. '��ŸƮ��' ���� �۰��� ���ڸ� ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. 
-- (��� ����¡�������,�����ڡ�,�����ڡ��� ǥ���� ��)

-- W1: ������
-- W2: ������
SELECT B.BOOK_NM AS "������", W1.WRITER_NM "����", W2.WRITER_NM "����"
FROM TB_BOOK B, TB_WRITER W1, TB_WRITER W2, TB_BOOK_AUTHOR A, TB_BOOK_TRANSLATOR T
WHERE W1.WRITER_NO = A.WRITER_NO
AND W2.WRITER_NO = T.WRITER_NO
AND B.BOOK_NO = T.BOOK_NO
AND B.BOOK_NO = A.BOOK_NO
AND B.BOOK_NO = (SELECT BOOK_NO
                    FROM TB_BOOK
                    WHERE BOOK_NM = '��ŸƮ��');



-- 21. ���� �������� ���� �����Ϸκ��� �� 30���� ����ǰ�, 
-- ��� ������ 90�� �̻��� ������ ���� 
-- ������, ������, ���� ����, 20% ���� ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�. 
-- (��� ����� ��������, �����
-- ������, ������(Org)��, ������(New)���� ǥ���� ��. ��� ������ ���� ��, 
-- ���� ������ ���� ��, ������ ������ ǥ�õǵ��� �� ��)

SELECT BOOK_NM "������", STOCK_QTY "��� ����", PRICE "����(ORG)", PRICE - (PRICE * 0.2) "����(NEW)"
FROM TB_BOOK
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, ISSUE_DATE ) / 12 ) >= 30
AND STOCK_QTY >= 90
ORDER BY "��� ����" DESC, "����(NEW)" DESC, "������"; 