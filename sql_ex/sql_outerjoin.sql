-- Outer Join

-- insert into dept values(null, '총무');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '개발');
 insert into dept values(null, '기획');

select * from dept;

show tables;

 insert into emp values(null, '둘리', 1);
 insert into emp values(null, '마이콜', 2);
 insert into emp values(null, '또치', 3);
 insert into emp values(null, '길동', null);

select * from emp;

select a.name, b.name
  from emp a join dept b on a.dept_no = b.no;

-- left join
select a.name as '사원', ifnull(b.name, '없음') as '부서'
  from emp a left join dept b on a.dept_no = b.no;

-- right join
select a.name, b.name
  from emp a right join dept b on a.dept_no = b.no;

-- full join
-- mysql은 지원 안함!