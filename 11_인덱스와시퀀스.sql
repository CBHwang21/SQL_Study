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

-- 시퀀스
create sequence 시퀀스1;   -- 생성
drop sequence 시퀀스1; -- 삭제

SELECT * FROM user_sequences WHERE sequence_name = '시퀀스1';
-- 시퀀스 테스트(이름.NEXTVAL => 증가하느 ㄴ값이 리턴)
SELECT 시퀀스1.NEXTVAL FROM DUAL;

CREATE TABLE 부서_테스트 (
    부서번호 NUMBER PRIMARY KEY,
    부서이름 VARCHAR2(100)
);

INSERT INTO 부서_테스트 (부서번호, 부서이름) VALUES (시퀀스1.NEXTVAL, '영업부');
INSERT INTO 부서_테스트 (부서번호, 부서이름) VALUES (시퀀스1.NEXTVAL, '개발부');

SELECT * FROM "부서_테스트";

-- 시퀀스의 값은 증가시키지 않고 현재 값을 알고 싶을때 (이름.CURRVAL)
SELECT 시퀀스1.CURRVAL FROM DUAL;

-- 시퀀스 옵션 시작값 10부터 증가는 20
CREATE SEQUENCE 시퀀스2
START WITH 10
INCREMENT BY 20;

-- 시퀀스 확인
SELECT * FROM USER_SEQUENCES WHERE sequence_name = '시퀀스2';

-- 입력
INSERT INTO 부서_테스트 (부서번호, 부서이름) VALUES (시퀀스2.NEXTVAL, '마케팅부');
INSERT INTO 부서_테스트 (부서번호, 부서이름) VALUES (시퀀스2.NEXTVAL, '교육부');
INSERT INTO 부서_테스트 (부서번호, 부서이름) VALUES (시퀀스2.NEXTVAL, '경영부');
SELECT * FROM "부서_테스트" ORDER BY 부서번호;

-- 시퀀스로 전체 번호를 업데이트
UPDATE 부서_테스트 SET 부서번호=시퀀스2.NEXTVAL;

-- 시퀀스2의 증가값을 2로 수정해보자(시작값은 수정불가)
ALTER SEQUENCE 시퀀스2
INCREMENT BY 2;
