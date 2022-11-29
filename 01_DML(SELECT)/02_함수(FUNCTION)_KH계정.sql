
/*
    < �Լ� FUNCTION >
    ���޵� �÷����� �о�� �Լ��� ������ ����� ��ȯ��
    
    - ������ �Լ� : N���� ���� �о�鿩�� 'N'���� ������� ����
                    (�� �ึ�� �Լ� ���� ��� ��ȯ)
    - �׷� �Լ� : N���� ���� �о�鿩�� '1'���� ��� ���� ����
                    (�׷��� ���� �׷� ���� �Լ� ���� ��� ��ȯ)
                    
    >> SELECT ���� ������ �Լ��� �׷� �Լ��� �Բ� ��� ����!!
        ��? ��� ���� ������ �ٸ��� ����!
        
    >> �Լ����� ��� �� �� �ִ� ��ġ : SELECT��, WHERE��, ORDER BY ��, GROUP BY ��, HAVING ��
    
*/


/*
    < ���� ó�� �Լ� >
    
    * LENGTH / LENGTHB  => ��� �� NUMBER Ÿ��
    
    LENGTH(�÷�|'���ڿ���') : �ش� ���ڿ� ���� '���ڼ�' ��ȯ 
    LENGTHB(�÷�|'���ڿ���') : �ش� ���ڿ� ���� '����Ʈ��' ��ȯ 
    
    '��', '��', '��' : �ѱ��ڴ� 3����Ʈ EX.��ÿ� 9����Ʈ
    ������, ����, Ư������ : �� ���ڴ� 1����Ʈ
    
*/

    SELECT SYSDATE
    FROM DUAL;

    
    SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')
    FROM DUAL; -- �������̺�: ���̺� �� �� ���� �� ���� ��!
    
    SELECT LENGTH('oracle'), LENGTHB('oracle')
    FROM DUAL;
    
    SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
            EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
    FROM EMPLOYEE; -- �� �ึ�� �� ����ǰ� ����~! => ������ �Լ�
    
    /*
     INSTR : ���� ���� �����
     ���ڿ��κ��� Ư�� ������ ���� ��ġ�� ã�Ƽ� ��ȯ
     
    INSTR(�÷�|'���ڿ�', 'ã�����ϴ� ����', ['ã�� ��ġ�� ���� ��', [����]]) = ��� ���� NUMBER Ÿ��
    
    ã�� ��ġ�� ���� ��
    1 : �տ������� ã�ڴ�.
    -1 : �ڿ������� ã�ڴ�.
    
    */
    SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL;
    -- ã�� ��ġ�� ���� ���� 1�� �⺻ �� => �տ��� ���� ã��. ������ 1�� �⺻ ��
    SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL;
    SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- �ڿ��� ó�� ������ B�� ���ʿ��� ���� ���� 10�� ����
    SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- �տ��� ���� ���� 2��° B�� �ִ� ��
    SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- �ڿ��� ���� ã�µ� 3��° B�� �տ��� ���� �� ���
    
    SELECT EMAIL, INSTR(EMAIL, '_', 1, 1) AS "_��ġ", INSTR(EMAIL, '@') AS "����� ��ġ"
    FROM EMPLOYEE;  
        
