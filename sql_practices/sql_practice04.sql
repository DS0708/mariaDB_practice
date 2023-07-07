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

-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

