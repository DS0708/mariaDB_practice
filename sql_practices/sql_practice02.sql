-- 문제 1. 
-- 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요? 함께 “최고임금 – 최저임금”이란 타이틀로 출력해 보세요.
select max(salary) '최고임금',
	min(salary) '최저임금',
	max(salary)-min(salary) as '최고임금 - 최저임금'
    from salaries;
-- 문제2.
-- 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
select date_format(hire_date,"%Y년 %m월 %d일") as '마지막 신입사원이 들어온 날'
	from employees
    where hire_date = (select max(hire_date) from employees);

-- 오류 : 집계 함수는 select 절이나 having절에서 사용된다.
select date_format(hire_date,"%Y년 %m월 %d일")
	from employees
    where hire_date = max(hire_date) ;
-- 해결 
select date_format(max(hire_date),"%Y년 %m월 %d일") as'마지막 신입사원이 들어온 날'
from employees;
-- 문제3.
-- 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
 select date_format(min(hire_date),"%Y년 %m월 %d일") as '가장 오래 근속한 직원의 입사일'
	from employees;    
-- 문제4.
-- 현재 이 회사의 평균 연봉은 얼마입니까?
select avg(salary)
from salaries
where to_date > current_date;
-- 문제5.
-- 현재 이 회사의 최고/최저 연봉은 얼마입니까?
select max(salary) as '최고 연봉', min(salary) as '최저 연봉'
from salaries
where to_date > current_date;
-- 문제6.
-- 최고 어린 사원의 나이와 최 연장자의 나이는?
desc employees;
select abs(floor(period_diff(date_format(curdate(),'%y%m'),date_format(max(birth_date),'%y%m'))/12)) as '최고 어린 사원의 나이',
	abs(floor(period_diff(date_format(curdate(),'%y%m'),date_format(min(birth_date),'%y%m'))/12)) as '최연장자 사원의 나이'
from employees;

select period_diff(date_format(curdate(),'%y%m'),date_format(min(birth_date),'%y%m')) from employees;
select period_diff(date_format(curdate(),'%y%m'),date_format('1969-04-02','%y%m')) from dual;
select * from employees;
select min(birth_date) from employees;
select curdate() from dual;
-- period_diff 는 년도가 내려갈 수록 이상한 값이 출력됨 -> 절대 쓰지 말 것.


select FLOOR(DATEDIFF(CURDATE(), min(birth_date)) / 365.25) as 'most oldest',
	FLOOR(DATEDIFF(CURDATE(), max(birth_date)) / 365.25) as 'most youngest'
from employees;






