-- 특수 Query
-- CASE DECODE = SWITCH, IF
SELECT employee_id, first_name, phone_number,
    CASE SUBSTR(phone_number, 1, 3) 
        WHEN '515' THEN '서울'
        WHEN '590' THEN '부산'
        WHEN '659' THEN '광주'
        WHEN '603' THEN '대전'
        ELSE '기타'
    END AS "지역"    
FROM employees;

SELECT employee_id, first_name , phone_number,
        CASE 
            WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'   
            WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
            WHEN SUBSTR(phone_number, 1, 3) = '659' THEN '광주'
            WHEN SUBSTR(phone_number, 1, 3) = '603' THEN '대전'
            ELSE '기타'
        END AS "지역"
FROM employees;

-- DECODE
SELECT employee_id, first_name, phone_number,
        DECODE( SUBSTR(phone_number, 1, 3),
                '515', '서울',
                '590', '부산',
                '659', '광주',
                '603', '대전',
                '기타') as "지역"
FROM employees;


/*
    집합
    합집합 : UNION
    교집합 : INTERSECT
    차집합 : MINUS

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
-- 매니저가 아닌 사원
SELECT employee_id
FROM employees
MINUS
SELECT manager_id
FROM employees;

-- 차집합을 Join
SELECT e.first_name, d.department_id
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
    AND e.department_id IS NULL;
    
-- OVER() 함수
-- SELECT 절에서만 사용
-- GROUP BY 를 보강하기 위해서 나온 함수ㅇ
SELECT department_id , COUNT(*) -- 에러
FROM employees;

SELECT department_id , COUNT(*)
FROM employees
GROUP BY department_id;

SELECT department_id , COUNT(*)OVER() -- SELECT 절에서만 사용
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

-- COUNT(*)OVER() : 전체 행수를 반환
-- COUNT(*)OVER(PARTITION BY 컬럼) : 컬럼을 그룹으로 나누어 ROW의 수를 반환

-- 분석 함수
/*
    순위 함수
    RANK()               1 2 3 4 5 6
    DENSE_RANK()         1 2 3 3
    ROW_NUMBER()         1 2 3 4 5 6
    ROWNUM
    
    -- EMPLOYEES - > 월급 TOP10
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

-- 1. DATA 설정 (급여)
-- 2. ROWNUM 설정
-- 3. 범위를 설정

SELECT RNUM,employee_id, first_name, salary
FROM    (SELECT ROWNUM AS RNUM, employee_id, first_name, salary  --2    
    FROM(   SELECT employee_id, first_name, salary      -- 1
        FROM employees
        ORDER BY salary DESC)
    )  
WHERE RNUM > 10 and RNUM <= 20;


/*
SELECT 절 정리
    SELECT 컬럼, 표준함수, 그룹함수, SUB QUERY, OVER() PARTITION BY
    FROM 테이블, SUB QUERY
    [ WHERE ] 조건 IN AND ANY ALL LIKE < > <> <= >= != = SUB QUERY
    [ GROUP BY ] 컬럼
    [ HAVING ] 그룹핑의 조건
    [ ORDER BY ] 컬럼 ASC, DESC;
    [ START BY ] 계층형
    [ CONNECT BY ] 연결형 PRIOR(상향, 하향)
    
JOIN
    INNER
    FULL OUTER
    CROSS
    OUTER(LEFT, RIGHT)
    SELF
*/