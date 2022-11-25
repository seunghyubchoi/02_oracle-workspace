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
--: JOB_CODE 'J6' �ȳ���, SALARY 200000 �̻� �ƴ�, ���ڵ� ����
--: EMAIL LIKE '____%'�� �̽������� ���ڰ� ����, BONUS�� NULL��

-- 1. ������ �켱������ ���� AND ������ ���� ���� ��
-- 2. BONUS�� ���� �����͸� ������ ����
-- 3. ���ڰ� �ƴ� �����Ͱ� ������ ����
-- 4. EMAIL ���ϵ�ī�� _�� Ż�� ����, ������ ���� �ߺ��Ǿ� �̻��� ��� ���
-- 5. ������ 2�鸸���� �ȵǴ� �ֵ� ��� / 2�鸸 �ʰ��� ���





-- ���� ����
--:
SELECT EMP_NAME, EMP_NO, JOB_CODE, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE
WHERE (JOB_CODE = 'J7' OR JOB_CODE = 'J6')
AND SALARY >= 2000000
AND EMAIL LIKE '___$_%' ESCAPE '$' 
AND BONUS IS NOT NULL 
AND SUBSTR(EMP_NO, 8, 1) IN '2';
