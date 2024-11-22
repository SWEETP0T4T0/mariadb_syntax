-- 여러 사용자가 1개의 글을 수정할 수 있다 가정 후 db 리뉴얼
-- author 와 post가 n:m관계가 되어 관계 테이블을 별도 생성
create table author(id bigint auto_increment,
email varchar(255) not null unique, name varchar(255),
created_time datetime default current_timestamp());

-- 복합키로 author_post 생성
create table author_post2(
    author_id bigint not null,
    post_id bigint not null,
    primary key(author_id, post_id),
    foreign key(author_id) references author(id),
    foreign key(post_id) references post(id));

