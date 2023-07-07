-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
select a.emp_no, a.first_name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
	and b.to_date > curdate()
    order by b.salary desc;
-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
select a.emp_no, a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no
	and b.to_date > curdate()
    order by a.first_name;
-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
select a.emp_no, a.first_name, c.dept_name
from employees a, dept_emp b, departments c
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
	and b.to_date > curdate()
    order by a.first_name;
-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
select a.emp_no, a.first_name, d.salary, e.title, c.dept_name
from employees a, dept_emp b, departments c, salaries d, titles e
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
	and a.emp_no = d.emp_no
    and a.emp_no = e.emp_no
    order by a.first_name;
-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. 
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
select a.emp_no, concat(a.first_name,' ',a.last_name), b.title, b.to_date -- 검사코드 추가
from employees a, titles b
where a.emp_no = b.emp_no
	and b.to_date < curdate()
    and b.title = 'Technique Leader';
-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
select a.last_name, c.dept_name , d.title
from employees a, dept_emp b, departments c, titles d
where a.emp_no = b.emp_no
	and b.dept_no = c.dept_no
    and a.emp_no = d.emp_no
    and a.last_name like 'S%'
	and BINARY(substring(a.last_name,1,1)) = 'S';
    -- 대소문자 구분 BINARY 함수 이용 
    
-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
select a.first_name, b.salary, c.title
from employees a, salaries b, titles c
where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
	and b.to_date > curdate()
    and c.to_date > curdate()
    and b.salary >= 40000
    and c.title = 'Engineer'
    order by b.salary desc;
-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오
select c.title, b.salary
from titles c, salaries b
where b.emp_no = c.emp_no
	and b.to_date > curdate()
    and c.to_date > curdate()
    and b.salary > 50000
    order by b.salary desc;
-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
select b.dept_name, avg(c.salary)
from dept_emp a, departments b, salaries c
where a.dept_no = b.dept_no
	and a.emp_no = c.emp_no
	and a.to_date > curdate()
    and c.to_date > curdate()
    group by b.dept_name
    order by avg(c.salary) desc;
-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
select a.title, avg(b.salary)
from titles a, salaries b
where a.emp_no = b.emp_no
	and a.to_date > curdate()
    and b.to_date > curdate()
    group by a.title
    order by avg(b.salary) desc;



