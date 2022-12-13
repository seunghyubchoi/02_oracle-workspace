-- QUIZ1
-- CREATE USER TEST IDENTIFIED 1234; ����
-- USER TEST��(��) ���� �ƽ��ϴ�.
-- ���� ������ �ϰ� ���� => ����!!

-- �� ������ ������?
-- ������ :  ���������� �߰�, ���ӱ����� �ο����� �ʾұ� ������
-- ��ġ�� ������ : GRANT CONNECT, RESOURCE TO TEST;

-- QUIZ2
CREATE TABLE TB_JOB(
    JOBCODE NUMBER PRIMARY KEY,
    JOBNAME VARCHAR2(10) NOT NULL
);

CREATE TABLE TB_EMP(
    EMPNO NUMBER PRIMARY KEY,
    EMPNAME VARCHAR2(10) NOT NULL,
    JOBNO NUMBER REFERENCES TB_JOB(JOBCODE)
);

-- ���� �� ���̺��� �ִٴ� �����Ͽ�
-- �� ���̺��� �����ؼ� EMPNO, EMPNAME, JOBNO, JOBNAME �÷��� ��ȸ�� ��
-- �� �� ������ SQL��
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
JOIN TB_JOB USING (JOBNO);
-- �����ߴ��� ���� �߻�
-- ORA-00904: "TB_JOB"."JOBNO": invalid identifier
-- ������ : JOBNO �÷��� TB_EMP���� ���������� TB_JOB���� �������� �ʱ� ������ USING ���� �� ��
-- �ذ᳻�� : UYSING(JOBNO)�� �ƴ϶� ON �� (JOBNO=JOBCODE)�� ����Ѵ�
-- ��ġ�� ���� : 
SELECT EMPNO, EMPNAME, JOBNO, JOBNAME
FROM TB_EMP
JOIN TB_JOB ON (JOBCODE=JOBNO);

-- ���̺� ���� ���� ������ Ÿ�� (CHAR, VARCHAR2 ������)
-- ����Ŭ ��ü ���� ���� (SEQUENCE, VIEW .. ) ���� �������� ���ǿ� ���Ͽ�
-- �������� => �ڴʰ� ���������� �߰��� �� �ִ� ALTER �� �ۼ�
-- DCL? = GRANT, REVOKE
-- COMMIT? ROLLBACK?