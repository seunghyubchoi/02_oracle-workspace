
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
    
    
---------------------------------------------------------------------------------------