-- SUB Query
-- Query안의 Query
-- 한개의 행(row)에서 결과 값이 반환되는 Query

/*
    SELECT 단일 ROW 단일 COLUMN (산출되는 데이터가 한개, 컬럼도 한개)
    FROM   다중 ROW 다중 COLUMN
    WHERE  다중 ROW 다중 COLUMN
    
    
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

-- 부서번호가 20번, 급여가 6000이상인 사원
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

-- 급여의 합계, 인원수, 사원명, 월급
/*
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;
*/

SELECT e.employee_id, e.salary,
    e.job_id, j.job_id,
    j."급여합계", j."인원수"
FROM employees e, (SELECT job_id, SUM(salary) as "급여합계" , count(*) as "인원수"
                    from employees
                    GROUP by job_id) j
WHERE e.job_id = j.job_id;

--where
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--department_id = 90의 job_id만 산출
SELECT job_id, first_name, department_id
FROM employees
WHERE job_id IN(SELECT job_id
                FROM employees
                WHERE department_id = 90);
                
-- 부서별로 가장 급여를 적게 받는 사원과 같은 급여를 받는 사원
SELECT first_name, salary, department_id
FROM employees
WHERE salary IN ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);
                  
-- 부서별로 가장 급여를 적게 받는 사원과 급여
SELECT department_id, first_name, salary
FROM employees
WHERE (department_id, salary) in (select department_id, MIN(salary)
                                  from employees
                                  GROUP BY department_id)
ORDER BY department_id asc;