--------------------------------------------------------------------------------------------------------------------
    
    /*
        < SUBSTR >
        ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ(�ڹٿ����� subString() �޼ҵ�� ����)
        
        SUBSTR(STRING, POSITION, [LENGTH]) = ������� CHARACTER Ÿ��
        - STRING : '����Ÿ���÷�' �Ǵ� '���ڿ���'
        - POSITION : ���ڿ��� ������ ������ġ��
        - LENGTH : ������ ���ڰ���(������ �������� �ǹ�)
        
    */
    
    SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
    SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL;
    
    SELECT EMP_NAME, SUBSTR(EMP_NO, 1,8), SUBSTR(EMP_NO, 8,1) AS "����"
    FROM EMPLOYEE;
    
    -- ���� ����鸸 ��ȸ
    SELECT EMP_NAME  
    FROM EMPLOYEE
    -- WHERE SUBSTR(EMP_NO, 8,1) = '2' OR SUBSTR(EMP_NO, 8,1) ='4';
    WHERE SUBSTR(EMP_NO, 8,1) IN ('2', '4');
    
    
    -- ���� ����鸸 ��ȸ
    SELECT EMP_NAME AS "�̸�", SUBSTR(EMP_NO, 1, 8) AS "�ֹι�ȣ"
    FROM EMPLOYEE
    WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3') -- ���������� �ڵ� ����ȯ(��Ģ������ '1', '3' ���ڿ�)
    -- ORDER BY 1 ORDER BY EMP_NAME;, �⺻�����δ� ��������
    ORDER BY "�ֹι�ȣ";
    
    -- �Լ� ��ø ���
    SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) AS "���̵�"
    FROM EMPLOYEE;
    
    --------------------------------------------------------------------------------------------------------------------
    
    /*
        < LPAD / RPAD >
        ���ڿ��� ��ȸ�� �� ���ϰ� �ְ� ��ȸ�ϰ��� �� �� ���
        
        LPAD/RPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰��� �Ѵ� ����])
        
        ���ڿ��� �����̰��� �ϴ� ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ��� ���� N���̸�ŭ�� ���ڿ� ��ȯ
        
    */
    
    -- 20��ŭ�� ���� �� EMAIL �÷� ���� ���������� ����, ������ �������� ä��
    SELECT EMP_NAME,LPAD(EMAIL, 20) -- �� 20�ڷ� ��ȯ
    -- �����̰��� �ϴ� ���� ������ �⺻���� ����
    FROM EMPLOYEE;
    
    SELECT EMP_NAME,LPAD(EMAIL, 20, '#')
    FROM EMPLOYEE;
    
    SELECT EMP_NAME,RPAD(EMAIL, 20, '#')
    FROM EMPLOYEE;
    
    --850101-2****** ������ ��ȸ => �� 14����
    SELECT RPAD('850101-2', 14, '*')
    FROM DUAL;
    
    SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1,8), 14, '*')
    FROM EMPLOYEE;
    -----------------------------------------------------------------------------------
    
    /*
        LTRIM / RTRIM
        ���ڿ����� Ư�� ���ڸ� ������ �������� ��ȯ�Ѵ�
        
        LTRIM / RTRIM (STRING, ['������ ���ڵ�']) => �����ϸ� ���� ��������
        
        ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ��� �ϴ� ���ڵ��� ã�Ƽ� ���� �� ���ڿ� ��ȯ
        
    */
    
    SELECT LTRIM('   K H ') FROM DUAL; 
    -- ���� ã�Ƽ� �����ϰ� ���� �ƴ� ���ڰ� ������ �׳� ����
    
    SELECT LTRIM('123123KH123', '123') FROM DUAL;
    SELECT LTRIM('ACABACCKH', 'ABC') FROM DUAL;
    
    SELECT RTRIM('5782KH123', '0123456789') FROM DUAL;
    
    /*
        < TRIM >
        ���ڿ��� �� / �� ���ʿ� �ִ� ������ ���ڵ��� ������ ������ ���ڿ� ��ȯ
        TRIM([[LEADING|TRAILING|BOTH]�����ϰ��� �ϴ� ���ڵ� FROM] STRING)
    */
    
    SELECT TRIM('   K H   ')FROM DUAL;
    -- SELECT TRIM('ZZZKHZZZ','Z')FROM DUAL;
    SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;
    
    SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- LEADING : ��, LTRIM�� ����
    SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- TRAILING : ��, RTRIM�� ����
    SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL;
    -- SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL; �ƹ� �͵� �Ⱦ��� BOTH
    -----------------------------------------------------------------------------------------
    
    
    /*
    
    < LOWER / UPPER / INITCAP >
    LOWER / UPPER / INITCAP (STRING) => ������� CHARACTER Ÿ��
    
    LOWER : �� �ҹ��ڷ� ������ ���ڿ� ��ȯ(�ڹٿ��� toLowerCase() �� ����)
    
    UPPER : �� �빮�ڷ� ������ ���ڿ� ��ȯ(�ڹٿ��� toUpperCase() �� ����)
    
    INITCAP : �ܾ� �ձ��ڸ��� �빮�ڷ� ������ ���ڿ� ��ȯ
    
        
    */
    
    SELECT LOWER('Welcome To My World!') FROM DUAL;
    SELECT UPPER('Welcome To My World!') FROM DUAL;
    SELECT INITCAP('welcome to my world') FROM DUAL;
