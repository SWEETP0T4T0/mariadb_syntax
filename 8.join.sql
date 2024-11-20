-- inner join
-- 두 테이블 사이에 지정된 조건에 맞는 레코드만 반환, on 조건을 통해 교집합찾기
select * from author inner join post on auther.id=post.author_id;
select * from author a inner join post p on a.id=p.author_id;
select * from post inner join author on auther.id=post.author_id;  --첫번째와 출력순서만 달라질 뿐 조회 결과는 동일

-- 글쓴이가 있는 글 목록과 글쓴이의 이메일을 출력하시오.
-post의 글쓴이가 없는 데이터는 포함X, 글쓴이 중 글을 한번도 안쓴사람 포함X
select p.*, a.email from post p inner join author a on a.id=p.author_id;

-- 글쓴이가 있는 글의 제목, 내용, 그리고 글쓴이의 이메일만 출력하시오.
select p.title, p.contents, a.email from post p inner join author a on a.id=p.author_id;

-- 모든 글목록을 출력하고, 만약에 글쓴이가 있다면 이메일 정보를 출력.
-글을 한번도 안쓴 글쓴이는 포함X
select p.*, a.email from post p left join author a on a.id=p.author_id;

-- 글쓴이를 기준으로 left join 할 경우, 글쓴이가 n개의 글을 쓸 수 있으므로 같은 글쓴이가 여러번 출력 될 수 있음
= author와 post가 1:n 관계이므로 가능함
-글쓴이가 없는 글은 포함 X
select * from author a left join post p on a.id=p.author_id;

-- UNION : 두 테이블의 SELECT 결과를 횡으로 결합(기본적으로 DISTINCT 적용됨)
-- 컬럼의 갯수와 컬럼의 타입이 같아야 함에 유의
-- UNION ALL 은 중복까지 모두 포함


-- 서브쿼리 : SELECT문 안에 또다른 SELECT문을 서브쿼리라 한다.
-- WHERE절 안에 서브쿼리
-- 한번이라도 글을 쓴 AUTHOR 목록 조회
SELECT DISTINCT A.* FROM AUTHOR A INNER JOIN POST P ON A.ID=P.AUTHOR_ID; 
SELECT * FROM AUTHRO WHERE ID IN (SELECT AUTHOR_ID FROM POST);

-- SELECT절 안에 서브쿼리
-- AUTHOR의 EMAIL과 AUTHOR별로 본인이 쓴 글의 갯수를 출력
SELECT A.EMAIL, (SELECT COUNT(*) FROM POST WHERE AUTHOR_ID=A.ID) FROM AUTHOR A;

-- FROM 절 안에 서브쿼리
SELECT A.NAME FROM (SELECT * FROM AUTHOR) AS A; 