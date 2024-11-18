-- mariadb 서버에 접속
mariadb -u root -p

-- 스키마(database) 목록 조회
show databases;

-- 스키마(database) 생성
CREATE DATABASE board;

-- 스키마 삭제
drop database board;

-- 스키마 선택
use board;

-- 테이블 목록 조회
show tables;

-- 문자 인코딩 조회
show variables like 'character_set_server';

-- 문자 인코딩 변경
alter database board default character set utf8mb4;

-- 테이블 생성
create table author(id int primary key, name varchar(12), email varchar(255), password varchar(255));

-- 테이블 컬럼조회
describe <조회 할 테이블 명>;

-- 테이블 컬럼 상세조회
show full column from <조회 할 테이블 명>;

-- 테이블 생성 명령문 조회
show create table <조회 할 테이블 명>;

-- post 테이블 신규 생성 (id, title, content, Author_id)
ex) create table post(id int primary key, title varchar(255), content varchar(255), author_id int not null, foreign key(author_id) references author(id));

-- 테이블 index(성능향상옵션) 조회
show index from <조회 할 테이블 명>;

-- 테이블의 구조를 변경
alter table ~

-- 테이블의 이름 변경
alter table <바꿀 테이블 이름> rename <바꿀이름>;

-- 테이블 컬럼 추가
alter table author add column <추가할 테이블 이름> <타입>;
ex) alter table author add column age int;

-- 테이블 컬럼 삭제
alter table author drop column <삭제할 테이블 이름>
ex) alter table author drop column age;

-- 테이블 컬럼명 변경
alter table <대상 테이블> change column <대상컬럼> <바꿀컬럼명> varchar(255);
ex) alter table post change column content contents varchar{255};

-- 테이블 컬럼 타입과 제약조건 변경 / 덮어쓰기 됨에 유의
alter table author modify column <바꿀 컬럼명> <바꿀 조건> <유지할 제약조건>
ex) alter table author modify column email varchar(100) not null;

-- 테이블 삭제
show create table post;
drop table post;
