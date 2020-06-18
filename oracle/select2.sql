-- WHERE �� == if == ������
/*
    ǥ����
    �� ������ (> , < , >= , <= , = , != , <>)     // <> -> �ٸ��� == !=
    NULL, IS NULL, IS NOT NULL
    ( ), NOT, AND(&&), OR(||)
    
    Query
    
    SELECT
    FROM  
    WHERE ����

*/

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Julia';     -- > ��ҹ��ڸ� ����. Julia -> find julia -> x

-- �޿��� $9000 �̻��� ���
SELECT first_name, salary
FROM employees
WHERE salary >= 9000;

-- �̸��� shanta ���� ū �̸�
SELECT first_name
FROM employees
WHERE first_name >= 'Shanta';

SELECT first_name
FROM employees
WHERE first_name >= 'A';

SELECT first_name, last_name
FROM employees
WHERE manager_id = ''; -- X   NULL != ''

SELECT first_name, last_name
FROM employees
WHERE manager_id IS NULL;  --steven king select

SELECT first_name, last_name
FROM employees
WHERE manager_id IS NOT NULL; --king other select

--AND
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Shanta'
    AND last_name = 'Vollman';

-- �̸� John, ������ 5000�̻�
SELECT first_name, salary
FROM employees
WHERE first_name = 'John'
    AND salary >= 5000;

-- 2007�� 12�� 31�� ���Ŀ� �Ի��� ����� ���
SELECT first_name, hire_date
FROM employees
WHERE hire_date > '07/12/31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231','YYYYMMDD');

-- ALL(AND) , ANY(OR)
SELECT
    *
FROM employees
WHERE first_name = ALL('Julia', 'John'); 
--WHERE first_name = 'Shanta' AND first_name = 'John'

SELECT
    *
FROM employees
WHERE first_name = ANY('Julia', 'John');
-- WHERE first_name = 'Shanta' OR first_name = 'John';

SELECT first_name, salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);

-- IN, NOT IN
SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200);

SELECT first_name, salary
FROM employees
WHERE salary NOT IN(8000, 3200);

SELECT first_name
FROM employees
WHERE first_name IN('Julia', 'John');

-- BETWEEN ���� ������
-- salary >= 3200 AND salary <== 9000
-- salary BETWEEN 3200 AND 9000


SELECT first_name, salary
FROM employees
--WHERE salary >= 3200 AND salary <= 9000;
WHERE salary BETWEEN 3200 AND 9000;

SELECT first_name, salary
FROM employees
--WHERE salary < 3200 OR salary > 9000;
WHERE salary NOT BETWEEN 3200 AND 9000;

-- LIKE
SELECT first_name
FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _�ѱ��ڰ� �����̵��� ���

SELECT first_name
FROM employees
WHERE first_name LIKE 'K%y'; -- % ���� ���� ������� ��� ���

SELECT first_name
FROM employees
WHERE first_name LIKE '%e%'; -- �Ǿտ� �ֵ� �ǵڿ� �ֵ� ���´�. �˻��Ҷ� ���� ���� ����.
--WHERE first_name LIKE '%e'; -- �Ǿ�
--WHERE first_name LIKE 'e%'; -- �ǵ�

SELECT first_name, hire_date
FROM employees
WHERE hire_date > '05/12/31' AND hire_date < '06/02/01';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%';

SELECT first_name, phone_number
FROM employees
WHERE phone_number LIKE '590%';