-- Math Function

-- abs 	절대값
select abs(1), abs(-1) from dual;
-- ceil	큰 정수 중 제일 작은 값 반환
select ceil(3.14), ceiling(3.14) from dual;
-- floor	작은 정수 중 제일 큰 값 반환
select floor(3.14) from dual;
-- mod 
select mod(11,3), 10%3 from dual;
-- round(x) : x에 가장 근접한 정수
-- round(x,d) : x의 소수점 d 자리에 가장 근접한 실수
select round(1.498), round(1.498,2), round(1.498,0) from dual;
-- power(x,y), pow(x,y) : x의 y승
select power(2,10), pow(2,10) from dual;
-- sign : 양수: 1, 음수 -1, 0:0
select sign(20), sign(-100), sign(0) from dual;
-- greates(x, y, ....), least(x,y, ....) : max, min, 문자열 비교도 가능	
select greatest(10,40,20,50), least(10,40,20,50) from dual;
select greatest('A','b','C','d'), least('hello','hella','hell') from dual;

-- 데이터베이스가 느리다는 고정관념이 있는데 그렇지 않다. 될 수 있으면 SQL수준에서 끝낼 것.


