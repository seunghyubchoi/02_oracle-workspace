/*
    < �Լ� FUNCTION >
    ���޵� �÷����� �о�鿩�� �Լ��� ������ ����� ��ȯ ��
    
    - ������ �Լ� : N���� ���� �Ͼ�鿩�� 'N'���� ������� ����
                    (�� �ึ�� �Լ� ���� ��� ��ȯ)
                    
    - �׷� �Լ� : N���� ���� �о�鿩�� '1'���� ��� ���� ����
                    (�׷��� ���� �׷� ���� �Լ� ���� ��� ��ȯ)
                    
    >> SELECT ���� ������ �Լ��� �׷� �Լ��� �Բ� ��� �� ��
    >> ��? ������� ������ �ٸ��� ����
    
    >> �Լ����� ����� �� �ִ� ��ġ : SELECT��, WHERE��, ORDER BY��, GROUP BY��, HAVING��
    
*/

/*
    < ���� ó�� �Լ� >
    LENGTH / LENGTHB => ����� NUMBER Ÿ��
    
    LENGTH(�÷�|'���ڿ���'): �ش� ���ڿ� ���� ���ڼ� ��ȯ
    LENGTHB(�÷�|'���ڿ���'): �ش� ���ڿ� ���� ����Ʈ�� ��ȯ
    
    '��', '��', '��' : �ѱ��ڴ� 3����Ʈ ��ÿ� = 9����Ʈ
    ������, ����, Ư�� : �ѱ��ڴ� 1����Ʈ
    
    
*/

SELECT SYSDATE FROM DUAL;

SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ') FROM DUAL;
SELECT LENGTH('oracle'), LENGTHB('oracle') FROM DUAL;
SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME), EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE;
-- �� �ึ�� �� ����ǰ� �ִ� �Լ��� ������ �Լ���� �Ѵ�

/*
    INSTR : ���ڿ��κ��� Ư�� ������ ���� ��ġ�� ã�Ƽ� ��ȯ
    
    INSTR (�÷�|'���ڿ�', 'ã�����ϴ� ����', ['ã�� ��ġ�� ���� ��', [����]])
    = ��� ���� NUBER Ÿ��
    
    ã�� ��ġ�� ���� ��
    1: �տ������� ã�ڴ�.
    -1 : �ڿ������� ã�ڴ�.
    
*/

SELECT INSTR('AABAACAABBAA','B') FROM DUAL;
SELECT INSTR('AABAACAABBAA','B',1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;
-- �ڿ��� ó�� ������ B�� ���ʿ������� ���� 10�� ����
SELECT INSTR('�氡�氩���氥��', '��', 1,2) FROM DUAL;
SELECT INSTR('�氡�氡���丮�츮ģ�����丮', '��', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1,1) AS "_��ġ", INSTR(EMAIL, '@') AS "����� ��ġ" FROM EMPLOYEE;


SELECT SUBSTR('�氡�氡���丮�츮ģ�����丮', 6) FROM DUAL;
SELECT SUBSTR('�氡�氡���丮�츮ģ�����丮', 5,2) FROM DUAL;
SELECT SUBSTR('�氡�氡���丮�츮ģ�����丮', 1,7) FROM DUAL;
SELECT SUBSTR('�氡�氡���丮�츮ģ�����丮', -7, 6) FROM DUAL;

SELECT EMP_NAME, SUBSTR(EMP_NO, 1,8), SUBSTR(EMP_NO, 8,1) AS "����"
FROM EMPLOYEE;


    -- ���� ����鸸 ��ȸ
    SELECT EMP_NAME
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) = '2';

    -- ���� ����鸸 ��ȸ
    SELECT EMP_NAME
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) = '1';

    -- �Լ� ��ø ���
    SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') -1)
    FROM EMPLOYEE;
    
    
     -- 20��ŭ�� ���� �� EMAIL �÷� ���� ���������� ����, ������ �������� ä��
     SELECT EMP_NAME, LPAD(EMAIL, 20)
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
     FROM EMPLOYEE;
     
     SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1, 8), 14, '*')
     FROM EMPLOYEE;
     
     SELECT 
     FROM EMPLOYEE;
     WHILE SUBSTR(EMP_NO, 