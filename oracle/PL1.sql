/*
    PL/SQL
    Procedural == ó���� Extension
    
    SQL�� Ȯ���� ������ ��� -> Procedure, Function, Trigger
                              in out     in out
                              insert     select
                              delete
                              update
     ��� : if, while, for
     
     + script
*/

/*
    Script ����
    1. ����� : ����, ���, �ʱ�ȭ
    2. ����� : ������ ó���� Query �κ��̳� ����� Ȱ���ؼ� ó���ϴ� �κ�
    3. ����ó���� : ���� ���� ó��
*/

SET SERVEROUTPUT ON     -- CONSOLE�� ����� ON
BEGIN
    -- �����
    dbms_output.put_line('Hello PL');    
END;
/
SET SERVEROUTPUT OFF

DECLARE     -- �����
    message VARCHAR2(10);       -- String message
    
BEGIN       -- �����
    message := 'hello pl';       -- message = "hello pl"
    SYS.dbms_output.put_line('message = ' || message);
    
            -- ����ó��
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

-- ����ó����    1/0
DECLARE
    counter INTEGER;    
BEGIN
    counter := 1;
    counter := counter / 0;
    
EXCEPTION WHEN OTHERS THEN
    SYS.dbms_output.put_line('���ܰ� �߻��Ͽ����ϴ�');
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

ACCEPT p_deptno PROMPT '�μ���ȣ�� �Է��Ͻÿ�(�޿��� ��)'



DECLARE
    v_salTotal NUMBER;
BEGIN
    SELECT SUM(salary) INTO v_salTotal
    FROM employees
    WHERE department_id = &p_deptno;
    
    SYS.dbms_output.put_line(&p_deptno || '�� �μ� �޿��� ���� '
        || TO_CHAR(v_salTotal, '$999,999,999') );
END;
/

-- �����ȣ�� �Է¹ް� �� ����� �޿��� 1000�� ���� ������ ����(UPDATE)�϶�.
-- �����ȣ�� ���ŵ� �޿��� ����϶�.
ACCEPT p_empno PROMPT '��� ��ȣ�� �Է��Ͻÿ�'

DECLARE
    -- v_sal NUMBER(8,2) : = 1000;
    v_sal EMPLOYEES.salary%TYPE := 1000;
    v_salTotal NUMBER;
    
BEGIN
    -- Ȯ�ο�
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empno;
    
    SYS.dbms_output.put_line(&p_empno || '�� ����� �޿�:' || v_salTotal);

    -- update
    UPDATE employees
    SET salary = salary + v_sal
    WHERE employee_id = &p_empno;
    
    COMMIT;
    
    -- Ȯ�ο�
    SELECT salary INTO v_salTotal
    FROM employees
    WHERE employee_id = &p_empno;
    
    SYS.dbms_output.put_line(&p_empno || '�� ����� ������ �޿�:' || v_salTotal);
END;
/

ROLLBACK;

























