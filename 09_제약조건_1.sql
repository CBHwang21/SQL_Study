-- 제약조건 pk fk 기본키 외래키 관계

-- 부서 테이블 만들기
DROP TABLE 부서;
CREATE TABLE 부서 (
    부서번호 NUMBER(4) PRIMARY KEY,
    부서이름 VARCHAR2(20)
);
INSERT INTO 부서 VALUES( 1, '개발');
--INSERT INTO 부서 VALUES( null, '회계'); 기본키 열은 중복 또는 null값 입력이 안된다.
SELECT * FROM 부서;

-- 외래키 (FK)
-- 외래키 문법 FOREIGN KEY(열이름) REFERENCES 참조테이블(참조열) [ON DELETE CASCADE | ON DELETE SET NULL](ON DELETE 문장은 생략가능)
DROP TABLE 직원;
CREATE TABLE 직원 (
    직원번호 NUMBER(4) PRIMARY KEY,
    이름    VARCHAR2(20),
    월급    NUMBER(10),
    부서번호 NUMBER(4),
    FOREIGN KEY(부서번호) REFERENCES 부서(부서번호) ON DELETE SET NULL 
);
-- 데이터 입력
INSERT INTO 부서 VALUES ( 1, '개발');
INSERT INTO 부서 VALUES ( 2, '경영');
INSERT INTO 부서 VALUES ( 3, '회계');
SELECT * FROM 부서;

INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES ( 100, '홍길동', 150, 1);
INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES ( 110, '펭수', 100, 1);
INSERT INTO 직원(직원번호, 이름, 월급, 부서번호) VALUES ( 120, '라이언', 200, NULL); -- 외래키는 null값 입력가능
SELECT * FROM 직원;

-- 삭제시 문제 발생
DELETE FROM 부서 WHERE 부서번호 = 1; -- 현재 참조하는 외래키 열이 있어서 삭제가 안됨

-- 제약조건을 추가하는법(1. 테이블 생성 2. 제약조건 추가)
CREATE TABLE 과목(
    과목번호    VARCHAR2(2),
    과목이름    VARCHAR2(50)
);
INSERT INTO 과목 VALUES ('01', '데이터베이스');
INSERT INTO 과목 VALUES ('02', '프로그래밍');
SELECT * FROM 과목;

CREATE TABLE 학생(
    학번  VARCHAR2(4),
    이름  VARCHAR2(50),
    과목번호 VARCHAR2(2)
);
INSERT INTO 학생 VALUES ('0414', '홍길동', '01');
INSERT INTO 학생 VALUES ('0415', '임꺽정', '02');
INSERT INTO 학생 VALUES ('0416', '이순신', '03');
SELECT * FROM 학생;

-- 1. 과목부터 제약조건 추가
ALTER TABLE 과목
ADD PRIMARY KEY (과목번호);

-- 제약조건을 조회(다른 테이블을 보려면 테이블 이름만 수정, 테이블 이름을 반드시 ''안에 넣는다.
SELECT * FROM ALL_CONSTRAINTS WHERE table_name = '학생';

-- 과목테이블 과목이름열에 유니크 제약조건 추가
ALTER TABLE 과목 ADD UNIQUE (과목이름);

-- 2. 학생 테이블 제약조건 추가
ALTER TABLE 학생 ADD PRIMARY KEY (학번);
ALTER TABLE 학생 MODIFY 이름 NOT NULL;  -- NOT NULL 추가시 MODIFY + 열이름 + NOT NULL
-- 외래키 추가
ALTER TABLE 학생 ADD FOREIGN KEY (과목번호) REFERENCES 과목 (과목번호);

-- 학생 업데이트
UPDATE 학생 SET 과목번호 = '01' WHERE 학번 = '0416';

-- 제약조건 삭제하기
ALTER TABLE 과목 DROP PRIMARY KEY;    -- 과목번호 기본키를 학생테이블에서 참조중이라 삭제불가
-- CASECADE 옵션으로 외래키 조건과 같이 삭제
ALTER TABLE 과목 DROP PRIMARY KEY CASCADE;
-- 제약조건의 이름으로 삭제
ALTER TABLE 과목 DROP CONSTRAINT SYS_C007081;

-- 학생 테이블 제약조건 삭제
ALTER TABLE 학생 DROP CONSTRAINT SYS_C007082;
ALTER TABLE 학생 DROP CONSTRAINT SYS_C007083;

-- 테이블에 열을 추가 / 수정 / 삭제
-- 서브쿼리로 테이블 카피
DROP TABLE 직원;
CREATE TABLE 직원 (직원번호, 이름, 급여, 부서번호)
AS SELECT employee_id, first_name, salary, department_id
FROM employees
WHERE department_id = 90;   -- 90번 부서의 직원들

SELECT * FROM 직원;

-- 열을 추가
ALTER TABLE 직원 ADD(성별 VARCHAR2(3));
ALTER TABLE 직원 ADD(커미션 NUMBER DEFAULT 0);

-- 열을 수정(데이터 타입을 바꾸거나 용량을 늘릴때)
DESC 직원;
ALTER TABLE 직원 MODIFY (성별 VARCHAR2(10));
ALTER TABLE 직원 MODIFY (성별 NUMBER);

-- 열을 삭제
ALTER TABLE 직원
DROP COLUMN 성별;

-- 테이블의 이름 수정
RENAME 직원 TO 직원2;
DESC 직원2;

