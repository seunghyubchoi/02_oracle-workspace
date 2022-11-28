-- ���� ���� �ϱ�
-- QUIZ 1
-- ���ʽ��� �� ������ �μ���ġ�� �� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE BONUS = NULL AND DEPT_CODE != NULL;
-- NULL ���� ���� ���������� �� ó�� ���� ����

-- ������ : NULL �� ���� ���� �ܼ��� �Ϲ� �� �����ڸ� ���� ���� �� ����


-- �ذ��� : IS NULL / IS NOT NULL ����Ͽ� ���ؾ��Ѵ�

-- ��ġ�� SQL�� 
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL AND DEPT_CODE IS NOT NULL;
--------------------------------------------------------------------------------
-- QUIZ 2
-- �˻��ϰ��� �ϴ� ����
-- JOB_CODE�� J7�̰ų� J6�̸鼭 SALARY���� 200���� �̻��̰�
-- BONUS�� �ְ� �����̸� �̸��� �ּҴ� _�տ� 3���ڸ� �ִ� �����
-- EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS�� ��ȸ�Ϸ��Ѵ�.

-- ���� ������ �����Ű���� �ۼ��� SQL���� �Ʒ��� ����.
SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE
WHERE JOB_CODE = 'J7' OR JOB_CODE = 'J6' AND SALARY > 2000000
AND EMAIL LIKE '____%' AND BONUS IS NULL;

-- ���� SQL�� ����� ���ϴ� ����� ����� ��ȸ�� ���� �ʴ´�
-- �̶�, � ���������� �ִ��� ��� ã�Ƽ� �����Ͻÿ�
-- �׸��� ��ġ�� �Ϻ��� SQL���� �ۼ��� �� ��


-- ������
-- 1. OR �����ڿ� AND �����ڰ� �����Ǿ� ���� ��� AND ������ ������ ���� ���� ��
--    : �������� �䱸�� �������� OR ������ ���� ���� �Ǿ�� ��
-- 2. �޿� ���� ��� �񱳰� �� �� �Ǿ� ����, '>=' ���� ���ؾ� ��
-- 3. BONUS�� �ִ� ������ IS NULL �� �ƴ� IS NOT NULL�� ����ؾ� ��
-- 4. ���ڿ� ���� ������ �����Ǿ� ����
-- 5. EMAIL�� ���� �񱳽� �׹�° �ڸ��� �ִ� '_'�� ������ ������ ����ϱ� ���� 
--    �� ���ϵ� ī�� �� �̽��������� ���

-- ��������
SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS, EMAIL
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6') AND SALARY >= 2000000
AND EMAIL LIKE '___$_%' ESCAPE '$' AND BONUS IS NOT NULL 
AND SUBSTR(EMP_NO, 8,1) IN ('2', '4');



--------------------------------------------------------------------------------
-- QUIZ 3
-- [������������] CREATE USER ������ IDENTIFIED BY ��й�ȣ
-- ������ : SCOTT, ��й�ȣ : TIGER ������ �����ϰ� �ʹ�
-- �̶�, �Ϲݻ���� ������ KH ������ �����ؼ� CREATE USER SCOTT;
-- �� �����ϴ� ���� �߻�!!!

-- ������ 1. �����ڰ��������� ���� ���� �� ����
-- ������ 2. SQL���� �� �� �Ǿ� ����, ������� �Է�

-- ��ġ���� 1. �����ڰ����� ����
-- ��ġ���� 2. CREATE USER SCOTT IDENTIFIED BY TIGER;

-- CREATE �� �׽�Ʈ ���� = SCOTT�� ������ ���� �ʾұ� ����

-- ������ 1. ����� ���� ���� ��, �ּ����� ���� �ο��� �� ��

-- ��ġ���� 1. GRANT CONNECT, RESOURCE TO SCOTT;