-- Standard Function

-- DUAL Table : 가상 테이블 -> 결과 확인용 Table
SELECT 1 FROM DUAL;
SELECT 'A' FROM DUAL;
SELECT 23 * 45 FROM DUAL;


-- 문자 함수
-- CHR( N ) : ASCII 값을 문자로 변환
SELECT CHR(65) FROM DUAL;
SELECT CHR(97) FROM DUAL;

-- "안녕하세요" + "건강하세요" = "안녕하세요건강하세요"
--           ||
SELECT '내 점수는 ' || CHR(65) || '입니다' FROM DUAL;


-- LPAD(RPAD) : 나머지를 빈칸(지정문자)으로 채운다.
SELECT LPAD('BBB', 10) FROM DUAL;
SELECT RPAD('BBB', 10) FROM DUAL;
SELECT LPAD('BBB', 10, '-') FROM DUAL;
SELECT LPAD('BBB', 10, '0') FROM DUAL;


-- INSTR == indexOf('a')    defande 
SELECT INSTR('123ABC456DEF', 'A') FROM DUAL;                -- 자바랑 달리 0에서 시작안함. 1부터 시작
SELECT INSTR('123ABC456DEFABC', 'A', 7) FROM DUAL;          -- 7번째 이후에 A를 찾으세욧
SELECT INSTR('123ABC456DEFABCABC', 'A', 7,  1) FROM DUAL;   -- '말장난' 7번째 이후에 1번째 A를 찾아라.
SELECT INSTR('123ABC456DEFABCABC', 'A', 7,  2) FROM DUAL;   -- 뒤에서 첫번째 A
SELECT INSTR('123ABC456DEF', 'Y') FROM DUAL;


-- REPLACE : 문자 치환
SELECT REPLACE ('AAAAABCD' , 'A') FROM DUAL;         -- 특정문자를 빈 문자로 바꿔라.
SELECT REPLACE ('AAAAABCD' , 'A' , 'a') FROM DUAL;   -- 특정문자를 'a'로 바꿔라.
SELECT REPLACE ('AAAAABCD' , 'AA' , 'a') FROM DUAL;  -- 남는 부분이 치환된다.

-- TRANSLATE : 문자 치환
SELECT TRANSLATE ('AAAAABCD' , 'A', 'a') FROM DUAL;
SELECT TRANSLATE ('AAAAABCD' , 'AA', 'a') FROM DUAL; -- '문자열'이 아닌 '문자'치환 이기때문에 'A' 한글자만 인식

-- 숫자

-- 올림
SELECT CEIL(13.1) FROM DUAL;


-- 내림
SELECT FLOOR(13.9) FROM DUAL;


-- 나눈 나머지
SELECT MOD(3, 2) FROM DUAL; -- 3을 2로 나눈 나머지

-- 승수
SELECT POWER(3, 2) FROM DUAL; --3의 2승

-- 반올림
SELECT ROUND(13.4) FROM DUAL;

-- 부호 + :1 0:0 -:-1
-- SIGN
SELECT SIGN(13.4) FROM DUAL;  -- EX : 회사의 영업 이익 (흑자/적자)
SELECT SIGN(0) FROM DUAL;
SELECT SIGN(-0.1) FROM DUAL;  -- 부호만 리턴한다고 생각하기

-- 버림
-- TRUNC
SELECT TRUNC(12.3456) FROM DUAL;
SELECT TRUNC(12.3456, 2) FROM DUAL; -- 소수점 2번째 자리까지
SELECT TRUNC(12.3456, -1) FROM DUAL;

-- ASCII <-> CHR
SELECT ASCII('A') FROM DUAL;


-- 변환함수
-- TO_CHAR 
-- DATE -> VARCHAR2
SELECT TO_CHAR(SYSDATE) -- 날짜 형태가 아닌 문자열
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

SELECT LAST_DAY( TO_DATE('200201', 'YYMMDD')) -- 정석
FROM DUAL;

-- SUBSTR           substring(1, 3) "ABCDE" -> BC
SELECT SUBSTR('ABCDE', 3, 2) -- 3번째부터 2문자까지
FROM DUAL; -- CD
