/*
    ���Ἲ : column�� ����.
            COLUMN�� �����ϴ� ����. ����
            
    Primary Key : �⺻Ű. NULL�� ������� �ʴ´�. �ߺ��� ������� �ʴ´�. 
    Unique Key  : ����Ű. NULL�� ����Ѵ�. �ߺ��� ������� �ʴ´�. E-mail
    Foreign Key : �ܷ�Ű. ���̺�� ���̺��� �����ϴ� ������ �����̴�.
                  Join�� �����̴�.
                  NULL�� ���.
                  �ܷ�Ű�� ������ �÷��� ����� ���̺��� PK�� UK�� �����Ǿ� �־�� �Ѵ�.
    CHECK       : ������ ����.
    NOT NULL    : NULL�� ������� �ʴ´�.
    
    
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
-- �ĺ���, �� ���̺��� �ִ� 32�� �÷����� ������ �� �ִ�.
-- CONSTRAINT : ���Ἲ
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
VALUES('', 'bbb', '111');       -- Primary Key �̹Ƿ� NULL�� ��� ���� ����. ERROR

-- 02260. 00000 -  "table can have only one primary key"
CREATE TABLE TEST_01(
    PKCOL VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,  
    COL1 VARCHAR2(20) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    COL2 VARCHAR2(30)
);

-- ������ ���� �Ѵ�.
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

-- UNIQUE : ����Ű. �ߺ��� ���¤� �ԷºҰ�. NULL�� ���
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

-- FOREIGN KEY : �ܷ�Ű
-- ���̺�� ���̺��� �����ϱ� ���� ���Ἲ ���������̴�.
-- �ٸ� ���̺�����(�θ�)//�������迡���� PK,UK�� �÷��� �����Ǿ� �־�� �Ѵ�.
-- NULL ���


CREATE TABLE TB_PARENT(
    PKCOL01 VARCHAR2(10),
    COL_01 VARCHAR2(20),
    COL_02 VARCHAR2(30),
    CONSTRAINT PK_TB_PARENT PRIMARY KEY(PKCOL01)
    
);

CREATE TABLE TB_CHILD(
    KEY_01 VARCHAR2(10),
    KEY_02 VARCHAR2(10),
    FKCOL01 VARCHAR2(10),            --�ܷ�Ű �������� �뷮�� ���� ��
    CONSTRAINT FK_TB_CHILD FOREIGN KEY(FKCOL01)
    REFERENCES TB_PARENT(PKCOL01)
);

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('AAA' , 'aaa' , '������');  -- PKCOL01�� PRIMARY KEY NULL �ߺ� X

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('BBB' , 'bbb' , '������');  -- PKCOL01�� PRIMARY KEY NULL �ߺ� X

INSERT INTO TB_PARENT(PKCOL01, COL_01, COL_02)
VALUES('CCC' , 'ccc' , '�ٴٴ�');  -- PKCOL01�� PRIMARY KEY NULL �ߺ� X

INSERT INTO TB_CHILD(KEY_01, KEY_02, FKCOL01)
VALUES('123' , '������' , 'BBB');    --FKCOL01�� �ܷ�Ű�̹Ƿ� PKC0L01�� �������� �ְų� NULL ���� �Է� 

INSERT INTO TB_CHILD(KEY_01, KEY_02, FKCOL01)
VALUES('234' , '���ٶ�' , '');     -- FKCOL01�� �ܷ�Ű : NULL�� �Է�

SELECT * FROM TB_CHILD;

SELECT c.key_01, c.key_02,
    c.fkcol01, p.pkcol01,
    p.col_01, p.col_02
FROM tb_child c, tb_parent p
WHERE c.fkcol01 = p.pkcol01;

-- CHECK : ������ ���� �Է��� �� �ְ� NULL�� ���
CREATE TABLE TB_CHECK(
    COL_01 VARCHAR2(10),
    KEY_01 VARCHAR2(10),
    CONSTRAINT CHK_TB_CHECK01 CHECK( COL_01 IN('���' , '��' , '�ٳ���')),
    CONSTRAINT CHK_TB_CHECK02 CHECK( KEY_01 > 0 AND KEY_01 <= 100)
);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('���', 50);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('���', 10);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('', 25);

INSERT INTO TB_CHECK(COL_01, KEY_01)
VALUES('', '');

SELECT * FROM tb_check;


