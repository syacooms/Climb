
-- 테이블 추가
CREATE TABLESPACE TABLESPACE2
DATAFILE 'C:\TEST\TEST_TBS1_02.DBF' SIZE 10M
AUTOEXTEND ON NEXT 1M MAXSIZE UNLIMITED -- 추가되는 용량
LOGGING                                 -- 로깅을 사용
EXTENT MANAGEMENT LOCAL AUTOALLOCATE    -- 로컬
BLOCKSIZE 8K                            -- BLOCK 크기 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;  

-- TABLE SPACE 수정
-- 스페이스명을 수정
ALTER TABLESPACE TABLESPACE2
RENAME TO TB_TEST_NEW;

-- 데이터 파일의 용량을 수정
ALTER DATABASE
DATAFILE 'C:\TEST\TEST_TBS1_02.DBF' RESIZE 7M;

--테이블 스페이스 삭제
DROP TABLESPACE TB_TEST_NEW
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

-- TABLESPACE를 지정해서 생성
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


-- TABLE COPY : 데이터를 포함
DROP TABLE TB_TEST03;

CREATE TABLE TB_TEST03
AS
SELECT employee_id, salary, first_name
FROM employees;

-- TABLE COPY : 데이터 미포함 (성립되지않는 조건일 시)
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
-- 테이블 수정 : 테이블명 변경
ALTER TABLE TB_TEST04
RENAME
TO
TB_TEST99;

-- 테이블 수정 : 단일 컬럼 추가
ALTER TABLE TB_TEST99
ADD
COL_NEW1 VARCHAR2(30);

-- 다중 컬럼 추가
ALTER TABLE TB_TEST99
ADD
(COL_NEW2 NUMBER, COL_NEW3 DATE);

-- 단일 컬럼 수정
ALTER TABLE TB_TEST99
MODIFY
COL_NEW1 VARCHAR2(20);

-- 다중 컬럼 수정
ALTER TABLE TB_TEST99
MODIFY
(COL_NEW1 VARCHAR2(20), COL_NEW3 VARCHAR2(10));

-- 삭제 : 단일 컬럼 삭제
ALTER TABLE TB_TEST99
DROP
COLUMN COL_NEW;

-- 삭제 : 다중 컬럼 삭제
ALTER TABLE TB_TEST99
DROP
(COL_NEW2, COL_NEW3);

-- 컬럼 명 수정 
ALTER TABLE TB_TEST99
RENAME 
COLUMN 
DEPARTMENT_ID TO DEPTNO;

-- 테이블 삭제
DROP TABLE TB_TEST01;
DROP TABLE TB_TEST02;
DROP TABLE TB_TEST03;

-- 휴지통 비우기
PURGE RECYCLEBIN;

-- DATA INSERT
INSERT INTO TB_TEST99(DEPTNO, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES(100, '기획부', 20, 200);

INSERT INTO TB_TEST99(DEPTNO, DEPARTMENT_NAME)
VALUES(101, '관리부' );

INSERT INTO TB_TEST99
VALUES(102, '영업부', 45, 320);

INSERT INTO TB_TEST99(DEPTNO, MANAGER_ID, LOCATION_ID , DEPARTMENT_NAME)   --좋은 방법은 아니다.
VALUES('103', '65', '220', '인사부');

SELECT * FROM tb_test99;

-- DATA DELETE
DELETE FROM tb_test99
WHERE department_name = '인사부';

DELETE FROM tb_test99
WHERE manager_id IS NULL;

-- DATA UPDATE
UPDATE tb_test99
SET manager_id = 70
WHERE department_name = '영업부';

UPDATE tb_test99
SET manager_id = 30, location_id = 150
WHERE deptno = 100;
                                       
