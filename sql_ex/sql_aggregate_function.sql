-- sum
select emp_no, sum(salary) from salaries;
-- emp_no는 아무의미 없다.

-- query 순서
-- 1. from: 접근 테이블을 확인
-- 2. where: 조건에 맞는 row를 선택(임시 테이블)
-- 3. 집계 (임시테이블 -> 결과테이블)
-- 4. 출력

-- ex) 사번이 10060인 사원이 받은 평균 연봉
select avg(salary), emp_no
	from salaries
    where emp_no=10060;
-- 논리적 오류임.

-- group by 에 참여하고 있는 컬럼은 select절에 올 수 있다.
-- 사원별 평균 연봉 
select emp_no, avg(salary)
	from salaries
    group by emp_no;
    
    
-- having, where을 쓰면 안됨에 주의할 것.
-- 예제: 평균 월급이 60,000 달러 이상인 직원의 사번과 평균 월급을 출력하세요.
select emp_no, avg(salary) as average
	from salaries
    group by emp_no
    having average >= 60000
    order by average asc;
    
-- 쿼리 실행순서
-- from -> where -> group by -> having -> order by -> select


-- 예제) 사번이 10060인 직원의 급여평균, 급여총합
-- 문법 적으로 옳지는 않음, 오라클에서는 오류이고 mysql은 된다.
select emp_no, avg(salary), sum(salary)
	from salaries
    where emp_no = 10060;
    
-- 문법적으로 옳은 문장
select emp_no, avg(salary), sum(salary)
	from salaries
    group by emp_no
    having emp_no = 10060;