---------------------------------------------------------------------------------------
    
    /*
    < CONCAT >
    ���ڿ� �ΰ� ���� �޾� �ϳ��� ��ģ �� ��� ��ȯ
    
    CONCAT(STRING, STRING) => ����� CHARACTER Ÿ��
    
    */
    
    SELECT CONCAT('ABC','CHOCOLATE') FROM DUAL;
    SELECT 'ABC' || 'CHOCOLATE' FROM DUAL;
    
    
    -- SELECT CONCAT('ABC','���ݸ�','�԰�ʹ�')FROM DUAL; // �����߻�, �ΰ��� ���� �� ����
    SELECT 'ABC' || '���ݸ�' || '�԰�ʹ�' FROM DUAL;
    
    
---------------------------------------------------------------------------------------
    
    /* 
        < REPLACE >
        
        REPLACE(STRING, STR, STR2) => ������� CHARACTER Ÿ��
        
    */
    
    SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
    FROM EMPLOYEE;
    
---------------------------------------------------------------------------------------

/*
    < ���� ó�� �Լ� >
    
    * ABS
    ������ ���밪�� ���ϴ� �Լ�
    
    ABS(NUMBER) => ������� NUMBER Ÿ��!!
    
*/
    SELECT ABS(-10) FROM DUAL;
    SELECT ABS(-5.7) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    MOD
    
    �� ���� ���� ������ ���� ��ȯ���ִ� �Լ�
    
    MOD(NUMBER1, NUMBER2) = ����� : NUMBER Ÿ��
    
*/

    SELECT MOD(10, 3) FROM DUAL;
    SELECT MOD(10.9, 3) FROM DUAL;
    SELECT MOD(3, 10) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    ROUND
    
    �ݿø��� ����� ��ȯ
    
    ROUND(NUMBER, [��ġ]) = ����� : NUMBER Ÿ��
    ��ġ�� �����ϸ� 0��° �ڸ����� �ݿø�(DEFAULT�� 0)
*/
    SELECT ROUND(123.456) FROM DUAL;
    
    SELECT ROUND(123.456, 1) FROM DUAL;
    
    SELECT ROUND(123.456, 5) FROM DUAL; -- ��ġ���� ū �� �Է½� �״�� ����
    
    SELECT ROUND(123.456, -1) FROM DUAL;
    
    SELECT ROUND(123.456, -2) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    < CEIL >
    �ø�ó�� ���ִ� �Լ�
    
    CEIL(NUMBER)
    
*/
    SELECT CEIL(123.152) FROM DUAL; -- �ݿø��� �ƴ� ������ �ø�, ��ġ���� �Ұ�

---------------------------------------------------------------------------------------
/*
    < FLOOR >
    �Ҽ��� �Ʒ� ����ó�� ���ִ� �Լ�
    <=> CEIL�� �ݴ�
    
    FLOOR(NUMBER)
    
*/
    SELECT FLOOR(123.152) FROM DUAL; -- ��ġ�����Ұ�
    SELECT FLOOR(123.952) FROM DUAL;

---------------------------------------------------------------------------------------

