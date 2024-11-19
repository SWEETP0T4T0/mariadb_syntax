-- 제약조건
not null, unique 추가
ex) alter table author modify column email varchar(255) not null unique;

-- foreign key 제약조건 삭제 및 추가
-- 제약조건의 이름 확인 후 삭제 및 추가 기능
ex) 
select * from information_schema.key_column_usage where table_name = 'post'; \\ 제약조건 조회
alter table post drop foreign key post_ibfk_1; \\ 제약조건 삭제
alter table post add constraint foreign key(author_id) references author(id); \\ 제약조건 추가

-- delete, update 관련 제약조건 테스트
-- 제약조건 삭제
alter table post drop foreign key post_author_fk;
-- 제약조건 추가
alter table post add constraint post_author_fk foreign key(author_id) references author(id);
-- on delete casacade 테스트
alter table post add constraint post_author_fk foreign key author(id) on delete cascade
-- on delete set null 테스트
alter table post add constraint post_author_fk foreign key author(id) on delete set null on update set null;

-- default 옵션
alter tablee author modify column name varchar(255) default 'anonymous'
-- auto increment;  \\보통 id에 입력하지 않아도 자동으로 증가하도록 함
alter table author modify column id bigint auto_increment;
-- uuid로 고유id 만들기
alter table post add column user_id char(30) default (UUID());


