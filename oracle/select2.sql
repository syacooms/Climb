-- WHERE 절 == if == 조건절
/*
    표현식
    비교 연산자 (> , < , >= , <= , = , != , <>)     // <> -> 다르다 == !=
    NULL, IS NULL, IS NOT NULL
    ( ), NOT, AND(&&), OR(||)
    
    Query
    
    SELECT
    FROM  
    WHERE 조건

*/

SELECT first_name, last_name, salary
FROM employees
WHERE first_name = 'Julia';     -- > 대소문자를 가림. Julia -> find julia -> x

-- 급여가 $9000 이상인 사원
SELECT first_name, salary
FROM employees
WHERE salary >= 9000;

-- 이름이 shanta 보다 큰 이름
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

-- 이름 John, 월급이 5000이상
SELECT first_name, salary
FROM employees
WHERE first_name = 'John'
    AND salary >= 5000;

-- 2007년 12월 31일 이후에 입사한 사원을 출력
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

-- BETWEEN 범위 연산자
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
WHERE first_name LIKE 'G_ra_d'; -- _한글자가 무엇이든지 허용

SELECT first_name
FROM employees
WHERE first_name LIKE 'K%y'; -- % 글자 수에 관계없이 모두 허용

SELECT first_name
FROM employees
WHERE first_name LIKE '%e%'; -- 맨앞에 있든 맨뒤에 있든 나온다. 검색할때 제일 많이 쓰임.
--WHERE first_name LIKE '%e'; -- 맨앞
--WHERE first_name LIKE 'e%'; -- 맨뒤

SELECT first_name, hire_date
FROM employees
WHERE hire_date > '05/12/31' AND hire_date < '06/02/01';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06/01%';

SELECT first_name, phone_number
FROM employees
WHERE phone_number LIKE '590%';