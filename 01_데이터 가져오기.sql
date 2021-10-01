-- 주석 단축키 CTRL + /
/*
여러줄
주석
*/
-- 1. 테이블의 모든 행과 열을 읽어오기 , 명령문 실행은 CTRL + ENTER
-- * 은 전체 열 , 명령문 끝에는 세미콜론(;)이 있어야 한다.
select * 
from departments;

-- 2. 특정 열만 조회하기
SELECT department_id, department_name
FROM departments;

-- 3. 별칭 붙이기 (열의 이름)
SELECT department_id AS 부서번호, department_name 부서이름
FROM departments;

-- 4. 산술 연산자(+,-,*,/)
SELECT first_name 이름, job_id 직책, salary 월급
FROM employees;
-- 월급에 100씩 뺀 열을 만들기
SELECT first_name 이름, job_id 직책, salary 월급, salary-100 월급수정
FROM employees;
-- 월급에 10%를 빼기
SELECT first_name 이름, job_id 직책, salary 월급, salary-salary/10 월급수정
FROM employees;

-- 보너스를 주는데 salary에 1000을 뺀 값의 5%로 책정
SELECT
    last_name,
    first_name,
    job_id,
    salary,
    (salary-1000)*0.05 as 보너스
FROM employees;

-- distinct : 중복 값을 제거 !
select distinct job_id
from employees;

-- 예제 1
SELECT employee_id, first_name, last_name
FROM employees;

-- 예제 2
SELECT first_name, salary, salary*1.1 as 뉴셀러리
FROM employees;

-- 예제 3
SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;

-- 연결 연산자 || : 열을 붙여서 하나의 열로 출력
SELECT LAST_NAME || ' is a ' || JOB_ID as 직업정보
from employees;

-- 예제 4 : 이름을 한칸 띄우고 붙여서 열, eamil에 문자열 붙여서 출력
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME 풀네임, EMAIL|| '@company.com'
FROM employees;

-- describe(혹은 desc) : 열의 정보를 확인할 수 있다.
-- (VARCHAR2는 문자를 의미하고 괄호 안의 숫자에서 첫번째는 숫자의 수, 두번째는 소숫점의 수이다.)
DESC EMPLOYEES;
DESC DEPARTMENTS;
