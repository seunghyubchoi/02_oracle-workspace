--KH_��������
--1. 70��� ��(1970~1979) �� �����̸鼭 ������ ����� �̸��� �ֹι�ȣ, �μ� ��, ���� ��ȸ
SELECT EMP_NAME, EMP_NO, DEPT_TITLE,  JOB_NAME
FROM EMPLOYEE E, JOB J, DEPARTMENT D
WHERE  E.JOB_CODE = J.JOB_CODE AND DEPT_ID = DEPT_CODE
AND EMP_NAME LIKE '��%'
AND SUBSTR(EMP_NO, 8,1) = 2
AND SUBSTR(EMP_NO, 1,2) BETWEEN 70 AND 79;

--2. ���� �� ���� ������ ��� �ڵ�, ��� ��, ����, �μ� ��, ���� �� ��ȸ
SELECT EMP_ID, EMP_NAME,
EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6))) ����,
DEPT_TITLE,
JOB_NAME
FROM EMPLOYEE E, DEPARTMENT, JOB J
WHERE DEPT_ID = DEPT_CODE AND J.JOB_CODE = E.JOB_CODE
AND EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6))) 
= (SELECT MIN(EXTRACT(YEAR FROM (SYSDATE)) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6)))) FROM EMPLOYEE
);

--3. �̸��� �������� ���� ����� ��� �ڵ�, ��� ��, ���� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE
AND EMP_NAME LIKE '%��%';

--4. �μ��ڵ尡 D5�̰ų� D6�� ����� ��� ��, ���� ��, �μ� �ڵ�, �μ� �� ��ȸ
SELECT EMP_NAME, JOB_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE E, JOB J, DEPARTMENT D
WHERE E.JOB_CODE = J.JOB_CODE
AND DEPT_ID = DEPT_CODE
AND E.DEPT_CODE = 'D5' OR E.DEPT_CODE = 'D6';

--5. ���ʽ��� �޴� ����� ��� ��, �μ� ��, ���� �� ��ȸ
--6. ��� ��, ���� ��, �μ� ��, ���� �� ��ȸ
--7. �ѱ��̳� �Ϻ����� �ٹ� ���� ����� ��� ��, �μ� ��, ���� ��, ���� �� ��ȸ
--8. �� ����� ���� �μ����� ���ϴ� ����� �̸� ��ȸ
--9. ���ʽ��� ���� ���� �ڵ尡 J4�̰ų� J7�� ����� �̸�, ���� ��, �޿� ��ȸ(NVL �̿�)
--10. ���ʽ� ������ ������ ���� 5���� ���, �̸�, �μ� ��, ����, �Ի���, ���� ��ȸ
--11. �μ� �� �޿� �հ谡 ��ü �޿� �� ���� 20%���� ���� �μ��� �μ� ��, �μ� �� �޿� �հ� ��ȸ
--11-1. JOIN�� HAVING ���
--11-2. �ζ��� �� ���
--12. �μ� ��� �μ� �� �޿� �հ� ��ȸ