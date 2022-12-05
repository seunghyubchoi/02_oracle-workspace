-- [Basic SELECT]


-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"
-- ���� ǥ���ϵ��� �Ѵ�.
SELECT DEPARTMENT_NAME AS "�а� ��", CATEGORY AS "�迭"
FROM TB_DEPARTMENT;

-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
SELECT DEPARTMENT_NAME || '�� ������ ' || CAPACITY || '�� �Դϴ�.' AS "�а��� ����"
FROM TB_DEPARTMENT;

-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
-- ���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
-- ã�� ������ ����)
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN, 8,1) = '2' AND DEPARTMENT_NO = 001 AND ABSENCE_YN = 'Y';

-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO = 'A513079' 
OR STUDENT_NO = 'A513090' 
OR STUDENT_NO = 'A513091' 
OR STUDENT_NO = 'A513110' 
OR STUDENT_NO = 'A513119'
ORDER BY STUDENT_NAME DESC;

-- 5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
-- ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����.
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;

-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�
SELECT STUDENT_NO, STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '����%' 
AND EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002 
AND ABSENCE_YN ='N';

-- [Additional SELECT - �Լ�]
-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
-- ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
-- ǥ�õǵ��� ����
SELECT STUDENT_NO AS "�й�", STUDENT_NAME AS "�̸�", TO_CHAR(ENTRANCE_DATE, 'RRRR-MM-DD') AS "���г⵵"
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ���г⵵;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
-- �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
-- 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
-- �������.)


SELECT PROFESSOR_NAME AS "�����̸�", 
EXTRACT(YEAR FROM SYSDATE) - (EXTRACT(YEAR FROM (TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD'))) - 100) AS "����"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8,1) = 1
ORDER BY 2;

-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
-- ?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME, 2,2) AS "�̸�"
FROM TB_PROFESSOR;

-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�? �̶�,
-- 19 �쿡 �����ϸ� ����� ���� ���� ������ �A������.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM (TO_DATE(SUBSTR(ENTRANCE_DATE, 1,8)))) - EXTRACT(YEAR FROM (TO_DATE(SUBSTR(STUDENT_SSN, 1,6)))) NOT BETWEEN 18 AND 19;

-- 6. 2020 �� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(TO_DATE('20201225'), 'DAY') FROM DUAL;

-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
-- �� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'),
-- TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����?
SELECT 
EXTRACT (YEAR FROM (TO_DATE('99/10/11','YY/MM/DD'))) AS "2099��",
EXTRACT (MONTH FROM (TO_DATE('99/10/11','YY/MM/DD'))) AS "2099��",
EXTRACT (DAY FROM (TO_DATE('99/10/11','YY/MM/DD'))) AS "2099��",

EXTRACT (YEAR FROM (TO_DATE('49/10/11','YY/MM/DD'))) AS "2049��",
EXTRACT (MONTH FROM (TO_DATE('49/10/11','YY/MM/DD'))) AS "2049��",
EXTRACT (DAY FROM (TO_DATE('49/10/11','YY/MM/DD'))) AS "2049��",

EXTRACT (YEAR FROM (TO_DATE('99/10/11','RR/MM/DD'))) AS "1999��",
EXTRACT (MONTH FROM (TO_DATE('99/10/11','RR/MM/DD'))) AS "1999��",
EXTRACT (DAY FROM (TO_DATE('99/10/11','RR/MM/DD'))) AS "1999��",

EXTRACT (YEAR FROM (TO_DATE('49/10/11','RR/MM/DD'))) AS "2049��",
EXTRACT (MONTH FROM (TO_DATE('49/10/11','RR/MM/DD'))) AS "2049��",
EXTRACT (DAY FROM (TO_DATE('49/10/11','RR/MM/DD'))) AS "2049��"
FROM DUAL;

-- 8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
-- ���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE NOT STUDENT_NO LIKE 'A%';

-- 9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
-- �ڸ������� ǥ������.
SELECT ROUND(AVG(POINT), 1) AS "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
-- ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO, COUNT(DEPARTMENT_NO)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ����
-- �ۼ��Ͻÿ�.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
-- �Ҽ��� ���� �� �ڸ������� ǥ������.
SELECT EXTRACT(YEAR FROM (TO_DATE(TERM_NO, 'YYMM'))) AS "�⵵"
, ROUND(AVG(POINT), 1) AS "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY EXTRACT(YEAR FROM (TO_DATE(TERM_NO, 'YYMM')))
ORDER BY 1;


-- 13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������
-- �ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO AS "�а��ڵ��", COUNT(DECODE (ABSENCE_YN, 'Y', 1)) AS "���л� ��"
--COUNT(ABSENCE_YN)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
--HAVING COUNT(ABSENCE_YN) >= 0
ORDER BY 1;

-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL
-- ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME AS "�����̸�", COUNT(STUDENT_NAME) AS "������ ��"
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 1;

SELECT * 
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113';


-- 15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
-- ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ�
-- ǥ������.)
SELECT  NVL(SUBSTR(TERM_NO,1,4), ' ') AS "�⵵", NVL(SUBSTR(TERM_NO,5,2), ' ') AS "�б�", ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113' 
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4),SUBSTR(TERM_NO,5,2));

