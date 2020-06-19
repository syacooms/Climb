-- ORDER BY : SORTING

/*
    SELECT *
    FROM TABLE
    ORDER BY sal ASC  -- ��������
    ORDER BY sal DESC -- ��������
    
    OREDER BY sal     -- ��������
    
*/

SELECT ename, sal
FROM emp
ORDER BY sal ASC;

SELECT ename, sal
FROM emp
ORDER BY sal DESC;

-- alias
SELECT empno, ename, sal * 12 AS annsal
FROM emp
ORDER BY annsal DESC;

SELECT ename, comm
FROM emp
ORDER BY comm NULLS FIRST;  -- NULL�� ������

SELECT ename, comm
FROM emp
ORDER BY comm NULLS LAST;   -- NULL�� �ڷ�


SELECT employee_id, job_id, salary
FROM employees
ORDER BY job_id ASC, salary DESC;

--months_between : �� ��¥ ���� �� ��(������)
SELECT MONTHS_BETWEEN('2020-05-04', '2020-12-31')
FROM dual;


-- add_months : Ư�� ��¥ ���� ������ ���� ���� �ش� ��¥�� ��ȯ
SELECT add_months('2020-06-19', 3)
FROM DUAL;

-- ��¥ �������� Ư���� ����, ��, ��, ��, ��, ��
SELECT SYSDATE
FROM DUAL;

-- ��, ��, ��
SELECT EXTRACT(year from TO_DATE('200619','YYMMDD')) as ����,
    EXTRACT(month from TO_DATE('200815','YYMMDD')) as ��,
    EXTRACT(day from SYSDATE) as ��
FROM dual;

-- ��, ��, ��
SELECT EXTRACT( HOUR   FROM CAST ( datetime AS TIMESTAMP ) ) AS Hours,
       EXTRACT( MINUTE FROM CAST ( datetime AS TIMESTAMP ) ) AS Minutes,
       EXTRACT( SECOND FROM CAST ( datetime AS TIMESTAMP ) ) AS Seconds
FROM (
    SELECT TO_DATE( '2020-06-19 09:42:01' , 'YYYY-MM-DD HH24:MI:SS') AS datetime FROM DUAL
);

-- �׷����� ���� ���
SELECT DISTINCT job_id
FROM employees
ORDER BY job_id ASC;

-- GROUP BY
-- HAVING : ������
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

-- ���
/*
    GROUP �Լ�
    COUNT
    SUM
    AVG
    MAX
    MIN
    
*/

SELECT COUNT(salary), COUNT(*), SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE job_id = 'IT_PROG';

SELECT job_id, COUNT(salary), SUM(salary), AVG(salary)
FROM employees
GROUP BY job_id;

-- HAVING : �ݵ�� gGROUP BY�� ���� ���
SELECT job_id, SUM(SALARY)
FROM employees
GROUP BY job_id
HAVING SUM(SALARY) >= 100000;

-- �޿��� 5000�̻� �޴� ��������� �հ踦 ���� ����(JOB_ID)�� �׷�ȭ�Ͽ�
-- �޿��� �հ谡 20000�� �ʰ��ϴ� �������� ���϶�.
SELECT job_id, sum(SALARY)
FROM employees
WHERE SALARY > 5000
GROUP BY job_id
HAVING sum(salary) >= 20000;

