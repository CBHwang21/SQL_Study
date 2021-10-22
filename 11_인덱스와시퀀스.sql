-- 인덱스

-- 인덱스 조회하기
SELECT *
FROM ALL_IND_COLUMNS
WHERE table_name = 'members';

-- 새 테이블 만들기
DROP TABLE MEMBERS;
CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    first_name  VARCHAR2(100),
    last_name VARCHAR2(100),
    gender VARCHAR2(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL
);
SELECT * FROM members ORDER BY member_id;

-- 일반 열을 검색하기(이름이 하스인 사람)
SELECT * FROM members WHERE last_name = 'Harse';

-- 아래의 쿼리문의 실행보고서를 작성한다.
EXPLAIN PLAN FOR
SELECT * FROM members WHERE last_name = 'Harse';

-- 저장된 실행보고서를 읽기
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

-- 인덱스 만들기
CREATE INDEX members_last_name_i ON members(last_name);

-- 인덱스 삭제하기
DROP INDEX members_last_name_i;

-- 멀티 인덱스 만들기
CREATE INDEX members_name_i ON members(first_name, last_name);

SELECT * FROM members WHERE last_name LIKE 'A%' and first_name like 'M5';

EXPLAIN PLAN FOR
SELECT * FROM members WHERE last_name LIKE 'A%' and first_name like 'M5';

SELECT * FROM table(DBMS_XPLAN.DISPLAY());