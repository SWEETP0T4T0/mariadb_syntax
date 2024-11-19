-- author 테이블에 post_count 컬럼 추가
alter tablee add column post_count int default 0;

-- post에 글 쓴 후에, author 테이블에 post_count 값에 +1 을 시키는 트랜잭션 테스트
start transaction;
insert into post(title, contents, author_id) values('hello java', 'hello java is ...', 4);
update author set post_count = post_count+1
where id = 100;

commit; \\ 또는 rollback;
-- 위 transaction은 실패 시 자동으로 rollback 어려움
-- stored 프로시저를 활용하여 자동화된 rollback 프로그래밍
delimiter //
create procedure 트랜잭션테스트3(in titleInput varchar(255), in contentsInput varchar(255), in idInput bigint)
begin
    declare exit handler for sqlexception
    begin
        rollback;
    end;
    start transaction;
    update author set post_count=post_count+1 where id=3;
    insert into post(title, contents, author_id) values(titleInput, contentsInput, idInput);
    commit;
end //
delimiter ;

-- 프로시저 호출
call 트랜잭션테스트();

