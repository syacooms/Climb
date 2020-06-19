/*
    JOIN
    두개 이상의 테이블을 연결해서 데이터를 검색하는 방법이다.
    보통 두개이상의 행(row)들의 공통된 값 Primary Key(기본 키), Foreing key(외래 키)값을
    사용해서 조인한다.
    
    Primary Key(기본 키) : 테이블에서 중복되지 않는 키
    Foreing Key(외래 키) : 다른 테이블에서 PK, UK 인 경우가 많다.
    
    inner JOIN : 교집합    미슐랭 5성
    full outer JOIN -- 쓸일 없음.
    cross JOIN -- 쓸일 없음.
    outer 
            left        미슐랭 3성
            right       미슐랭 3성
    self JOIN : 같은 테이블의 데이터를 산출     미슐랭 5성
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
    
-- self join : 동일한 테이블을 JOIN
SELECT a.employee_id, a.first_name,
    a.manager_id, b.employee_id,
    b.first_name
FROM employees a, employees b   -- a : 사원 b : 상사
WHERE a.manager_id = b.employee_id;

-- 계층형 구조 오름, 내림
SELECT a.employee_id, a.first_name AS "사원",
    a.manager_id as "사원의 상사", b.employee_id,
    b.first_name as "상사"
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+)
-- CONNECT BY PRIOR a.manager_id = a.employee_id;  -- 상향식
CONNECT BY a.manager_id = PRIOR a.employee_id;  -- 하향식