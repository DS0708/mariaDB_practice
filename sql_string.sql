--
-- 문자열 함수
-- 
use employees;
-- upper
select upper('seoul'), ucase('seoul')
	from dual;
    
-- substring(String, index, length)
-- 기본 프로그래밍 언어와 다르게 0부터 시작하는 것이 아닌 1로 시작한다. Except for `limit`	
select substring('Hello World', 3, 2);

-- ex_01 : 1989년 입사한 사원들의 이름, 입사일을 출력하세요.
select concat(first_name, " ", last_name) as 'name', hire_date
	from employees
	where hire_date like '1989-%';
-- substring 사용
select concat(first_name, " ", last_name) as 'name', hire_date
	from employees
	where substring(hire_date,1,4) = '1989';
    
-- lpad(오른쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234', 10, 'a');
select rpad('1234',10,' ');

-- ex_02 : 직원들의 월급을 오른쪽 정렬(빈공간 *)
select lpad(salary,20,'*')
	from salaries;
    
-- trim, ltrim, rtrim
select ltrim('	hello	'), rtrim('		hello	'), trim('	 hello	')
	from dual;
select concat('---',ltrim('    hello    '),'---'),
	concat('---',rtrim('    hello    '),'---'),
    concat('---',trim('    hello    '),'---'),
    concat('---',trim(leading 'x' from 'xxxxxhelloxxxxx'),'---'),
    concat('---',trim(trailing 'x' from 'xxxxxhelloxxxxx'),'---'),
    concat('---',trim(both 'x' from 'xxxxxhelloxxxxx'),'---')
	from dual;

-- length
select length('Hello World') from dual;