/*
    TRUNC(�����ϴ�)
    = ��ġ ���� ������ ����ó�� ���ִ� �Լ�
    
    TRUNC(NUMBER, [��ġ])

*/

    SELECT TRUNC(123.456) FROM DUAL; -- ��ġ ���� ���ϸ� FLOOR�� ����
    SELECT TRUNC(123.456, 1) FROM DUAL; -- �Ҽ��� 1��° �ڸ����� ������ ������ ����
    SELECT TRUNC(123.456, -1) FROM DUAL; -- �ش� ��ġ �ڷ� ����

---------------------------------------------------------------------------------------
    
    /*
    
    <��¥ ó�� �Լ�>
    
    */
    
-- SYSDATE : SYSTEM�� �ִ� ��¥ �� �ð� ��ȯ
--           ���� ��¥ �� �ð�

    SELECT SYSDATE FROM DUAL; -- Ŭ���ؼ� Ȯ���غ��� �ð��� Ȯ�� ����
    
    -- MONTHS_BETWEEN  (DATE1, DATE2)
    -- : �� ��¥ ������ ���� �� => ���������� (DATE1-DATE2) ��, ������ 30, 31 ����
    -- => ��� ���� NUMBER Ÿ��!!
    
    -- �����, �ٹ��ϼ�, �ٹ�������
    SELECT EMP_NAME, FLOOR(SYSDATE - HIRE_DATE) || '��' AS "�ٹ��ϼ�"
    , CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) || '����' AS "�ٹ�������"
    FROM EMPLOYEE;

---------------------------------------------------------------------------------------   
    /*
        < ADD_MONTHS(DATE, NUMBER) >
        : Ư�� ��¥�� �ش� ���ڸ�ŭ�� ���� ���� ���ؼ� ��¥�� ����
        : ������� DATE Ÿ��
    */
    
    SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;
    
-- EMPLOYEE���� �����, �Ի���, �Ի� �� 6������ �� ��¥

    SELECT EMP_NAME AS "�̸�", HIRE_DATE AS "�Ի���", ADD_MONTHS(HIRE_DATE, 6) AS "6���� ��"
    FROM EMPLOYEE;
    
    /*
    
    < NEXT_DAY(DATE, DAY(����|����) >
    : Ư�� ��¥ ���Ŀ� ����� �ش� ������ ��¥�� ��ȯ���ִ� �Լ�
    : ������� DATE Ÿ��
    
    */
    
    SELECT SYSDATE, NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;
    SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
    SELECT SYSDATE, NEXT_DAY(SYSDATE, 1) FROM DUAL; -- 1�� �Ͽ���
    SELECT SYSDATE, NEXT_DAY(SYSDATE, 7) FROM DUAL; -- 7�� �����
    SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
    
    SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;

    -- ��� ����
    SELECT *
    FROM NLS_SESSION_PARAMETERS;
    
    ALTER SESSION SET NLS_LANGUAGE = KOREAN;
    
     /*
    
    < LAST_DAY(DATE) >
    : �ش� ���� ������ ��¥�� ���ؼ� ��ȯ
    : ������� DATE Ÿ��
    
    */
    
    SELECT LAST_DAY(SYSDATE) FROM DUAL;
    
    
    -- EMPLOYEE���� �����, �Ի���, �Ի��� ���� ������ ��, �ٹ� �ϼ�
    SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE) AS "������ ��", (LAST_DAY(HIRE_DATE) - HIRE_DATE) AS "�ٹ��ϼ�"
    FROM EMPLOYEE;
    
    /*
    
    < EXTRACT >
    : Ư�� ��¥�� ���� �⵵|��|�� ���� �����ؼ� ��ȯ�ϴ� �Լ�
    
    EXTRACT(YEAR FROM DATE) : �⵵�� ����
    EXTRACT(MONTH FROM DATE) : ���� ����
    EXTRACT(DAY FROM DATE) : �ϸ� ����
    
    
    */
    
    
    SELECT EMP_NAME AS "�̸�", EXTRACT(YEAR FROM HIRE_DATE) || '��' AS "�Ի�⵵",
    EXTRACT(MONTH FROM HIRE_DATE) || '��' AS "�Ի��", EXTRACT(DAY FROM HIRE_DATE) || '��' AS "�Ի���"
    FROM EMPLOYEE
    --ORDER BY "�Ի�⵵", "�Ի��", "�Ի���"  ASC;
    ORDER BY 2;
    
    SELECT EMP_NAME, EMAIL, PHONE
    FROM EMPLOYEE
    ORDER BY PHONE DESC NULLS LAST;
    
    
