-- 그룹함수 (다중행 함수, 집계함수)
select ROUND( AVG(salary) ) 평균값, MAX(salary) 최대값, MIN(salary) 최소값, SUM(salary) 합계, COUNT(salary) 카운트
from employees
where job_id like '%REP';

SELECT COUNT(*) FROM employees;

SELECT COUNT(*)
FROM employees WHERE department_id = 80; -- 80번부서 직원들의 수

-- 그룹함수에서는 NULL값을 제외하고 계산한다.(예외 count(*) => 전체수 계산)
SELECT COUNT(department_id)
FROM employees; -- 1명이 부서가 없음(사장)

SELECT COUNT(DISTINCT department_id)
FROM employees; -- 중복되지 않은 부서의 개수

SELECT AVG(commission_pct)
FROM employees; -- NULL값을 제외한 모든 직원들의 커미션 평균

-- Group by 절 : 특정 그룹으로 나누어서 그룹함수를 사용
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호; -- 부서번호로 그룹 나눔

SELECT * FROM employees WHERE department_id is null;

-- 예제 1
SELECT department_id 부서명, COUNT(*) 사원수, MAX(salary) 최대급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
group by department_id
order by 급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, job_id 직종, sum(salary) 급여합계, count(*) 직원수
FROM employees
group by department_id, job_id
order by department_id;

-- 예제 3
SELECT
    AVG( max(salary)) 부서별최고월급평균,
    AVG( MIN(salary)) 부서별최저월급평균
FROM employees
group by department_id;

-- 그룹 함수의 조건절 HAVING
SELECT department_id 부서명, count(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5; -- 사원수 5명이 넘는 부서

-- 예제 1
SELECT job_id 직업번호, sum(salary) 급여합계
FROM employees WHERE job_id !='AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY 급여합계 DESC;

-- 예제 2
SELECT department_id 부서번호, ROWID( AVG(salary)) 평균급여
FROM employees WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

-- 예제 3
SELECT job_id 직업번호, sum(salary) 급여합계
FROM EMPLOYEES WHERE job_id NOT LIKE '%REP'
group by job_id
having sum(salary) >= 13000
order by 급여합계 DESC;