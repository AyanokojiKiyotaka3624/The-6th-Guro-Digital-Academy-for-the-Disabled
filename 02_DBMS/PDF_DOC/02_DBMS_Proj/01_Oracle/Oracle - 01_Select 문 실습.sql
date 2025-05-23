/* Select 문 실습 */ 

/* 
EMPLOYEE : 사원 테이블 
  - ENO  : 사원 번호 
  - ENAME : 사원명
  - JOB   : 직책 
  - MANAGER : 직속상관[사수]
  - HIREDATE : 입사날짜
  - SALARY : 월급
  - COMMISSION : 보너스 
  - DNO : 부서번호 
DEPARTMENT : 부서 테이블 
  - DNO : 부서번호
  - DNAME : 부서명
  - LOC   : 부서 위치 
*/ 


-- 테이블의 구조 파악
desc employee; 
desc department; 

-- 테이블의 모든 레코드(값) 출력 
select * from department; 
select * from employee; 

/*
    select 컬럼명 from 테이블명[뷰명]; 
*/ 

-- 모든 컬럼 출력 하기 : * 
select * from employee; 

-- 특정 컬럼만 출력 하기 
select ename, hiredate, commission 
from employee; 

-- 특정 컬럼만 출력 하기- 하나의 컬럼을 여러번 출력, 컬럼의 순서, 컬럼의 연산도 가능 
select ename, salary, salary,job, job, salary , salary * 2 
from employee; 

-- 컬럼을 별칭[알리어스] 하기 : 원본 컬럼명을 다른이름으로 바꾸어서 출력 
select * from employee; 

select eno as 사원번호, ename 사원명, job as 직책, manager "직속 상관"
from employee; 

-- 컬럼을 여러번 출력 하거나 컬럼의 연산을 하면 컬럼명이 바뀜 
select eno "사원 번호" , ename 사원명, salary 연봉, (salary * 2) "월급의 2배"
from employee; 

-- where 조건절 사용 하기 : 조건에 맞는 내용만 가지고 오기
--      =  : 컬럼에 존재하는 값
--      >, >= , <, <=  : 
--      or : 둘중에 하나만 만족 하면됨.
--      and : 모두 만족 하는 값을 가지고 옴. 
-- 주의 : 값을 가지고 처리할 때 대소문자 구분함. 
-- 직책이 'SALEMAN' 인 사원 정보를 출력 
select * 
from employee
where job = 'SALESMAN'; 

select ename  이름, eno 사원번호, job 직책  
from employee
where job = 'SALESMAN' ; 

-- Where 절에서 비교 연산자 : > , >= , <, <= 
-- 월급 (salary) 이 2500 이상인 사원 정보를 출력 
select * 
from employee
where salary >= 2500; 

-- Where 절에서  OR 연산자 
-- 연봉이 2500 이상이거나 , 직책이 SALESMAN 인 사원 
select * 
from employee 
where salary >= 2500 or job = 'SALESMAN'; 

-- Where 절에서  and 연산자 
-- 연봉이 2500 이상고 , 직책이 SALESMAN 인 사원 
-- 연봉이 2500 이 넘는 SALESMAN 인 사원 
select * 
from employee 
where salary >= 2500 and job = 'SALESMAN'; 

-- 분석가 [ANALYST] 중에 연봉이 2500이 넘는 사원 정보를 출력 
select * 
from employee
where salary >= 2500 and job = 'ANALYST'; 

select * from employee; 

-- 월급이 2000 ~ 3000 사이인 사원의 직책을 출력 하세요.  :  distinct (중복제거) 
select distinct job 직책 -- ,ename 사원명, salary  월급
from employee 
where salary >= 2000 and salary <= 3000 ; 

-- 우리 회사의 직책들만 출력 : 중복을 제거 : distinct , 한컬럼만 가져와서 distinct
select distinct job 
from employee; 

-- 사원번호가 7788, 7566, 7521인 사원의 이름과 월급을 출력하세요. (in 키워드) 
select ename, salary, eno
from employee
where eno = 7788 or eno = 7566 or eno = 7521 ; 

select ename, salary, eno
from employee
where eno in (7788 , 7566 , 7521) ;

-- 직책이 SALESMAN이 거나, 월급이 1500이상 이고 5000 사이인 사원 정보를 출력하세요.
select * 
from employee
where job='SALESMAN' or (salary >= 1500 and salary <= 5000); 

-- 부서번호가 20인 사원의 직책을 출력 하세요. 

select job , dno , ename
from employee
where dno = 20; 

-- where : like 키워드 : 특정 컬럼의 값을 검색 할때 사용 <== 게시판, 방명록, 회원정보 
    -- 문자열 검색할때 사용됨 
    -- % : 어떤 값이 와돠 상관없다. 
    -- ? : 글자 1자가 어떤값이 와도 상관없다. 
-- job 컬럼에서 '%MAN' 을 검색 
select job 
from employee
where job like '%MAN' ; 

select * from employee; 

-- 이름이 '%CO%' 가 들어간 사원을 검색 
select ename 
from employee
where ename like '%CO%' ; 

-- NULL 검색 할때  : 보너스가 없는 사원 검색 
select *
from employee
where commission is null ; 

-- 보너스가 존재하는 사원  검색 할때
select *
from employee
where commission is not null ; 

-- NULL 처리 함수 : NVL (컬럼명, 0) <== 컬럼의  NULL을 0 으로 바꾸어서 처리
select * from employee; 

-- 각 사원의 연봉을 구하기 <== NULL 과 연산(+/-/*//) 하면 모두  NULL 
select ename , salary, commission , salary *12 + commission "연봉"
from employee; 

select ename , salary, commission, NVL(commission,0) nvl함수적용
from employee; 

select ename , salary, commission ,NVL (commission, 0) NVL함수적용,
    salary *12 + NVL(commission,0) "연봉"
from employee; 

-- where 절의 연산자 : 
    --  같지않다.   : <> , !=, ^=    
    - between      :   and 연산자 대신 between 사용 ,     between A and B 
 
 select * from employee; 
 
 -- 월급이 1500 이상 3000 이하 사원정보 출력 
 select * 
 from employee
 where salary >=1500 and salary <= 3000;  
 
 select * 
 from employee
 where salary between 1500 and 3000; 
 
 -- count () 함수 : 총 레코드수 , NULL은 카운트 하지 않는다. 
     -- 게시판 만들때 페이징 처리함. 
 
 select * from employee; 
 
 select count(*) from employee;
 select count (commission) from employee; 
 
 -- 정렬 해서 출력 하기 : order by 
    -- select 문의 제일 마지막에 위치 
    --  asc :  오름 차순 정렬 :   a -> z, A -> Z, 0 -> 9, ㄱ -> ㅎ [생략간능]
    --  desc:  내림 차순 정렬 :   z -> a, Z -> A, 9 -> 0, ㅎ -> ㄱ
 
 select * 
 from employee
 where salary > 1500 
 order by salary asc ; 
 
  select * 
 from employee
 where salary > 1500 
 order by ename desc ;

-- 두 컬럼이 동시에 정렬될때 : 앞의 컬럼이 모두 정렬되고 같은 값이 존재하는 것에 대해서 
--    뒤의 컬럼이 정렬된다. 

select * from employee; 

select job, ename 
from employee
order by job asc , ename desc ; 






