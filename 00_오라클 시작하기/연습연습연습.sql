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
     
     
----------------------------------------------------------------------------------

    -- ROUND
    SELECT ROUND(123.456, 1) FROM DUAL;
    
    SELECT ROUND(123.456, -1) FROM DUAL;

    -- CEIL
    SELECT CEIL(123.456) FROM DUAL;
    SELECT CEIL(0.9) FROM DUAL;
    
    -- FLOOR
    SELECT FLOOR(123.456) FROM DUAL;
    SELECT CEIL(0.9) FROM DUAL;
    SELECT CEIL(-1.5) FROM DUAL;
    
    - TRUNC
    SELECT TRUNC(123.456) FROM DUAL;
    SELECT TRUNC(123.456, 1) FROM DUAL;
    SELECT TRUNC(123.456, 2) FROM DUAL;
    SELECT TRUNC(0.9) FROM DUAL;
    
    SELECT SYSDATE FROM DUAL;
    
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) FROM EMPLOYEE;
    
    SELECT ADD_MONTHS(SYSDATE,6) FROM DUAL;
    
    SELECT EMP_NAME, ADD_MONTHS(HIRE_DATE, 6) FROM EMPLOYEE;
    
    SELECT NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;
    
    SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL;
    
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    
    SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), (LAST_DAY(HIRE_DATE) - HIRE_DATE)
    FROM EMPLOYEE;
    
    SELECT EMP_NAME, HIRE_DATE, EXTRACT(YEAR FROM HIRE_DATE) AS "�Ի�⵵", EXTRACT(MONTH FROM HIRE_DATE) AS "�Ի��", EXTRACT(DAY FROM HIRE_DATE) AS "�Ի���"
    FROM EMPLOYEE
    ORDER BY 2;
    
    
--------------------------------------------------------------------------------

    SELECT TO_CHAR(1234) FROM DUAL;
    SELECT TO_CHAR(1234, '99999') FROM DUAL;
    SELECT TO_CHAR(1234, '00000') FROM DUAL;
    SELECT TO_CHAR(1234, 'L99999') FROM DUAL;
    SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;
    SELECT TO_CHAR(SALARY, 'L999,999,999') FROM EMPLOYEE;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH:MI:SS') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
    
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL;
    
    SELECT TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" DY"����"') FROM EMPLOYEE;
    
    SELECT TO_CHAR(-123, '0000') FROM DUAL;
    
    SELECT TO_DATE(20100101) FROM DUAL;
    
    SELECT TO_DATE('070101') FROM DUAL;
    
    SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS') FROM DUAL;
    
    SELECT TO_CHAR(SYSDATE, 'DL') FROM DUAL;
    
    SELECT TO_CHAR