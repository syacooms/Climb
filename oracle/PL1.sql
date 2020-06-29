/*
    PL/SQL
    Procedural == 처리자 Extension
    
    SQL을 확장한 순차적 언어 -> Procedure, Function, Trigger
                              in out     in out
                              insert     select
                              delete
                              update
     제어문 : if, while, for
     
     + script
*/

/*
    Script 구조
    1. 선언부 : 변수, 상수, 초기화
    2. 실행부 : 실제로 처리할 Query 부분이나 제어문을 활용해서 처리하는 부분
    3. 예외처리부 : 각종 오류 처리
*/

SET SERVEROUTPUT ON     -- CONSOLE에 출력을 ON
BEGIN
    -- 실행부
    dbms_output.put_line('Hello PL');    
END;
/
SET SERVEROUTPUT OFF

DECLARE     -- 선언부
    message VARCHAR2(10);       -- String message
    
BEGIN       -- 실행부
    message := 'hello pl';       -- message = "hello pl"
    SYS.dbms_output.put_line('message = ' || message);
    
            -- 예외처리
END;
/

-- if
DECLARE
    counter INTEGER;
BEGIN
    counter := 1;
    counter := counter + 1; 
    
    IF counter IS NULL THEN     -- IF counter = 0 THEN    
        dbms_output.put_line('result: counter is null');
    ELSE 
        dbms_output.put_line('result: counter is not null');
    END IF;
END;
/

-- FOR
DECLARE
    counter INTEGER;
    i INTEGER;
BEGIN    
    FOR i IN 1..9 LOOP
        SYS.dbms_output.put_line('i = ' || i);
        counter := i * 2;
        SYS.dbms_output.put_line('2 * ' || i || ' = ' || counter);
    END LOOP;    
END;
/

-- loop
DECLARE
    v_count NUMBER := 0;
    v_total NUMBER := 0;    
BEGIN
    LOOP
        EXIT WHEN v_count = 10;
        
        v_count := v_count + 1;
        v_total := v_total + v_count;    
    END LOOP;
    
    SYS.dbms_output.put_line('v_total = ' || v_total);    
END;
/

-- while
DECLARE
    v_count NUMBER := 0;
BEGIN

    WHILE v_count < 10
    LOOP
        v_count := v_count + 1;
        SYS.dbms_output.put_line('v_count = '|| v_count);
    END LOOP;    
END;
/

-- GOTO

DECLARE
    v_name VARCHAR2(10) := 'LEE';
    v_case NUMBER := 0;
BEGIN
    CASE 
        WHEN MOD(v_case, 2) = 0 THEN
            GOTO test1;
        WHEN MOD(v_case, 2) = 1 THEN
            GOTO test2;
        ELSE
            GOTO err;
    END CASE;
    
<<test1>>
    SYS.dbms_output.put_line(v_name || ' is woman');
    GOTO sub_end;
<<test2>>
    SYS.dbms_output.put_line(v_name || ' is man');   
    GOTO sub_end;
<<err>>
    SYS.dbms_output.put_line('ERROR');     

<<sub_end>>
    SYS.dbms_output.put_line('Exit');     
    
END;
/

-- 예외처리부    1/0
DECLARE
    counter INTEGER;    
BEGIN
    counter := 1;
    counter := counter / 0;
    
EXCEPTION WHEN OTHERS THEN
    SYS.dbms_output.put_line('예외가 발생하였습니다');
END;
/

-- varray : Variable Array
DECLARE
    TYPE varray_test IS VARRAY(3) OF INTEGER;   -- int varray_test = new int[3];
    vArr varray_test;
    
BEGIN
    vArr := varray_test(11, 22, 33);
    -- vArr(0)
    SYS.dbms_output.put_line('vArr(1) = ' || vArr(1));
END;
/

ACCEPT p_deptno PROMPT '부서번호를 입력하시오(급여의 합)'



DECLARE
    v_salTotal NUMBER;
BEGIN
    SELECT SUM(salary) INTO v_salTotal
    FROM employees
    WHERE department_id = &p_deptno;
    
    SYS.dbms_output.put_line(&p_deptno || '번 부서 급여의 합은 '
        || TO_CHAR(v_salTotal, '$999,999,999') );
END;
/

-- 사원번호를 입력받고 그 사원의 급여에 1000을 더한 값으로 갱신(UPDATE)하라.
-- 사원번호와 갱신된 급여를 출력하라.
ACCEPT p_empno PROMPT '사원 번호를 입력하시오'

DECLARE
    -- v_sal NUMBER(8,2) : = 1000;
    v_sal EMPLOYEES.salary%TYPE := 1000;
    v_salTotal NUMBER;
    
BEGIN
    -- 확인용
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empno;
    
    SYS.dbms_output.put_line(&p_empno || '번 사원의 급여:' || v_salTotal);

    -- update
    UPDATE employees
    SET salary = salary + v_sal
    WHERE employee_id = &p_empno;
    
    COMMIT;
    
    -- 확인용
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empno;
    
    SYS.dbms_output.put_line(&p_empno || '번 사원의 갱신후 급여:' || v_salTotal);
END;
/

ROLLBACK;

























