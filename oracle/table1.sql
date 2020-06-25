/*
    무결성 : column에 적용.
            COLUMN을 지정하는 성질. 설정
            
    Primary Key : 기본키. NULL을 허용하지 않는다. 중복을 허용하지 않는다. 
    Unique Key  : 고유키. NULL을 허용한다. 중복을 허용하지 않는다. E-mail
    Foreign Key : 외래키. 테이블과 테이블을 연결하는 목적의 성질이다.
                  Join의 목적이다.
                  NULL을 허용.
                  외래키로 설정된 컬럼은 연결된 테이블에서 PK나 UK로 설정되어 있어야 한다.
    CHECK       : 범위를 설정.
    NOT NULL    : NULL을 허용하지 않는다.
    
    
*/

-- NOT NULL
CREATE TABLE TB_TEST(
    COL_01 VARCHAR2(10) NOT NULL,   --Primary Key
    COL_02 VARCHAR2(20)
);

INSERT INTO tb_test(COL_01, COL_02)
VALUES('AAA', '111');

SELECT * FROM tb_test;

INSERT INTO tb_test(COL_01, COL_02)
VALUES('BBB', '');

INSERT INTO tb_test(COL_01)
VALUES('CCC');

-- Primary Key = Unique + NOT NULL
-- 식별자, 한 테이블에서 최대 32개 컬럼까지 지정할 수 있다.
-- CONSTRAINT : 무결성
CREATE TABLE TEST_01(
    PKCOL VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,   -- PK_TEST_01 <- id
    COL1 VARCHAR2(20),
    COL2 VARCHAR2(30)
);

DROP TABLE TEST_01
CASCADE CONSTRAINTS;

INSERT INTO test_01(PKCOL, COL1, COL2)
VALUES('AAA', 'aaa', '111');

INSERT INTO test_01(PKCOL, COL1, COL2)
VALUES('BBB', 'aaa', '111');

SELECT * FROM test_01;

INSERT INTO test_01(PKCOL)
VALUES('CCC');

INSERT INTO test_01(PKCOL, COL1, COL2)
VALUES('', 'bbb', '111');       -- Primary Key 이므로 NULL값 허용 하지 않음. ERROR

-- 02260. 00000 -  "table can have only one primary key"
CREATE TABLE TEST_01(
    PKCOL VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,  
    COL1 VARCHAR2(20) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    COL2 VARCHAR2(30)
);

-- 다음과 같이 한다.
CREATE TABLE TEST_01(
    PKCOL VARCHAR2(10),  
    COL1 VARCHAR2(20), 
    COL2 VARCHAR2(30),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(PKCOL, COL1)
);

DROP TABLE TEST_01
CASCADE CONSTRAINTS;

INSERT INTO test_01(PKCOL, COL1, COL2)
VALUES('AAA', 'aaa', '111');

ALTER TABLE TEST_01
ADD
CONSTRAINT PK_TEST_01
PRIMARY KEY (PKCOL, COL1);

ALTER TABLE TEST_01
DROP CONSTRAINT PK_TEST_01;

-- UNIQUE : 고유키. 중복된 갑승ㄴ 입력불가. NULL은 허용
CREATE TABLE TEST_02(
    UKCOL VARCHAR2(10) CONSTRAINT UK_TEST_02 UNIQUE,
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(20)
);

INSERT INTO TEST_02(UKCOL, COL_01, COL_02)
VALUES('AAA', 'aaa', '111');

INSERT INTO TEST_02(UKCOL, COL_01, COL_02)
VALUES('', 'aaa', '111');   -- NULL

INSERT INTO TEST_02(COL_01, COL_02)
VALUES('aaa', '111');   -- NULL

ALTER TABLE TEST_02
DROP CONSTRAINT UK_TEST_02; 

-- FOREIGN KEY : 외래키
-- 테이블과 테이블을 연결하기 위한 무결성 제약조건이다.
-- 다른 테이블에서는(부모)//연관관계에서는 PK,UK로 컬럼이 설정되어 있어야 한다.
-- NULL 허용


CREATE TABLE TB_PARENT(
    PKCOL01 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TB_PARENT PRIMARY KEY(PKCOL01)
    
);

CREATE TABLE TB_CHILD(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    FKCOL01 VARCHAR2(10),            --외래키 잡을때는 용량이 같을 것
    CONSTRAINT FK_TB_CHILD FOREIGN KEY(FKCOL01)
    REFERENCES TB_PARENT(PKCOL01)
);

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('AAA' , 'aaa' , '가가가');  -- PKCOL01은 PRIMARY KEY NULL 중복 X

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('BBB' , 'bbb' , '나나나');  -- PKCOL01은 PRIMARY KEY NULL 중복 X

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('CCC' , 'ccc' , '다다다');  -- PKCOL01은 PRIMARY KEY NULL 중복 X

INSERT INTO TB_CHILD(KEY_01, KEY_02, FKCOL01)
VALUES('123' , '가나다' , 'BBB');    --FKCOL01은 외래키이므로 PKC0L01과 같은값을 넣거나 NULL 값을 입력 

INSERT INTO TB_CHILD(KEY_01, KEY_02, FKCOL01)
VALUES('234' , '나다라' , '');     -- FKCOL01은 외래키 : NULL값 입력

SELECT * FROM TB_CHILD;

SELECT c.key_01, c.key_02,
    c.fkcol01, p.pkcol01,
    p.col_01, p.col_02
FROM tb_child c, tb_parent p
WHERE c.fkcol01 = p.pkcol01;

-- CHECK : 지정된 값만 입력할 수 있고 NULL을 허용
CREATE TABLE TB_CHECK(
    COL_01 VARCHAR2(10),
    KEY_01 VARCHAR2(10),
    CONSTRAINT CHK_TB_CHECK01 CHECK( COL_01 IN('사과' , '배' , '바나나')),
    CONSTRAINT CHK_TB_CHECK02 CHECK( KEY_01 > 0 AND KEY_01 <= 100)
);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('사과', 50);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('사과', 10);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('', 25);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('', '');

SELECT * FROM tb_check;


