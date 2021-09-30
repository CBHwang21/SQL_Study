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