----------------------------------------------------------------------------
/*
    < ����ȯ �Լ� >
    1. TO_CHAR() : ���� Ÿ�� �Ǵ� ��¥ Ÿ���� ���� ���� Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_CHAR(����|��¥, [����])
    => ����� : CHARACTER Ÿ��
    
*/

    -- ����Ÿ�� => ����Ÿ��
    SELECT TO_CHAR(1234) FROM DUAL; -- '1234'�� �ٲ�� ����
    SELECT TO_CHAR(1234, '9999') FROM DUAL; -- �ټ�ĭ¥�� ���� Ȯ��, ������ ����, ��ĭ ����
    SELECT TO_CHAR(1234, '00000') FROM DUAL; -- �ټ�ĭ¥�� ���� Ȯ��, ��ĭ 0���� ä��
    SELECT TO_CHAR(1234, 'L99999') FROM DUAL; -- ���� ������ ����(LOCAL)�� ȭ������� �ٿ��� ���
    SELECT TO_CHAR(1234, '$99999') FROM DUAL; -- $
    
    SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;

    SELECT EMP_NAME, TO_CHAR(SALARY, 'L999,999,999')    
    FROM EMPLOYEE;
    
    -- ��¥Ÿ�� => ����Ÿ��
    SELECT SYSDATE, TO_CHAR(SYSDATE) FROM DUAL;
    -- DATE Ÿ���̸� ������ �� �޷��� ���;� ��

    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH:MI:SS') FROM DUAL;
    -- �ð� ����, 12�ð�

    SELECT SYSDATE, TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
    -- �ٸ� �ð� ǥ�� ���, 24�ð�

    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
    SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL;

    SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL; -- 00�� 0000��
    
    SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD')
    FROM EMPLOYEE;
    
    -- EX) 1990�� 02�� 06��
    SELECT EMP_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"')
    FROM EMPLOYEE;
    -- ���� ���� ������ �� ""�� ����
    
    -- �⵵�� ���õ� ����
    SELECT TO_CHAR(SYSDATE, 'YYYY'), 
    TO_CHAR(SYSDATE, 'YY'), 
    TO_CHAR(SYSDATE, 'RRRR'), 
    TO_CHAR(SYSDATE, 'RR'),
    TO_CHAR(SYSDATE, 'YEAR')
    FROM DUAL;
    
    -- ���� ���õ� ����
    SELECT TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'MON'),
    TO_CHAR(SYSDATE, 'MONTH'),
    TO_CHAR(SYSDATE, 'RM')
    FROM DUAL;
    
    -- �ϰ� ���õ� ����
    SELECT TO_CHAR(SYSDATE, 'DDD'), -- 365�� �߿� ������ ��ĥ °?
    TO_CHAR(SYSDATE, 'DD'), -- �� �������� ������ ��ĥ ° ����
    TO_CHAR(SYSDATE, 'D') -- �� �������� ��ĥ ° ����
    FROM DUAL;
     
     -- ���ϰ� ���õ� ����
     SELECT TO_CHAR(SYSDATE, 'DAY'),
     TO_CHAR(SYSDATE, 'DY')
     FROM DUAL;
     
------------------------------------------------------------------------------

