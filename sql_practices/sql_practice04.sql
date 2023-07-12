-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
from employees a, salaries b
where a.emp_no = b.emp_no
	and b.salary > (
		select avg(salary)
        from salaries
        where to_date > curdate()
    );
-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select a.emp_no, a.first_name, max(c.salary)
from employees a, dept_emp b, salaries c
	where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and b.to_date > curdate()
    and c.to_date > curdate()
    group by b.dept_no
    order by max(c.salary) desc;
-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 

-- 자신의 부서 평균 급여 구하기
select a.dept_no, avg(b.salary)
from dept_emp a, salaries b
where a.emp_no = b.emp_no
	and a.to_date > curdate()
    and b.to_date > curdate()
    group by a.dept_no;

select a.emp_no, a.first_name, c.salary, b.dept_no
from employees a, dept_emp b, salaries c, 
	(select a.dept_no, avg(b.salary) as avg_sa
	from dept_emp a, salaries b
	where a.emp_no = b.emp_no
	and a.to_date > curdate()
    and b.to_date > curdate()
    group by a.dept_no) as d
    where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and b.dept_no = d.dept_no
    and b.to_date > curdate()
    and c.to_date > curdate()
    and c.salary > d.avg_sa
    order by c.salary;		-- 검산 코드 추가
    
    
-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

-- 부서별 매니저 이름 
select a.emp_no, a.first_name, c.dept_name, b.dept_no
from employees a, dept_manager b, departments c
where b.to_date > curdate() 
	and a.emp_no = b.emp_no
    and b.dept_no = c.dept_no;

-- 
select aa.emp_no, aa.first_name, cc.first_name as 'manager_name', cc.dept_name
from employees aa, dept_emp bb, (
	select a.emp_no, a.first_name, c.dept_name, b.dept_no
	from employees a, dept_manager b, departments c
	where b.to_date > curdate() 
	and a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
) as cc
where aa.emp_no = bb.emp_no
	and bb.dept_no = cc.dept_no
    and bb.to_date>curdate();

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- make view
create view max_avg_salary_dept as
select a.dept_no
from dept_emp a, salaries b
where a.emp_no = b.emp_no
	and a.to_date > curdate()
    and b.to_date > curdate()
    group by a.dept_no
    order by avg(b.salary) desc
    limit 0,1;
-- view check
select dept_no from max_avg_salary_dept;
-- Solution1 : join
select a.emp_no, a.first_name, c.salary, d.dept_no
from employees a, titles b, salaries c, dept_emp d, max_avg_salary_dept e
where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and b.to_date > curdate()
    and c.to_date > curdate()
    and d.to_date > curdate()
    and d.dept_no = e.dept_no;
-- Solution2 : exists
select a.emp_no, a.first_name, c.salary, d.dept_no
from employees a, titles b, salaries c, dept_emp d
where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and b.to_date > curdate()
    and c.to_date > curdate()
    and d.to_date > curdate()
    and exists(select dept_no
		from max_avg_salary_dept aa
        where aa.dept_no = d.dept_no
    );
-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select dept_name, dept_no from departments;

select a.dept_name
	from departments a
    where exists(
		select dept_no
        from max_avg_salary_dept b
        where b.dept_no = a.dept_no
    );
-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select	b.title
	from salaries a, titles b
    where a.emp_no = b.emp_no
    group by b.title
    order by avg(a.salary) desc
    limit 0,1;

-- error : group by 절의 컬럼은 따로 따로 실행된다.
select title, max(avg_salary)
	from (select b.title, avg(a.salary) avg_salary
		from salaries a, titles b
		where a.emp_no = b.emp_no
		group by b.title) as sa_ti;
        
-- add order by avg_salary desc in subquery
select title, max(avg_salary)
	from (select b.title, avg(a.salary) avg_salary
		from salaries a, titles b
		where a.emp_no = b.emp_no
		group by b.title
        order by avg_salary desc) as sa_ti;
    

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

-- 부서별 매니저 연봉 구하기 
select a.emp_no, a.dept_no, b.emp_no as mg_emp_no, c.salary
	from dept_emp a ,dept_manager b, salaries c
    where a.dept_no = b.dept_no
    and a.emp_no = c.emp_no
    and a.to_date > curdate()
    and b.to_date > curdate();
    
select bb.dept_name, aa.first_name, dd.salary, cc.first_name as 'mg_name', dd.salary as 'mg_salary'
	from employees aa, departments bb, (select a.emp_no, a.dept_no, b.emp_no as mg_emp_no, c.salary , d.first_name
		from dept_emp a ,dept_manager b, salaries c, employees d
		where a.dept_no = b.dept_no
		and a.emp_no = c.emp_no
        and a.emp_no = d.emp_no
		and a.to_date > curdate()
		and b.to_date > curdate()) as cc, salaries dd
        where aa.emp_no = cc.emp_no
        and bb.dept_no = cc.dept_no
        and aa.emp_no = dd.emp_no
        and dd.salary > cc.salary
        and dd.to_date > curdate()
        order by cc.salary asc;





