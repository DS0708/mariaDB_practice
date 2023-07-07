use webdb;
show tables;
desc member;

drop table member;

-- Create
create table member(
	no int not null auto_increment,
    email varchar(200) not null,
    password varchar(64) not null, 		-- 자동으로 암호화를 시켜주는 것이 존재한다. 
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

-- alter (데이터베이스의 스키마 변경)
alter table member 
add column juminbunho char(13) not null;

alter table member
drop column juminbunho;

alter table member 
add column juminbunho char(13) not null after email;

alter table member
change column department dept varchar(100);

desc member;

alter table member add column self_intro text;

alter table member
drop column juminbunho;

-- insert
insert
	into member
values (null, 'tlsehdtjd070@naver.com', password('123'),'ds','개발팀',null); 
-- 모든 컬럼 개수만큼 값을 넣어줘야 함.

insert
	into member(email, password, name, dept)
values('jonum123@daum.net',password('111'), 'sds', 'konkuk');

insert
	into member(password, email, dept, name)
values(password('111'), 'ssh@naver.com', 'HanYiang', 'sh');
-- 순서를 마음대로 지정해줘도 상관 없음 .

select * from member; 	-- user의 password가 암호화 된 것이 비교가 됨.

-- update
update member
	set email='jonum123@google.com', password=password('123')
where no = 2;


-- transaction
use webdb;
select @@autocommit;
set autocommit=1;

insert
	into member
values (null, 'eee@naver.com', password('123'),'temp','개발팀',null); 

commit;

select * from member;



















