use webdb;

-- dual은 테이블을 특별히 지정하지 않을 떄 사용
select version(), current_date, now() 
from dual; 

-- 사칙연산 가능, pi() -> 3.14, sign연산도 가능
select sign(pi()/4), 1 + 2 * 3 - 4 / 5 
from dual;
 
 -- 대소문자 구분이 없다.
 SELEct VerSION() from dual;
 
 -- table 생성 : DDL(Data Definition Language)
 create table pet(
	name varchar(100),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date);
    
    -- table 스키마 보기 : desc table_name
    desc pet;
    describe pet;
    -- 
    
    -- 테이블 삭제 DDL
    drop table pet;
    show tables;
    
    -- insert : DML(C) (Data Management Language)
    insert into pet
    values ("행운이","신동성","dog","W","2010-07-08",null);

-- select: DML(R) 
select * from pet;   

-- update DML(U)
update pet
	set name='Lucky'
where owner = '신동성';
select * from pet;

-- delete: DML(D)
delete from pet
where name = '행운이';

-- load data
load data local infile '/Users/ds/Desktop/pet.txt' into table pet;

update pet
set death = null
where name != 'bowser';
-- 

-- 'select' practice
select name, species
	from pet
    where name like 'F%';
    
    
    
    