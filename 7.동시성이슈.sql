-- read uncommited 에서 발생할 수 있는 dirty read 실습
-- 실습 절차
- workbench에서 auto_commit 해제 후 update, commit 하지 않음(transaction1)
- turminal을 열어 select 했을 때, 위 변경사항이 읽히는지 확인(transaction2)
- 결론 : mariadb는 기본이 repeatable read이므로 commit 되기 전에 조회되는 dirty read가 발생하지 않음.

-- read committed에서 발생 할 수 있는 phantom-read or non-repeatable-read 실습
-- workbench에서 실행
start transaction;
select count(*) from author;
do sleep(15);     \\ 15초간 대기 후 진행
select count(*) from author;
commit;
-- 터미널에서 실행
insert into author(email) values(fdfdfdfd);
-- 결론 : mariadb는 기본이 repeatable read 이므로 phantom=read 이슈 발생하지 않음.


-- repeatable read에서 발생할 수 있는 lost update 실습
-- lost update 해결을 위한 베타 lock
-아래 코드는 workbench에서 실행
start transaction;
select post_count from author where id = 1 for update;
do sleep(10);
update author set post_count = (select post_count from author where id = 1) -1 where id = 1;
commit;

-아래 코드는 터미널에서 실행
update author set post_count = (select post_count from author where id = 1) -1 where id = 1;


-- lost update 해결을 위한 공유 lock
-아래 코드는 workbench에서 실행
start transaction;
select post_count from author where id = 1 lock in share mode;
do sleep(10);
commit;

-아래 코드는 터미널에서 실행
select post_count from author where id = 1 lock in share mode;
 