/*
    < TO_DATE >
    ���� Ÿ�� �Ǵ� ���� Ÿ�� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_DATE(����|����, [����])
    
    ����� : DATE Ÿ
*/

    SELECT TO_DATE(20100101) FROM DUAL;
    SELECT TO_DATE(100101)FROM DUAL;
    SELECT TO_DATE('070101')FROM DUAL;
    -- ���ڸ��� 0�̸� Ȭ����ǥ�� ��������
    -- SELECT TO_DATE('041030 143000')FROM DUAL; ���� �߻�
    SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS')FROM DUAL;
    
    SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL; -- 2014��
    SELECT TO_DATE('980630','YYMMDD') FROM DUAL; -- 2098��
    -- => ������ �� ����� �ݿ�
    
    -- 'YY' => 'RR'
    SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL; -- 2014��
    -- RR(14)�� 50���� �۾Ƽ� �� ����
    SELECT TO_DATE('980630','RRMMDD') FROM DUAL; -- 1998��
    -- RR(98)�� 50���� Ŀ�� ���� ����
    
------------------------------------------------------------------------------ 

/*
    < TO_NUMBER >
    ���� Ÿ���� �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_NUMBER(����, [����]) => ������� NUMBER Ÿ��
    
*/

    SELECT TO_NUMBER('05123475') FROM DUAL; -- ����Ÿ���� �տ� 0�� �� �پ ���ư� ��
    SELECT '10000000' + '550000' FROM DUAL; -- ����Ŭ������ �ڵ� ����ȯ�� �� �Ǿ� ����
    --SELECT '1,000,000' + '55,000' FROM DUAL; -- �ȿ� ���ڸ� �־�� �ڵ� ����ȯ
    SELECT TO_NUMBER('1,000,000' , '9,999,999') + TO_NUMBER('55,000', '99,999') FROM DUAL;
    
------------------------------------------------------------------------------    
    
/*
    < NULL ó�� �Լ� >
    
    �߿�**
    
*/
    -- NVL(�÷�, �ش� �÷����� NULL�� ����� ��ȯ ��)
    SELECT EMP_NAME, BONUS, NVL(BONUS , 0)
    FROM EMPLOYEE;
    
    -- ��ü ����� �̸�, ���ʽ� ���� ����
    SELECT EMP_NAME, (SALARY + (SALARY * BONUS)) * 12 AS "������", (SALARY + SALARY * NVL(BONUS,0)) * 12 AS "������"
    FROM EMPLOYEE;
    
    SELECT EMP_NAME, NVL(DEPT_CODE, '�μ� ����') AS "�μ�"
    FROM EMPLOYEE;
    
-- NVL2(�÷�, ��ȯ��1, ��ȯ��2)
-- �÷����� ������ ��� ��ȯ��1 ��ȯ
-- �÷����� NULL�� ��� ��ȯ��2 ��ȯ
    SELECT EMP_NAME, NVL2(DEPT_CODE, '�μ� ����', '�μ� ����')
    FROM EMPLOYEE;
    
    
-- ���ʽ��� �ִ� ����� 0.7 ���� ����� 0.1
    SELECT EMP_NAME, NVL2(BONUS, 0.7, 0.1) AS "������"
    FROM EMPLOYEE;
    
-- NULLIF(�񱳴��1, �񱳴��2)
-- �� ���� ���� ��ġ�ϸ� NULL ��ȯ
-- �� ���� ���� ��ġ���� ������ �񱳴��1�� ���� ��ȯ

    SELECT NULLIF('123', '123') FROM DUAL;
    SELECT NULLIF('123', '456') FROM DUAL;

------------------------------------------------------------------------------ 
/*
    < ���� �Լ� >
    DECODE(���ϰ��� �ϴ� ���(�÷�|�������|�Լ���), �񱳰�1, �����1, �񱳰�2, �����2, ...)
    
    SWITCH(�񱳴��) {
    CASE �񱳰�1 : BREAK;
    CASE �񱳰�2 : BREAK;
    ...
    DEFAULT : 

*/

-- ���, �����, �ֹι�ȣ
SELECT 
EMP_ID, EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "�޹�ȣ" , 
DECODE(SUBSTR(EMP_NO, 8,1), '1', '����', '2', '����') AS "����"
FROM EMPLOYEE;
    
