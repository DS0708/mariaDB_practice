-- 날짜 함수

-- curdate(), current_date
select curdate(), current_date from dual;

-- curtime(), current_time
select curtime(), current_time from dual;

-- now, sysdate : date + time
-- 다 가져 온다음에 formatting해서 사용하기도 함
select now(), sysdate() from dual;

-- now() vs sysdate()
-- sleep(2) -> 2초 후 출력
select now(), sleep(2), now() from dual; -- 같은 초가 출력이 된다. -> now는 쿼리가 실행될 떄의 시간
select sysdate(),sleep(2), sysdate() from dual; -- sysdate는 함수가 실행되는 시간 -> 다른 초가 출력된다.

-- date_fromat
-- simple date_format 테이블을 참조.
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s') from dual;
-- %b 는 month를 영어식 달력표기법으로 변환 
select date_format(now(), '%d %b \' %y') from dual;

-- period_diff
-- 포매팅이 필요하다 -> (YYMM, YYYMM)
-- ex) 근무 개월
select emp_no, hire_date,
	period_diff(date_format(curdate(),'%y%m'),date_format(hire_date,'%y%m')) as period
 from employees;
 
 
 -- date_add(=addate), date_sub(subdate)
 -- 시간을 date 타입의 컬럼이나 값에 type(year, month, day) 의 
 -- 표현식으로 더하거나 뺄 수 있다.
 -- ex) 각 사원의 근속 년 수가 5년이 되는 날에 휴가를 보내준다면
 -- 각 사원의 근속 휴가 날짜는? -> hire_date에 5년이 지난 날짜를 구하고 싶다.
 select first_name, 
		hire_date, 
        date_add(hire_date,interval 5 year) as '근속 휴가 날짜'
	from employees;

-- 명시적 casting
select '12345' + 10, cast('12345' as int) + 10 
from dual;
-- 아마 암시적으로 date 타입 형태로 변환 되었을 것.
select date_format('2023-07-06', '%Y년 %m월 %d일') from dual;
-- explicitly casting
select date_format(cast('2023-07-06' as date), '%Y년 %m월 %d일') from dual;
-- sign = int = integer
select cast(cast(1-2 as unsigned) as signed) from dual;
select cast(cast(1-2 as unsigned) as int) from dual;
select cast(cast(1-2 as unsigned) as integer) from dual;


-- type 정리
-- 문자: varchar(100), char
-- varchar vs char : name char(5) -> 는 name attribute가 고정적인 크기 5byte로 선언되어
-- 5byte보다 낮은 문자열일 경우 공간낭비가 된다. -> 그래서 char는 보통 전화번호 같은 형식이 정해져 있는 크기의 문자열을 위해 사용
--  varchar는 길이가 정해져 있지 않은 문자열에 사용, 내부 알고리즘에 의해 dynamic하게 공간을 할당해줄 수 있음
-- 보통 이름 같은 경우 varchar사용. 근데 보통 생각하기 귀찮아서 varchar를 쓴다 ?

-- text, CLOB(Character Large OBject)
-- 보통 char이나 varchar는 최대 크기가 정해져 있어 큰 자료를 저장하기 위해 text, CLOB사용. 
-- CLOB는 중간 코드가 더 필요하다.
-- 정수 : tiny int, medium int, int(signed, integer) < unsigned < big int 
-- 실수 : float, double
-- 시간 : date, datetime
-- LOB : CLOB, BLOB(Binary Large Object)
 
 
 
 
 
 
 