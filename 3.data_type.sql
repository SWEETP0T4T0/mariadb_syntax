-- tinyint : -128~127까지 표현 (1byte 할당)
alter table author modify coilumn age unsighed
    ㄴtinyint를 양의 범위로만 사용.

-- decimal(정수부 자릿수, 소수부 자릿수) - 소수부 자릿수 초과시 반올림
ex) alter table post add column price decimal (10,3);
insert into post(id, title, price) values(3, 'java thoery' 10.33412)

-- 정수 : tinyint, int, bigint
-- 실수 : 고정소수점 - decimal(정수부,소수부) / 부동소수점 - float, double

-- varchar와 text
-- varchar - 가변데이터, 디스크+메모리사용, 길이 지정 가능, index 사용 가능
-- text - 가변데이터, 메모리만 사용하여 더 빠름, 길이 지정 불가, index 사용 가능
ex) alter table post add column self_introduction text;
    insert into post(id, self_introduction) values(7,'안녕하세요 김선국입니다.')

-- blob(바이너리데이터) 타입 실습
ex) alter table author add column profile_image longblob;
    insert into author(id, profile_image) values(8, load_file('C:\20e7077f9429c.png'))
-- ㄴ 대체로 사진-문자열-2진법-문자열-사진 방식이 아닌 자체적으로 저장 후 경로를 입력하는 방식을 사용


--  ENUM 타입 실습 - 삽입 될 수 있는 데이터의 종류를 한정하는 데이터 타입
ex) alter table author add column sex enum('man', 'woman') not null;
    alter table  author add column role enum('user', 'admin') not null default 'user';


-- DATE : 날짜 only, DATETIME : 날짜 + 시간, DATETIME(m) : 날짜 + 시간 + microseconds
-- datetime은 입력, 수정, 조회시에 문자열 형식을 활용
ex) alter table post add column created_time datetime default current_timestamp();
    update post set created_time = '2021-12-23 19:11:13' where id=3;

-- 조회 시 비교연산자
ex) select * from author where id>=2 and id<=4;
    = select * from author where id between 2 and 4;
    = select * from author where id not(id <2 or id>4);
    = select * from author where id in(2,3,4);
    = select * from author where id not in(1,5); -- 전체 데이터가 1~5 일 경우
    
-- 특정 문자를 포함하는 데이터를 조회하기 위해 사용하는 키워드
ex) select * from post where title like '%n';
    select * from post where title like '%h%';


-- 정규표현식을 활용한 조회
ex) select * from post where title regexp '[a-z]' \\하나라도 알파벳이 포함 되어 있으면
    select * from post where title regexp '[가-힣]' \\하나라도 한글이 포함 되어 있으면

-- 날짜변환 [cast, convert] : 숫자->날짜, 날짜->숫자
-- 문자->숫자, 숫자->문자

ex) select cast(20241119 as date);
    select cast('20241119' as date);
    select convert(20241119, date);
    select convert('20241119', date);
    select cast('12' as unsighed);

    cast(date_format(created_time, '%H') as unsigned);
    \\ datetime(yy-MM-dd HH-mm-ss)에서 시간만 문자열로 출력함
    select * from post where cast(date_format(created_time, '%H') as unsigned) <=18;

-- 날짜 조회 방법
-- like패턴, 부등호 활용, date_format
ex) select * from post where created_time like '2024%';  \\문자열처럼 조회
    select * from post where created_time >='2024-01-01' and created_time < '2025-01-01';
    select date_format(created_time, '%Y-%m-%d') from post;
    select date_format(created_time, '%H:%i:%s') from post;
    select * from post where date_format(created_time, '%Y')='2024';
    select * from post where cast(date_format(created_time, '%Y')='2024' as unsigned)=2024

-- 오늘 현재 시간
select now();