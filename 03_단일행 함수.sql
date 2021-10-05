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



























































-- 예제 1, 2
SELECT last_name 이름, salary 월급, NVL(commission_pct,0) 커미션,
        salary*12 + salary*12*NVL(commission_pct, 0) 연봉
from EMPLOYEES order by 연봉 desc;

SELECT last_name 이름, salary 월급, NVL(commission_pct,0) 커미션,
        salary*12 + salary*12*NVL(commission_pct, 0) 연봉,
        NVL2(commission_pct, '월급+보너스', '월급만') 연봉계산방법
from EMPLOYEES order by 연봉 desc;

-- decode 함수(비교할 값이 같을 경우에 사용)
SELECT last_name 이름, job_id, salary,
    decode(job_id, 'IT_PROG', salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP', salary * 1.20,
                             salary) 수정월급
from EMPLOYEES;

-- 예제
SELECT last_name 이름, job_id 직무, salary 월급,
       decode( trunc(salary/2000), 0, 0,
                                   1, 0.09,
                                   2, 0.2,
                                   3, 0.3,
                                   4, 0.4,
                                   5, 0.42,
                                   6, 0.44,
                                      0.45) 세율
FROM employees;

-- CASE 함수 비교가능 
SELECT last_name 이름, job_id, salary,
    CASE WHEN salary<5000   THEN 'Low'
         WHEN salary<10000  THEN 'Medium'
         WHEN salary<20000  THEN 'Good'
         ELSE                    'Excellent'
    END "급여수준"
FROM EMPLOYEES;

-- 예제
SELECT employee_id, first_name, last_name, salary,
    CASE WHEN salary>=9000   THEN '상위급여'
         WHEN salary>=6000   then '중위급여'
         else                     '하위급여'
    end "급여등급"
FROM employees WHERE job_id='IT_PROG';


