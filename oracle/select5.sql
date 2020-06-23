-- SUB Query
-- Query���� Query
-- �Ѱ��� ��(row)���� ��� ���� ��ȯ�Ǵ� Query

/*
    SELECT ���� ROW ���� COLUMN (����Ǵ� �����Ͱ� �Ѱ�, �÷��� �Ѱ�)
    FROM   ���� ROW ���� COLUMN
    WHERE  ���� ROW ���� COLUMN
    
    
*/

--SELECT
SELECT employee_id, first_name,
    (SELECT salary
    FROM employees
    WHERE employee_id = 100)
--    (SELECT COUNT(*) FROM employees)
FROM employees;

-- FROM
SELECT employee_id, first_name, last_name
FROM (SELECT employee_id, first_name, last_name 
        FROM employees
        where department_id = 20);

-- �μ���ȣ�� 20��, �޿��� 6000�̻��� ���
SELECT
    *
FROM employees
WHERE department_id = 50
    AND salary >= 6000;
    
SELECT e.employee_id , e.salary
FROM ( SELECT EMPLOYEE_id, salary
        FROM employees
        WHERE department_id = 50) e
WHERE salary >= 6000;

-- �޿��� �հ�, �ο���, �����, ����
/*
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;
*/

SELECT e.employee_id, e.salary,
    e.job_id, j.job_id,
    j."�޿��հ�", j."�ο���"
FROM employees e, (SELECT job_id, SUM(salary) as "�޿��հ�" , count(*) as "�ο���"
                    from employees
                    GROUP by job_id) j
WHERE e.job_id = j.job_id;

--where
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--department_id = 90�� job_id�� ����
SELECT job_id, first_name, department_id
FROM employees
WHERE job_id IN(SELECT job_id
                FROM employees
                WHERE department_id = 90);
                
-- �μ����� ���� �޿��� ���� �޴� ����� ���� �޿��� �޴� ���
SELECT first_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);
                  
-- �μ����� ���� �޿��� ���� �޴� ����� �޿�
SELECT department_id, first_name, salary
FROM employees
WHERE (department_id, salary) in (select department_id, MIN(salary)
                                  from employees
                                  GROUP BY department_id)
ORDER BY department_id asc;