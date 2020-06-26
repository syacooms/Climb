/*
    sequence : ������ ���� ������ �ִ� Oracle Object
    
                baseball +1         1001 -> 1002 -> 1003
                ȸ����ȣ, �Խ��� ������ȣ
                �ʱ�ȭ�� �Ұ���. ���� �� �ٽ� ����.
    int count = 1;
    count++;
*/
-- sequence ����
CREATE SEQUENCE TEST_SEQ
INCREMENT BY 1          -- 1�� ���� ++
START WITH 10           -- ���� ����
MAXVALUE 100
MINVALUE 1;

-- CURRVAL -- ������ SEQ ��
SELECT TEST_SEQ.CURRVAL
FROM DUAL;

-- NEXSTVAL -- ���� �� ++1
SELECT TEST_SEQ.NEXTVAL
FROM DUAL;

--SEQUENCE ����
ALTER SEQUENCE TEST_SEQ
INCREMENT BY 3;

-- �ʱ�ȭ �Ұ�
DROP SEQUENCE TEST_SEQ;

INSERT INTO employees(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES(EMPLOYEES_SEQ.nextval, 'ȫ', 'HGD@NAVER.COM', '91/10/12', 'IT_PROG');

SELECT
    *
FROM employees;

-- ���Ǿ� (SYNONYM / ��ü�� ����)
/*
    Iint array[];
    int alias[] = array;
*/

CREATE SYNONYM "�����"
FOR EMPLOYEES;

INSERT INTO "�����"(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
VALUES (EMPLOYEES_SEQ.nextval, '��' , 'IJM@DAUM.NET', SYSDATE, 'ST_MAN');

SELECT * FROM employees;