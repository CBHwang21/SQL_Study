-- 서브쿼리

-- Popp 직원보다 고용일이 최근(이후)인 사람
-- 주의점: 단일행 서브쿼리를 사용할때는 서브쿼리의 결과가 비교하는 데이터와 같고 하나만 출력해야 한다.
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date FROM employees WHERE last_name = 'Popp');

-- 그룹함수의 결과를 서브쿼리로 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary = ( SELECT MIN(salary) FROM employees );

-- 예제 풀기 1,2,3,4
SELECT last_name 이름, salary 급여
FROM employees
WHERE salary > ( SELECT salary FROM employees WHERE last_name = 'Abel');

SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, salary 급여
FROM employees
WHERE department_id = ( SELECT department_id FROM employees WHERE last_name = 'Bull')
AND salary > ( SELECT salary FROM employees WHERE last_name = 'Bull');

SELECT last_name 이름, salary 급여, manager_id 매니저
FROM employees
WHERE manager_id = ( SELECT employee_id FROM employees WHERE last_name = 'Russell');

SELECT *
FROM employees
WHERE job_id = ( SELECT job_id FROM jobs WHERE job_title = 'Stock Manager');

-- 다중행 서브쿼리(서브쿼리 결과가 여러개의 행으로 출력)
-- IN은 값이 하나라도 같으면 검색됨

SELECT MIN(salary) FROM employees GROUP BY department_id; -- 부서별 최저 월급

-- 다중행 서브쿼리에서는 바로 = >< 같은 비교를 할 수 없음.
SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

-- ANY는 값이 하나라도 맞으면 검색됨
SELECT department_id, last_name, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
    AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- ALL은 값이 전부 다 만족해야 된다.
SELECT department_id, last_name, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG')
    AND job_id != 'IT_PROG'
ORDER BY salary DESC;

-- 예제 1
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE department_id = 20)
    AND department_id !=20;
 
-- 예제 2
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'ST_MAN');

-- 예제 3
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL ( SELECT salary FROM employees WHERE job_id = 'IT_PROG');

-- 다중열 서브쿼리 (열이 여러개일때)
-- 이름이 브루스인 직원과 같은 매니저, 같은 직업인 직원을 출력
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id FROM employees WHERE first_name = 'Bruce')
    AND first_name <> 'Bruce';

-- 부서별 최소 급여를 받는 직원들을 검색
SELECT department_id 부서번호, employee_id 사원번호, first_name, salary
FROM employees
WHERE (department_id, salary) in (SELECT department_id, MIN(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

-- 예제
SELECT first_name 이름, job_id 직종, salary 월급, department_id 부서번호
FROM employees
WHERE (job_id, salary) in (SELECT job_id, MIN(salary)FROM employees GROUP BY job_id)
ORDER BY salary DESC;