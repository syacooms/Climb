/*
    JOIN
    �ΰ� �̻��� ���̺��� �����ؼ� �����͸� �˻��ϴ� ����̴�.
    ���� �ΰ��̻��� ��(row)���� ����� �� Primary Key(�⺻ Ű), Foreing key(�ܷ� Ű)����
    ����ؼ� �����Ѵ�.
    
    Primary Key(�⺻ Ű) : ���̺��� �ߺ����� �ʴ� Ű
    Foreing Key(�ܷ� Ű) : �ٸ� ���̺��� PK, UK �� ��찡 ����.
    
    inner JOIN : ������    �̽��� 5��
    full outer JOIN -- ���� ����.
    cross JOIN -- ���� ����.
    outer 
            left        �̽��� 3��
            right       �̽��� 3��
    self JOIN : ���� ���̺��� �����͸� ����     �̽��� 5��
*/

-- inner JOIN
-- Ansi SQL
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e INNER JOIN departments d
    ON e.department_id = d.department_id;

-- Oracle
SELECT employee_id, first_name,
    e.department_id , d.department_id,
    d.department_name , d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.first_name = 'Adam';
    
-- cross join
-- Ansi
SELECT employee_id, first_name,
    e.department_id , d.department_id,
    d.department_name , d.location_id
FROM employees e CROSS JOIN departments d;

-- oracle
SELECT employee_id, first_name,
    e.department_id , d.department_id,
    d.department_name , d.location_id
FROM employees e, departments d;

-- full outer join
SELECT e.employee_id, e.first_name,
    e.department_id , d.department_id,
    d.department_name , d.location_id
FROM employees e FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;

-- Outer JOIN
-- left, right
-- Ansi
SELECT e.employee_id, e.first_name,
    e.department_id, d.department_id,
    d.department_name
FROM employees e left OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
-- Oracle    
SELECT e.employee_id, e.first_name,
e.department_id, d.department_id,
d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
    
-- self join : ������ ���̺��� JOIN
SELECT a.employee_id, a.first_name,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b   -- a : ��� b : ���
WHERE a.manager_id = b.employee_id;

-- ������ ���� ����, ����
SELECT a.employee_id, a.first_name AS "���",
    a.manager_id as "����� ���", b.employee_id,
    b.first_name as "���"
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
-- CONNECT BY PRIOR a.manager_id = a.employee_id;  -- �����
CONNECT BY a.manager_id = PRIOR a.employee_id;  -- �����