-- [ADDITIONAL SELECT - OPTION]
-- 1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
-- ������ �̸����� �������� ǥ���ϵ��� ����.

SELECT STUDENT_NAME AS "�л� �̸�", STUDENT_ADDRESS AS "�ּ���"
FROM TB_STUDENT
ORDER BY 1;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY 2 DESC;

-- 3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�,
-- �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
-- "������ �ּ�" �� ��µǵ��� ����.
SELECT STUDENT_NAME AS "�л��̸�", STUDENT_NO AS "�й�", STUDENT_ADDRESS AS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_NO LIKE '9%' AND STUDENT_ADDRESS LIKE '��⵵%' OR STUDENT_ADDRESS LIKE '������%'
ORDER BY 1 ASC;

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
-- �ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
-- ������ ����)
SELECT  PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = 005
ORDER BY 2 ASC;

-- 5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������
-- ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
-- �ۼ��غ��ÿ�.

SELECT STUDENT_NO, TO_CHAR(POINT, '9.99') AS "POINT"
FROM TB_GRADE
WHERE TERM_NO LIKE '200402' AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC;

-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL
-- ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT S, TB_DEPARTMENT D
WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO;

-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS S, TB_DEPARTMENT D
WHERE S.DEPARTMENT_NO = D.DEPARTMENT_NO;

-- 8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ����
-- �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C
JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
JOIN TB_DEPARTMENT D ON (C.DEPARTMENT_NO = D.DEPARTMENT_NO);

-- 9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿�
-- �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C
JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
JOIN TB_PROFESSOR P USING(PROFESSOR_NO)
JOIN TB_DEPARTMENT D ON(P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE CATEGORY =  '�ι���ȸ';

-- 10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�",
-- "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
-- �ݿø��Ͽ� ǥ���Ѵ�.)
SELECT STUDENT_NO, STUDENT_NAME, ROUND(AVG(POINT),1)
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 1;

-- 11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
-- ���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
-- �ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
-- ��µǵ��� �Ѵ�.
SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME 
FROM TB_DEPARTMENT 
JOIN TB_STUDENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

-- 12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ�
-- SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT S, TB_GRADE G, TB_CLASS C 
WHERE S.STUDENT_NO = G.STUDENT_NO
AND C.CLASS_NO = G.CLASS_NO
AND TERM_NO LIKE'2007%'
AND CLASS_NAME = '�ΰ������'; 

-- 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
-- �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS C
JOIN TB_DEPARTMENT D USING (DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR P ON (C.CLASS_NO = P.CLASS_NO) 
WHERE CATEGORY = '��ü��'
AND PROFESSOR_NO IS NULL
ORDER BY DEPARTMENT_NAME, CLASS_NAME;

-- 14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� ����. �л��̸���
-- �������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������?����
-- ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�л��̸�?, ?��������?��
-- ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� ����.
SELECT STUDENT_NAME, NVL(PROFESSOR_NAME, '�������� ������')
FROM TB_STUDENT S
JOIN TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
LEFT JOIN TB_PROFESSOR P ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
WHERE DEPARTMENT_NAME = '���ݾƾ��а�'
ORDER BY 1 ASC, 2 DESC;

-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�
-- �̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO AS "�й�", STUDENT_NAME AS "�̸�", DEPARTMENT_NAME AS "�а� �̸�",TRUNC(AVG(POINT),8) AS "����"
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE ABSENCE_YN = 'N'
HAVING AVG(POINT) >= 4.0
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
ORDER BY 1;

-- 16. �Q�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�
SELECT CLASS_NO, CLASS_NAME, ROUND(AVG(POINT),8) AS "AVG(POINT)"
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (CLASS_NO)
WHERE DEPARTMENT_NAME = 'ȯ�������а�'
AND CLASS_TYPE LIKE '����%'
GROUP BY CLASS_NO, CLASS_NAME;

-- 17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ�
-- SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME
                            FROM TB_STUDENT 
                            JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
                            WHERE STUDENT_NAME = '�ְ���');
                            

-- 18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL ����
-- �ۼ��Ͻÿ�.
SELECT STUDENT_NO, STUDENT_NAME 
FROM TB_STUDENT 
JOIN TB_GRADE USING (STUDENT_NO) 
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '������а�' 
GROUP BY STUDENT_NO, STUDENT_NAME 
HAVING AVG(POINT) = 
(SELECT MAX(AVG(POINT))
FROM TB_GRADE
JOIN TB_STUDENT USING (STUDENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '������а�'
GROUP BY STUDENT_NO, STUDENT_NAME);

-- 19. �� ������б��� "�Q�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������
-- �ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�. ��, �������� "�迭 �а���",
-- "��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ���
-- ����.
SELECT DEPARTMENT_NAME, TRUNC(AVG(POINT),1)
FROM TB_DEPARTMENT
JOIN TB_CLASS USING (DEPARTMENT_NO)
JOIN TB_GRADE USING (CLASS_NO)
WHERE CATEGORY = (SELECT CATEGORY 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = 'ȯ�������а�')
GROUP BY DEPARTMENT_NAME
ORDER BY DEPARTMENT_NAME ;
