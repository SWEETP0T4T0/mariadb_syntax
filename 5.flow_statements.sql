-- case문
select 컬럼1, 컬럼2, 컬럼3
-- if()
case 컬럼4
    when 비교값1 then 결과값1
    when 비교값2 then 결과값2
    else 결과값3     // if(컬럼4==비교값1)(결과값1 출력) else if(컬럼4==비교값2)(결과값2 출력) else(그와)(결과값3)
end
from 테이블명;

ex) select id, email,
    case 
    when name is null then '익명사용자'
    else name
end
from author;

-- ifnull(a,b)    // 만약 a가 null이면 b 반환, null이 아니면 a 반환

select id, email, ifnull(name, '익명사용자') as '사용자명'
from author;

-- if(a, b, c): a조건이 참이면 b 반환, 가짓이면 c 반환
select id, email, if(name is null, '익명사용자', name) as '사용자명' from author;



