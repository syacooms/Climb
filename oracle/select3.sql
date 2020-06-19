-- ORDER BY : SORTING

/*
    SELECT *
    FROM TABLE
    ORDER BY sal ASC  -- 오름차순
    ORDER BY sal DESC -- 내림차순
    
    OREDER BY sal     -- 오름차순
    
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
ORDER BY comm NULLS FIRST;  -- NULL을 앞으로

SELECT ename, comm
FROM emp
ORDER BY comm NULLS LAST;   -- NULL을 뒤로


SELECT employee_id, job_id, salary
FROM employees
ORDER BY job_id ASC, salary DESC;

--months_between : 두 날짜 간의 월 수(월간격)
SELECT MONTHS_BETWEEN('2020-05-04', '2020-12-31')
FROM dual;


-- add_months : 특정 날짜 월에 정수를 더한 다음 해당 날짜를 반환
SELECT add_months('2020-06-19', 3)
FROM DUAL;

-- 날짜 정보에서 특정한 연도, 월, 일, 시, 분, 초
SELECT SYSDATE
FROM DUAL;

-- 년, 월, 일
SELECT EXTRACT(year from TO_DATE('200619','YYMMDD')) as 연도,
    EXTRACT(month from TO_DATE('200815','YYMMDD')) as 월,
    EXTRACT(day from SYSDATE) as 일
FROM dual;

-- 시, 분, 초
SELECT EXTRACT( HOUR   FROM CAST ( datetime AS TIMESTAMP ) ) AS Hours,
       EXTRACT( MINUTE FROM CAST ( datetime AS TIMESTAMP ) ) AS Minutes,
       EXTRACT( SECOND FROM CAST ( datetime AS TIMESTAMP ) ) AS Seconds
FROM (
    SELECT TO_DATE( '2020-06-19 09:42:01' , 'YYYY-MM-DD HH24:MI:SS') AS datetime FROM DUAL
);

-- 그룹으로 묶는 기능
SELECT DISTINCT job_id
FROM employees
ORDER BY job_id ASC;

-- GROUP BY
-- HAVING : 조건절
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY department_id ASC;

-- 통계
/*
    GROUP 함수
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

-- HAVING : 반드시 gGROUP BY와 같이 사용
SELECT job_id, SUM(SALARY)
FROM employees
GROUP BY job_id
HAVING SUM(SALARY) >= 100000;

-- 급여가 5000이상 받는 사원만으로 합계를 내서 업무(JOB_ID)로 그룹화하여
-- 급여의 합계가 20000을 초과하는 업무명을 구하라.
SELECT job_id, sum(SALARY)
FROM employees
WHERE SALARY > 5000
GROUP BY job_id
HAVING sum(salary) >= 20000;

