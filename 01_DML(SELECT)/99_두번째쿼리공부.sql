-- QUIZ 1
-- ROWNUM�� Ȱ���ؼ� �޿��� ���� ���� 5���� ��ȸ�ϰ� �;����� ����� ��ȸ�� �ȵ�
-- �� �� �ۼ��� SQL���� :
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;

-- ������
-- ������ �Ǳ� ���� 5������ �߷����� ROWNUM�� ������ ���׹�����


-- �ذ�� SQL
-- �ζ��κ並 ���
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;


SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT * FROM EMPLOYEE ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;



-- QUIZ 2
-- �μ��� ��ձ޿��� 270������ �ʰ��ϴ� �μ��鿡 ����
-- �μ��ڵ�, �μ��� �� �޿� ��, �μ��� ��� �޿�, �μ��� ��� ��
-- �̶� �ۼ��� SQL���� �Ʒ��� ����
SELECT DEPT_CODE, SUM(SALARY) ����, FLOOR(AVG(SALARY)) ���, COUNT(*) �ο���
FROM EMPLOYEE
HAVING AVG(SALARY) > 2700000
GROUP BY DEPT_CODE
ORDER BY 1;

-- ������
-- �μ��� �ο����� �ٸ��� ���
-- AVG(SALARY) �ٸ�
-- SUM(SALARY) �ٸ�

-- �ذ�� SQL

SELECT DEPT_CODE, ����, FLOOR(��ձ޿�), �ο���
FROM (SELECT DEPT_CODE, SUM(SALARY) ���� ,AVG(SALARY) AS "��ձ޿�",COUNT(*) �ο��� 
FROM EMPLOYEE 
GROUP BY DEPT_CODE
ORDER BY 1)
WHERE ��ձ޿� > 2700000;

-----�����Բ�
SELECT DEPT_CODE, ����, FLOOR(��ձ޿�), �ο���
FROM (SELECT DEPT_CODE,SUM(SALARY) ���� ,AVG(SALARY) AS "��ձ޿�",COUNT(*) �ο��� 
FROM EMPLOYEE 
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 2700000
ORDER BY 1);

