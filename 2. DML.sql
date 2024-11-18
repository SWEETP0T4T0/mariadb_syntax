-- 테이블에 데이터 생성
insert into 테이블명(컬럼명 1, 컬럼명2, 컬럼명3) values(데이터1, 데이터2, 데이터3);
ex) inser into author(id, name, email) values(3, 'kim', 'kim@naver.com')
-- ㄴ문자열은 일반적으로 ' '를 사용한다.

-- 데이터 조회, * = 모든 컬럼을 의미
select * from 테이블명
select name, email from author;

-- 테이블 제약조건 조회
select * from information_schema.key_column_usahe where table_name = '테이블 명'
ex) select * from information_schema.key_column_usahe where table_name = 'post'

-- 데이터 수정
-- where 문을 빠뜨리게 될 경우, 모든 데이터에 update문이 실행됨에 유의.
update 테이블명 set 컬럼명='바꿀 내용' where row값
ex) update author set name='홍길동' where id=1;
    update author set name='홍길동2', email='honggildong@naver.com' where id=2;

-- 데이터 삭제
-- where 문을 생략 할 경우, 모든 데이턱 삭제됨에 유의.
delete from 테이블명 where row값
ex) delete from author where id=5;

-- 데이터 조회
select 컬럼명 from 테이블명 where 조회조건
ex) select * from author;
    select * from author where DELYN='N'
    select * from author where name='honggildong'
    select * from author where id>3;
    select * form author where id>1 and(or) name='lee';

-- 중복제거 조회
select distinct 컬럼명 from 테이블명;
ex) select distinct name from author;

-- 데이터 정렬
-- 정렬조건이 없을 경우 pk기준으로 오름차순 정렬 됨.
order by 컬럼명
order by asc - 오름차 순, order by desc = 내림차 순
select 컬럼 명 from 테이블 명 order by 컬럼 명
select * from author order by desc name;

-- 여러 컬럼으로 정렬, 먼저 쓴 컬럼 우선 정렬. 중복 시 , 그 다음 조건 적용
select * from author order by name desc, email asc;

-- 결과 값 갯수 제한
select 컬럼 명 from 테이블 명 limit 수;
ex) select * from author order by name desc limit 10;

-- 별칭을 이용한 select
select 컬럼명 as '출력명', 컬럼명2 as '출력명2' from 테이블명
ex) select name as '이름', email as '메 일' from author;
    select a.name, a.email from author a; //author를 a로 별칭을 지은 후 name과 email을 가져옴

-- null을 조회조건으로 활용
select * from author where password is null;
select * from author where password is not null;