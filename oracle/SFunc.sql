-- Standard Function

-- DUAL Table : ���� ���̺� -> ��� Ȯ�ο� Table
SELECT 1 FROM DUAL;
SELECT 'A' FROM DUAL;
SELECT 23 * 45 FROM DUAL;


-- ���� �Լ�
-- CHR( N ) : ASCII ���� ���ڷ� ��ȯ
SELECT CHR(65) FROM DUAL;
SELECT CHR(97) FROM DUAL;

-- "�ȳ��ϼ���" + "�ǰ��ϼ���" = "�ȳ��ϼ���ǰ��ϼ���"
--           ||
SELECT '�� ������ ' || CHR(65) || '�Դϴ�' FROM DUAL;


-- LPAD(RPAD) : �������� ��ĭ(��������)���� ä���.
SELECT LPAD('BBB', 10) FROM DUAL;
SELECT RPAD('BBB', 10) FROM DUAL;
SELECT LPAD('BBB', 10, '-') FROM DUAL;
SELECT LPAD('BBB', 10, '0') FROM DUAL;


-- INSTR == indexOf('a')    defande 
SELECT INSTR('123ABC456DEF', 'A') FROM DUAL;                -- �ڹٶ� �޸� 0���� ���۾���. 1���� ����
SELECT INSTR('123ABC456DEFABC', 'A', 7) FROM DUAL;          -- 7��° ���Ŀ� A�� ã������
SELECT INSTR('123ABC456DEFABCABC', 'A', 7,  1) FROM DUAL;   -- '���峭' 7��° ���Ŀ� 1��° A�� ã�ƶ�.
SELECT INSTR('123ABC456DEFABCABC', 'A', 7,  2) FROM DUAL;   -- �ڿ��� ù��° A
SELECT INSTR('123ABC456DEF', 'Y') FROM DUAL;


-- REPLACE : ���� ġȯ
SELECT REPLACE ('AAAAABCD' , 'A') FROM DUAL;         -- Ư�����ڸ� �� ���ڷ� �ٲ��.
SELECT REPLACE ('AAAAABCD' , 'A' , 'a') FROM DUAL;   -- Ư�����ڸ� 'a'�� �ٲ��.
SELECT REPLACE ('AAAAABCD' , 'AA' , 'a') FROM DUAL;  -- ���� �κ��� ġȯ�ȴ�.

-- TRANSLATE : ���� ġȯ
SELECT TRANSLATE ('AAAAABCD' , 'A', 'a') FROM DUAL;
SELECT TRANSLATE ('AAAAABCD' , 'AA', 'a') FROM DUAL; -- '���ڿ�'�� �ƴ� '����'ġȯ �̱⶧���� 'A' �ѱ��ڸ� �ν�

-- ����

-- �ø�
SELECT CEIL(13.1) FROM DUAL;


-- ����
SELECT FLOOR(13.9) FROM DUAL;


-- ���� ������
SELECT MOD(3, 2) FROM DUAL; -- 3�� 2�� ���� ������

-- �¼�
SELECT POWER(3, 2) FROM DUAL; --3�� 2��

-- �ݿø�
SELECT ROUND(13.4) FROM DUAL;

-- ��ȣ + :1 0:0 -:-1
-- SIGN
SELECT SIGN(13.4) FROM DUAL;  -- EX : ȸ���� ���� ���� (����/����)
SELECT SIGN(0) FROM DUAL;
SELECT SIGN(-0.1) FROM DUAL;  -- ��ȣ�� �����Ѵٰ� �����ϱ�

-- ����
-- TRUNC
SELECT TRUNC(12.3456) FROM DUAL;
SELECT TRUNC(12.3456, 2) FROM DUAL; -- �Ҽ��� 2��° �ڸ�����
SELECT TRUNC(12.3456, -1) FROM DUAL;

-- ASCII <-> CHR
SELECT ASCII('A') FROM DUAL;


-- ��ȯ�Լ�
-- TO_CHAR 
-- DATE -> VARCHAR2
SELECT TO_CHAR(SYSDATE) -- ��¥ ���°� �ƴ� ���ڿ�
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD-HH-MI-SS')
FROM DUAL;

SELECT TO_CHAR(100000000, '$999,999,999,999')
FROM DUAL;
   
-- TO_DATE
-- VARCHAR2 -> DATE
SELECT TO_DATE('20200617')
FROM DUAL;

SELECT TO_DATE('20201225', 'YYYYMMDD')
FROM DUAL;

-- TO_NUMBER BARCHAR2 -> NUMBER parseInt()
SELECT TO_NUMBER('123') + 12
FROM DUAL;

-- LAST_DAY
SELECT LAST_DAY('20/02/01')
FROM DUAL;

SELECT LAST_DAY( TO_DATE('200201', 'YYMMDD')) -- ����
FROM DUAL;

-- SUBSTR           substring(1, 3) "ABCDE" -> BC
SELECT SUBSTR('ABCDE', 3, 2) -- 3��°���� 2���ڱ���
FROM DUAL; -- CD
