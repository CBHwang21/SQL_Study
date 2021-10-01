-- 단일행 함수

-- 문자 함수
-- 대소문자 변환 UPPER LOWER INITCAP
SELECT UPPER('SQL Course'), LOWER('SQL Course'), INITCAP('SQL Course') FROM DUAL;   -- 듀얼 테스트용 테이블을 이용하여 연습

-- 문자 조작 함수
-- CONCAT: 문자열 연결, SUBSTR: 문자열을 잘라냄(첫숫자는 ~번째, 두번째 숫자는 갯수)
-- LENGTH: 문자열 길이, INSTR: 문장에서 ''안의 단어의 위치
-- TRIM: 접두어나 접미어를 잘라냄
SELECT SUBSTR('ABCDEFG',3,4), LENGTH('ABCDEFG'), INSTR('ABCDEFG','D') FROM DUAL;
SELECT TRIM(' 헬로우 '), ' 헬로우 ' FROM DUAL;    -- 공백을 없애준다

-- 문자 함수 예제
SELECT department_id, last_name
FROM employees
WHERE lower(last_name) = 'higgins';

SELECT last_name, CONCAT('직업명이 ',job_id) As 직업명
FROM employees
WHERE SUBSTR(job_id, 4, 3) = 'REP';

-- 문자열 가장 끝 문자 (-1은 문자열의 가장 끝)
SELECT last_name, SUBSTR(last_name, -1, 1)
FROM employees;

-- 문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

-- 예제
SELECT last_name 이름, LOWER(last_name) Lower적용, UPPER(last_name) Upper적용, email 이메일, INITCAP(email) Incap적용
FROM employees;

-- 예제
SELECT job_id 직업명, SUBSTR(job_id,1,2) 앞의두개
FROM employees;

-- 반올림 함수 ROUND(숫자,자릿수), 자릿수가 없으면 정수로 반올림
SELECT ROUND(15.193,0), ROUND(15.193,1), ROUND(15.193,2) FROM DUAL;

-- MOD: 나누기 후 나머지를 구함
SELECT employee_id 짝수번째, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0 -- 짝수
ORDER BY employee_id;