-- ������ �޿� ��ȸ�� �� ���޺��� �λ��ؼ� ��ȸ
-- J7�� ��� �޿� 10% �λ� (SALARY * 1.1) 
-- J6�� ��� �޿� 15% �λ� (SALARY * 1.15)
-- J5�� ��� �޿� 20% �λ� (SALARY * 1.2)
-- �׿� ��� �޿� 5% �λ� (SALARY * 1.05)

SELECT
EMP_NAME, JOB_CODE, SALARY,
DECODE(JOB_CODE, 
'J7', SALARY * 1.1, 
'J6', SALARY * 1.15, 
'J5', SALARY * 1.2,
SALARY * 1.05) AS "�λ�� �޿�"
FROM EMPLOYEE;

------------------------------------------------------------------------------ 
/*
    < CASE WHEN THEN >
    CASE WHEN ���ǽ�1 THEN �����1
         WHEN ���ǽ�2 THEN �����2
         ...
         ELSE �����
    END
*/
SELECT EMP_NAME, SALARY,
    CASE WHEN SALARY >= 5000000 THEN '��� ������'
         WHEN SALARY >= 3500000 THEN '�߱� ������'
         ELSE '�ʱ� ������'
    END AS "����"
FROM EMPLOYEE;
------------------------------------------------------------------------------
------------------------------ �� �� �� �� ------------------------------------

-- 1. SUM(����Ÿ���÷�)
-- : �ش� �÷� ������ �� �հ踦 ���ؼ� ��ȯ���ִ� �Լ�

-- EMPLOYEE ���̺��� �� ����� �� �޿� ��
SELECT SUM(SALARY)
FROM EMPLOYEE; -- ��ü ����� �� �׷����� ����

-- ���� ����� �޿� ��
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) = '1';
-- ���� ������� �� �׷����� ����

-- �����غ���
-- �μ��ڵ尡 D5�� ������� �� ���� ��
SELECT TO_CHAR(SUM(SALARY*12), 'L999,999,999') AS "������ ��"
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

-- 2. AVG(����Ÿ��) : �ش� �÷����� ��հ��� ���ؼ� ��ȯ
-- ��ü ����� ��� �޿� ��ȸ
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

-- 3. MIN(���� Ÿ�� : �ش� �÷����� �߿� ���� ���� �� ���ؼ� ��ȯ)
SELECT MIN(EMP_NAME), MIN(SALARY), MIN(HIRE_DATE)
FROM EMPLOYEE;

-- 4. MAX(���� Ÿ�� : �ش� �÷� ���� �� ���� ū �� ���ؼ� ��ȯ)
SELECT MAX(EMP_NAME), MAX(SALARY), MAX(HIRE_DATE)
FROM EMPLOYEE;

-- 5. COUNT(* | �÷� | DISTINCT �÷�) : ��ȸ�� �� ������ ���� ��ȯ
-- COUNT(*) : ��ȸ�� ����� ��� �� ������ ���� ��ȯ
-- COUNT(�÷�) : ������ �ش� �÷� ���� NULL�� �ƴ� �͸� �� ���� ���� ��ȯ
-- COUNT(DISTINCT �÷�) : �ش� �÷� �� �ߺ��� ������ �� �� ���� ���� ��ȯ

-- ��ü ��� ��
SELECT COUNT(*)
FROM EMPLOYEE; -- ��� �� ���� ���

-- ��ü ���� ��� ��
SELECT COUNT(*)
FROM EMPLOYEE 
WHERE SUBSTR(EMP_NO, '8','1') = '2';


-- ���ʽ� �޴� ��� ��
SELECT COUNT(BONUS) -- �÷��� NULL�� �ƴ� �͸� ī�����Ѵ�
FROM EMPLOYEE;

-- SELECT * FROM EMPLOYEE
-- WHERE BONUS IS NOT NULL;

-- �μ���ġ�� ���� ��� ��
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE;

-- SELECT * FROM EMPLOYEE
-- WHERE DEPT_CODE IS NOT NULL;

-- DISTINCT
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;


SELECT DISTINCT DEPT_CODE FROM EMPLOYEE
WHERE DEPT_CODE IS NOT NULL;






