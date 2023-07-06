-- 기본 SQL 문제입니다.
use employees;
-- 문제1.
-- 사번이 10944인 사원의 이름은(전체 이름)
desc employees;
select concat(first_name," ",last_name) 'name'
	from employees
    where emp_no = 10944;
    
-- 문제2. 
-- 전체직원의 다음 정보를 조회하세요. 가장 선임부터 출력이 되도록 하세요. 출력은 이름, 성별,  
-- 입사일 순서이고 “이름”, “성별”, “입사일로 컬럼 이름을 대체해 보세요.
desc employees;
select concat(first_name," ",last_name) '이름',
	gender '성별',
    hire_date '입사일'
    from employees
    order by hire_date;

-- 문제3.
-- 여직원과 남직원은 각 각 몇 명이나 있나요?
-- mairaDB는 with를 지원하지 않음
select (select count(*) from employees where gender='m') as '남직원 수',
	(select count(*) from employees where gender='f') as '여직원 수'
    from dual;

-- 문제4.
-- 현재 근무하고 있는 직원 수는 몇 명입니까? (salaries 테이블을 사용합니다.) 
desc salaries;
-- select to_date from salaries order by to_date desc;
select count(distinct emp_no) as '현재 근무하는 직원 수' from salaries
	where to_date > '2023-07-04';


-- 문제5.
-- 부서는 총 몇 개가 있나요?
show tables;
desc departments;
select count(distinct dept_no)
	from departments;

-- 문제6.
-- 현재 부서 매니저는 몇 명이나 있나요?(역임 매너저는 제외)
show tables;
desc dept_manager;
select * from dept_manager;
-- select count(distinct concat(dept_no,emp_no))
select count(distinct emp_no)
	from dept_manager
    where to_date > '2023-07-04';



-- 문제7.
-- 전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세요.
-- order by length(col)
desc departments;
select distinct(dept_name) as 'department'
	from departments
    order by length(department) desc;

-- 문제8.
-- 현재 급여가 120,000이상 받는 사원은 몇 명이나 있습니까? 
desc salaries;
select * from salaries;
select count(distinct emp_no) as '현재 급여가 120,000이상인 사원 수'
	from salaries
    where salary >= 120000 and to_date > '2023-07-04';

select count(*) as '현재 급여가 120,000이상인 사원 수'
	from (select distinct(emp_no) emp_no, salary from salaries where to_date > '2023-07-04') as A
    where 
    exists(select * from salaries as B where salary >= 120000 and A.emp_no = B.emp_no);

-- from 서브쿼리에는 항상 alias를 지정할 것.
select count(*) as '현재 급여가 120,000이상인 사원 수'
	from (select distinct(emp_no), salary from salaries where to_date > '2023-07-04') as my_salary
    where salary >= 120000;


-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
desc titles;
select distinct(title) from titles
	order by length(title) desc;

-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
select count(distinct emp_no) as 'The number of Enginners'
	from titles
    where title = 'Engineer';


-- 문제11
-- 사번이 13250(Zeydy)인 지원이 직책 변경 상황을 시간순으로 출력해보세요.
-- 언제부터 언제까지 무슨 직책이였다 라는 것을 출력
select title, concat(from_date,"~",to_date) as '기간'
from titles
where emp_no = 13250;