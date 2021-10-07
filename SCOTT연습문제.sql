-- 연습문제 1~10
-- 1
SELECT empno 사원번호, ename 이름, sal 월급
FROM emp WHERE deptno=10;
-- 2
SELECT ename 이름, hiredate 입사일, deptno 부서번호
FROM emp where empno=7369;
-- 3
SELECT *
FROM emp WHERE ename='ALLEN';
-- 4
SELECT ename 이름, empno 부서번호, sal 월급
FROM emp WHERE hiredate='81/02/20';
-- 5
SELECT *
FROM emp WHERE job <> 'MANAGER'; -- !=, <> 둘다 가능
-- 6
SELECT *
FROM emp WHERE hiredate >= '81/04/02';
-- 7
SELECT ename 이름, sal 급여, deptno 부서번호
FROM emp WHERE sal>=800;
-- 8
SELECT *
FROM emp WHERE deptno>=20;
-- 9
SELECT *
FROM emp WHERE ename>='L';
-- 10
SELECT *
FROM emp WHERE hiredate<'81/12/09';
-- 11
SELECT empno 직원번호, ename 이름
FROM emp WHERE empno<=7698;
-- 12
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp WHERE hiredate>='81/04/02' and hiredate<='82/12/09';
--BETWEEN
SELECT ename 이름, sal 월급, deptno 부서번호
FROM emp WHERE hiredate BETWEEN '81/04/02' and '82/12/09';
-- 13
SELECT ename 이름, job 직업, sal 급여
FROM emp WHERE sal>1600 and sal<3000;
-- 14
SELECT *
FROM emp WHERE empno not between 7654 and 7782;
-- 다른방법
SELECT *
FROM emp WHERE NOT(empno >=7654 and empno<=7782);
-- 15
SELECT *
FROM emp WHERE ename BETWEEN 'B' and 'J';
-- 16
SELECT *
FROM emp WHERE hiredate >= '81/01/01' and hiredate <= '81/12/31';
SELECT *
FROM emp WHERE hiredate not BETWEEN '81/01/01' and '81/12/31';
SELECT *
FROM emp WHERE  to_char(hiredate, 'YYYY') <> '81/01/01';
-- 17
SELECT *
FROM emp WHERE job = 'MANAGER' or job = 'SALESMAN';
SELECT *
FROM emp WHERE job IN( 'MANAGER', 'SALESMAN');
-- 18
SELECT ename 이름, empno 사원번호, deptno 부서번호
FROM emp WHERE deptno not in(20, 30);
-- 19
SELECT empno 사원번호, ename 이름, hiredate 입사일, deptno 부서번호
FROM emp WHERE ename like 'S%';
-- 20
SELECT *
FROM emp WHERE hiredate BETWEEN '1981-01-01' and '1981-12-31';
-- 21
SELECT *
FROM emp WHERE ename like '%S%';
-- 22
SELECT *
FROM emp WHERE ename LIKE 'M____N';
-- 23
SELECT *
FROM emp WHERE ename LIKE '_A%';
-- 24
SELECT *
FROM emp WHERE comm is NULL;
-- 25
SELECT *
FROM emp WHERE comm IS NOT NULL;
-- 26
SELECT ename 이름, deptno 부서, sal 월급
FROM emp WHERE deptno=30 and sal >=1500;
-- 27
SELECT empno 사원번호, ename 이름, deptno 부서번호
FROM emp WHERE ename LIKE 'K%' or deptno=30;
-- 28
SELECT *
FROM emp WHERE sal >=1500 and deptno=30 and job like 'MANAGER';
-- 29(ORDER BY때 순서대로 하려면 그냥 ;만 붙여도 된다.)
SELECT *
FROM emp WHERE deptno=30 ORDER BY empno;
-- 30
SELECT *
FROM emp ORDER BY sal DESC; 
-- 31
SELECT *
FROM emp ORDER BY deptno ASC, sal DESC;
-- 32
SELECT deptno, ename, sal
FROM emp ORDER BY deptno DESC, ename, sal DESC;
-- 33
SELECT ename, sal, round(sal*0.13) bonus, deptno
FROM emp WHERE deptno=10;
-- 34
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) total
FROM emp ORDER BY total DESC;
-- 35
SELECT ename, sal, to_char(sal*0.15, '$9999.9') 회비
FROM emp WHERE sal BETWEEN 1500 and 3000;
-- 36
SELECT d.dname , COUNT(*)
FROM emp e join dept d on e.deptno = d.deptno
group by d.dname
having count(*) > 5;
-- 37
SELECT job, SUM(sal) 급여합계
FROM emp
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal) > 5000;
-- 38
SELECT e.empno, e.ename, e.sal, s.grade
FROM emp e join salgrade s
on e.sal between s.losal and s.hisal;
-- 39 열의 이름을 입력할때 띄우고 싶으면 ""사용
SELECT deptno, COUNT(*) 사원수, count(comm) "커미션 받은 사원수"
FROM emp
GROUP BY deptno;
-- 40
SELECT ename,deptno,
    decode(deptno, 10, '총무부',
                   20, '개발부',
                   30, '영업부'
           ) 부서명
FROM emp;

SELECT ename, deptno, CASE deptno
WHEN 10 THEN '총무부'
WHEN 20 THEN '개발부'
WHEN 30 THEN '영업부'
end "부서명"
FROM emp;