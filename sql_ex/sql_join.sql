--
-- inner join
-- 

-- EQUI JOIN
-- ex01 : 현재, 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no ,a.first_name, b.title
	from employees a, titles b
    where a.emp_no = b.emp_no
    and b.to_date > current_date();

-- 순서
-- 1. from 절에서 employees 와 titles 의 카르테지안 프로덕트
-- 2. where 절에서 emp_no가 같은 튜플들로만 임시 테이블 생성 
-- 3. where 절에서 현재 날짜보다 일할날짜가 높은 emp_no만 골라냄 
-- 4. 출력 

-- ex02 : 현재, 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어만 출력하세요. 
select a.first_name, b.title, a.gender
from employees a natural join titles b 
where a.gender = 'f' and b.title = 'Engineer' 
 and b.to_date > current_date();  
 
-- 
-- ANSI/ISO SQL1999 JOIN 표준 문법 
-- 

-- 1) natural join , 실무에서는 잘 안쓴다. 본 적이 없다. 
-- 조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않고 암묵적으로 join 
-- implicitly
select * 
	from employees a natural join title b
    where b.to_date = '9999-01-01';
-- join 표준 문법 
select a.first_name, b.title
	from employees a join titles b on a.emp_no = b.emp_no
		where b.to_date = '9999-01-01';
        
-- 2) join ~ using

-- natural join의 문제점 : 불필요한 컬럼이름이 같아 의도하지 않은 결과가 출력될 수 있다.
select count(*)
from salaries a natural join titles b 
where  a.to_date > current_date()
	and b.to_date > current_date();
-- 해결방법 : using
select count(*)
from salaries a join titles b using(emp_no)
where  a.to_date > current_date()
	and b.to_date > current_date();

-- join ~ on
-- ex) 현재, 직책별 평균 연봉을 큰 순서대로 출력하세요. 
select b.title, avg(a.salary)
from salaries a join titles b on a.emp_no = b.emp_no
where a.to_date > curdate() and b.to_date > curdate()
 group by b.title
 order by avg(a.salary) desc;
-- 실습문제1
-- 현재, 직원별 근무 부서를 출력해 보세요.
-- My code
select c.emp_no, c.first_name, b.dept_name
from (dept_emp a join departments b on a.dept_no = b.dept_no) 
	join employees c on a.emp_no = c.emp_no
    where a.to_date > curdate();
-- Teacher's code
select a.emp_no, a.first_name, b.dept_name
  from employees a, departments b, dept_emp c
 where a.emp_no = c.emp_no
   and b.dept_no = c.dept_no
   and c.to_date = '9999-01-01';
-- 실습문제 2 
-- 현재, 지급되고 있는 급여를 출력해보세요. 
-- 사번, 이름, 급여 순으로 출력 

-- 실습문제3 
-- 현재, 직책별 평균 연봉과 직원수를 구하되 직원수가 100명이상인 직책만 출력하세요. 

-- 실습문제4
-- 현재, 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 구하세요. 
-- 부서이름, 평균급여 순으로 출력, 평균 급여가 높은 순으로 출력 