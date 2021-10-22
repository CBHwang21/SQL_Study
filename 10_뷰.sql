-- 뷰는 가상의 테이블

-- 단순한 뷰 만들기
DROP VIEW EMP_V1;
CREATE VIEW EMP_V1 (직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;

-- 테이블 삭제(정리)
DROP TABLE 학생;

-- 뷰에 데이터를 입력(실제 테이블이 아니기 때문에 실제로는 테이블에 입력)
INSERT INTO emp_v1(직원번호, 이름, 성, 이메일, 고용일, 직종)
VALUES(333, '펭수', '김','Peng', SYSDATE, 'IT_PROG');

SELECT * FROM employees;

-- 복잡한 뷰
-- 그룹함수를 쓴 뷰는 DML(입력, 수정, 삭제) 등 불가
CREATE OR REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호, count(*) 직원수,
    MAX(salary) 최고급여,
    MIN(salary) 최저급여,
    ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT * FROM 부서별_직원_보고서;

-- 읽기 전용뷰 만들기 (90번 부서 직원들의 읽기 전용 뷰)
CREATE OR REPLACE VIEW EMP90_read (직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM employees WHERE department_id = 90
WITH READ ONLY;

SELECT * FROM emp90_read;
-- DML 작업이 안됨
DELETE FROM emp90_read;
