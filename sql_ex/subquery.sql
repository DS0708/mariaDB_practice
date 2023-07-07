use employees;

-- 서브쿼리 

-- 1) select 절, insert 절의 values(...) 의 서브쿼리 

-- 2) from 절의 서브쿼리
select now() as n, sysdate() as s, 3+1 as r from dual;

select a.n, a.s, a.r
from (select now() as n, sysdate() as s, 3+1 as r from dual) a;

-- 실습문제 1:  현재 회사 상황을 반영한 직원별 근무부서를  사번, 직원 전체이름, 근무부서 형태로 출력해 보세요.
-- mycode
select emp.emp_no, concat(emp.first_name,' ',emp.last_name) as 'name', dept.dept_name 
	from (select a.emp_no as emp_no, b.dept_name as dept_name, a.to_date as to_date from dept_emp a join departments b on a.dept_no = b.dept_no) as dept
    join employees as emp on dept.emp_no = emp.emp_no
    where dept.to_date > curdate();
    
-- 3-1) 단일 행 연산자: =, >, <, >=, <=, <>, !=

-- 실습문제 : 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의  이름, 급여를 나타내세요.
select a.first_name, b.salary
 from employees a join salaries b on a.emp_no = b.emp_no
 where b.to_date > curdate() and
 b.salary < (select avg(salary) from salaries where to_date>curdate())
 order by b.salary desc; -- 검사 코드
 
 -- 문제 검사에 필요한 코드 
 select avg(salary) from salaries where to_date>curdate();
 
 -- 실습문제 : 현재 가장적은 평균 급여를 받고 있는 직책과 그 평균 급여를 구하세요 .
 select b.title, avg(a.salary) as avg_salary
  from salaries a join titles b on a.emp_no = b.emp_no
  where a.to_date > curdate() and b.to_date > curdate()
  group by b.title
  order by avg_salary;
  -- result code
  select title, min(avg_salary)
  from ( select b.title as title, avg(a.salary) as avg_salary
  from salaries a join titles b on a.emp_no = b.emp_no
  where a.to_date > curdate() and b.to_date > curdate()
  group by b.title) as ti_sa;
  
  
  
  -- 다중행 서브쿼리 
  -- in all any 사용 
  
  -- 예제) 현재 급여가 50000 이상인 직원 이름 출력
  
  -- use subquery
  -- --  1 subquery code
  select a.emp_no, a.first_name, b.salary
   from employees as a join salaries b on a.emp_no = b.emp_no
   where b.to_date > curdate();
   -- -- 2 result code
   select name, salary
	from ( select a.emp_no, a.first_name as name, b.salary as salary
   from employees as a join salaries b on a.emp_no = b.emp_no
   where b.to_date > curdate()) as sub_sa
   where salary >= 50000;
   
   -- use any 
   select first_name 
	from employees
    where emp_no = any (
		select emp_no from salaries
        where to_date > curdate() and
        salary >= 50000
    );

-- use in 
 select first_name 
	from employees
    where emp_no in (
		select emp_no from salaries
        where to_date > curdate() and
        salary >= 50000
    );
    
-- use some
 select first_name 
	from employees
    where emp_no = some (
		select emp_no from salaries
        where to_date > curdate() and
        salary >= 50000
    );





