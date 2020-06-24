-- Ư�� Query
-- CASE DECODE = SWITCH, IF
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3) 
        WHEN '515' THEN '����'
        WHEN '590' THEN '�λ�'
        WHEN '659' THEN '����'
        WHEN '603' THEN '����'
        ELSE '��Ÿ'
    END AS "����"    
FROM employees;

SELECT employee_id, first_name , phone_number,
        CASE 
            WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '����'   
            WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '�λ�'
            WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '����'
            WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '����'
            ELSE '��Ÿ'
        END AS "����"
FROM employees;

-- DECODE
SELECT employee_id, first_name, phone_number,
        DECODE( SUBSTR(phone_number, 1, 3),
                '515', '����',
                '590', '�λ�',
                '659', '����',
                '603', '����',
                '��Ÿ') as "����"
FROM employees;


/*
    ����
    ������ : UNION
    ������ : INTERSECT
    ������ : MINUS

*/

-- UNION
SELECT job_id
FROM employees
WHERE job_id IN ('AD_VP', 'FI_ACCOUNT');
UNION ALL
SELECT job_id
FROM jobs
WHERE job_id IN ('AD_VP', 'FI_ACCOUNT');

-- INTERSECT
SELECT employee_id
FROM employees;
INTERSECT
SELECT manager_id
FROM employees;

-- JOIN self
SELECT DISTINCT b.employee_id
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- MINUS
-- �Ŵ����� �ƴ� ���
SELECT employee_id
FROM employees
MINUS
SELECT manager_id
FROM employees;

-- �������� Join
SELECT e.first_name, d.department_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND e.department_id IS NULL;
    
-- OVER() �Լ�
-- SELECT �������� ���
-- GROUP BY �� �����ϱ� ���ؼ� ���� �Լ���
SELECT department_id , COUNT(*) -- ����
FROM employees;

SELECT department_id , COUNT(*)
FROM employees
GROUP BY department_id;

SELECT department_id , COUNT(*)OVER() -- SELECT �������� ���
FROM employees
GROUP BY department_id;

SELECT department_id , COUNT(DISTINCT department_id)OVER()
FROM employees;

-- PARTITION BY == GROUP BY
SELECT department_name,
    COUNT(*)OVER(PARTITION BY department_id)
FROM departments;

SELECT department_id,
    COUNT(*)OVER(PARTITION BY department_id)
FROM employees;

-- COUNT(*)OVER() : ��ü ����� ��ȯ
-- COUNT(*)OVER(PARTITION BY �÷�) : �÷��� �׷����� ������ ROW�� ���� ��ȯ

-- �м� �Լ�
/*
    ���� �Լ�
    RANK()               1 2 3 4 5 6
    DENSE_RANK()         1 2 3 3
    ROW_NUMBER()         1 2 3 4 5 6
    ROWNUM
    
    -- EMPLOYEES - > ���� TOP10
*/

SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 100 and employee_id <= 109;

SELECT first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS RANK,
    DENSE_RANK()OVER(ORDER BY salary DESC) AS DENSE_RANK,
    ROW_NUMBER()OVER(ORDER BY salary DESC) AS ROW_NUMBER
FROM employees;

-- ROWNUM
SELECT ROWNUM, employee_id, first_name
FROM employees
WHERE ROWNUM <= 10;

-- 1. DATA ���� (�޿�)
-- 2. ROWNUM ����
-- 3. ������ ����

SELECT RNUM,employee_id, first_name, salary
FROM    (SELECT ROWNUM AS RNUM, employee_id, first_name, salary  --2    
    FROM(   SELECT employee_id, first_name, salary      -- 1
        FROM employees
        ORDER BY salary DESC)
    )  
WHERE RNUM > 10 and RNUM <= 20;


/*
SELECT �� ����
    SELECT �÷�, ǥ���Լ�, �׷��Լ�, SUB QUERY, OVER() PARTITION BY
    FROM ���̺�, SUB QUERY
    [ WHERE ] ���� IN AND ANY ALL LIKE < > <> <= >= != = SUB QUERY
    [ GROUP BY ] �÷�
    [ HAVING ] �׷����� ����
    [ ORDER BY ] �÷� ASC, DESC;
    [ START BY ] ������
    [ CONNECT BY ] ������ PRIOR(����, ����)
    
JOIN
    INNER
    FULL OUTER
    CROSS
    OUTER(LEFT, RIGHT)
    SELF
*/