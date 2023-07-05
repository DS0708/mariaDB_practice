show databases;
use employees;

show tables;

-- select 기본

-- 예제1 : departments 테이블의 모든 데이터를 출력.
desc departments;
select * from departments;

-- projection
-- 예제 2 : departments 테이블에서 부서의 이름, 부서 번호 출력
desc departments;
select dept_name, dept_no from departments;

-- 예제 3 : employees 테이블에서 직원의 이름, 성별, 입사일을 출력
desc employees;
select first_name as '이름',
		last_name as '성',
        hire_date as '입사일'
        from employees
	limit 0, 1000;
    
select concat(first_name," ",last_name) as '이름',
hire_date as '입사일'
from employees;

-- distinct
-- 4-1 : titles 테이블에서 모든 직급의 이름 출력
desc titles;
select title from titles;
-- 4-2 : titles 테이블에서 직급은 어떤 것들이 있는지 직급이름을 출력
select distinct(title) from titles;

-- Where Clause
-- 예제 1 : 비교연산자 employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별 ,입사일 출력
desc employees;
select concat(first_name," ",last_name) as 'name',
		gender, hire_date 
        from employees
        where hire_date < '1991-01-01';
        -- order by hire_date desc; 맞는지 확인할때 order by 필요
        
        
-- 예제 2 : employess 테이블에서 1989년 이전에 입사한 여직원의 이름, 성별, 입사일
select concat(first_name," ",last_name) as 'name',
		gender, hire_date 
        from employees
        where hire_date < '1989-01-01' and gender = 'F'
        order by hire_date desc;
	
-- dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서번호 출력
desc dept_emp;
select emp_no '사번', dept_no '부서번호' from dept_emp
	where dept_no in ('d005','d009');
    
select emp_no '사번', dept_no '부서번호' from dept_emp
	where dept_no = 'd005' and dept_no = 'd009';
    
-- employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력 
desc employees;
select concat(first_name, " ", last_name) as 'name',
	hire_date
    from employees
	where hire_date like '1989-%';
    -- where hire_date between '1989-01-01' and '1989-12-31';


-- employees 테이블에서 직원의 전체이름,  성별, 입사일을  입사일 순으로 출력
desc employees;
select concat(first_name," ",last_name) 'name', gender, hire_date
	from employees
    order by hire_date asc;
    
-- salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
desc salaries;
select emp_no, salary 
	from salaries
    where from_date like '2001-%'
    order by salary desc;
    


