
-- ���̺� �߰�
CREATE TABLESPACE TABLESPACE2
DATAFILE 'C:\TEST\TEST_TBS1_02.DBF' SIZE 10M
AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED -- �߰��Ǵ� �뷮
LOGGING                                 -- �α��� ���
EXTENT MANAGEMENT LOCAL AUTOALLOCATE    -- ����
BLOCKSIZE 8K                            -- BLOCK ũ�� 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;  

-- TABLE SPACE ����
-- �����̽����� ����
ALTER TABLESPACE TABLESPACE2
RENAME TO TB_TEST_NEW;

-- ������ ������ �뷮�� ����
ALTER DATABASE
DATAFILE 'C:\TEST\TEST_TBS1_02.DBF' RESIZE 7M;

--���̺� �����̽� ����
DROP TABLESPACE TB_TEST_NEW
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- TABLESPACE�� �����ؼ� ����
-- TABLE CREATE
CREATE TABLE TB_TEST01(
    COL_01 VARCHAR2(10),
    COL_02 VARCHAR2(10),
    COL_03 VARCHAR2(10),
    COL_04 VARCHAR2(10)
);

-- TABLE CREATE
CREATE TABLE TB_TEST02(
    COL_01 VARCHAR2(10),
    COL_02 VARCHAR2(10),
    COL_03 VARCHAR2(10),
    COL_04 VARCHAR2(10)
);


-- TABLE COPY : �����͸� ����
DROP TABLE TB_TEST03;

CREATE TABLE TB_TEST03
AS
SELECT employee_id, salary, first_name
FROM employees;

-- TABLE COPY : ������ ������ (���������ʴ� ������ ��)
CREATE TABLE TB_TEST04
AS
SELECT *
FROM departments
WHERE 1 = 2;

DROP TABLE DEPT_INFO;

CREATE TABLE DEPT_INFO (EMPNO, SAL, DNAME, LOC)
AS
SELECT e.employee_id, e.salary, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;


/*
    Object - create, drop,  select, alter
    
    Data - insert, delete , select, update
*/
-- ���̺� ���� : ���̺�� ����
ALTER TABLE TB_TEST04
RENAME
TO
TB_TEST99;

-- ���̺� ���� : ���� �÷� �߰�
ALTER TABLE TB_TEST99
ADD
COL_NEW1 VARCHAR2(30);

-- ���� �÷� �߰�
ALTER TABLE TB_TEST99
ADD
(COL_NEW2 NUMBER, COL_NEW3 DATE);

-- ���� �÷� ����
ALTER TABLE TB_TEST99
MODIFY
COL_NEW1 VARCHAR2(20);

-- ���� �÷� ����
ALTER TABLE TB_TEST99
MODIFY
(COL_NEW1 VARCHAR2(20), COL_NEW3 VARCHAR2(10));

-- ���� : ���� �÷� ����
ALTER TABLE TB_TEST99
DROP
COLUMN COL_NEW;

-- ���� : ���� �÷� ����
ALTER TABLE TB_TEST99
DROP
(COL_NEW2, COL_NEW3);

-- �÷� �� ���� 
ALTER TABLE TB_TEST99
RENAME 
COLUMN 
DEPARTMENT_ID TO DEPTNO;

-- ���̺� ����
DROP TABLE TB_TEST01;
DROP TABLE TB_TEST02;
DROP TABLE TB_TEST03;

-- ������ ����
PURGE RECYCLEBIN;

-- DATA INSERT
INSERT INTO TB_TEST99(DEPTNO, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES(100, '��ȹ��', 20, 200);

INSERT INTO TB_TEST99(DEPTNO, DEPARTMENT_NAME)
VALUES(101, '������' );

INSERT INTO TB_TEST99
VALUES(102, '������', 45, 320);

INSERT INTO TB_TEST99(DEPTNO, MANAGER_ID, LOCATION_ID , DEPARTMENT_NAME)   --���� ����� �ƴϴ�.
VALUES('103', '65', '220', '�λ��');

SELECT * FROM tb_test99;

-- DATA DELETE
DELETE FROM tb_test99
WHERE department_name = '�λ��';

DELETE FROM tb_test99
WHERE manager_id IS NULL;

-- DATA UPDATE
UPDATE tb_test99
SET manager_id = 70
WHERE department_name = '������';

UPDATE tb_test99
SET manager_id = 30, location_id = 150
WHERE deptno = 100;
