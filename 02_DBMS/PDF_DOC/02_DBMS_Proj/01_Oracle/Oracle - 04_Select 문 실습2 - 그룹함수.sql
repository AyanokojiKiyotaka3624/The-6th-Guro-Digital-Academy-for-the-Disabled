/*  

SQL : 구조화된 질의 언어 , DB에 질의 
CRUD : Create(생성), Read(읽기), Update(수정), Delete(삭제)

Select : Read (읽기), 출력 

그룹 함수 : group by, having 
   group by 컬럼명 : 그룹핑할 컬럼명
   having 조건     : group by 에 대한 조건 
  
  
 select 컬럼명 
 from 테이블[뷰]
 where 조건 
 group by 컬럼명[동일한값을그룹핑]
 having 조건 [group by 한 결과 값의 조건] 
 order by 컬럼명 asc[desc] 

*/ 

/* 집계 함수 : number 타입의 컬럼에 적용   <=== NULL 을 자동으로 처리됨...
    SUM  - 컬럼의 모든 값의 합
    AVG - 컬럼의 모든 값의 평균
    MAX - 컬럼의 최대값
    MIN - 컬럼의 최소값
    COUNT (*) - 그룹핑 된 레코드 수 출력 . 
    
    주의 :  단일 행으로 출력이 되기 때문에 다른 컬럼과 사용시 오류. 
             단 . group by 절에 grouping 된 컬럼은 출력 가능 
    
*/ 
desc employee; 

-- 컬럼에 함수 사용 : 
-- 월급 (salary)

select * from employee; 

select SUM(salary) "월급의 합계"
from employee; 

-- round ( 실수,소수점자리수) 
select round (AVG(salary),2) "월급의 평균"
from employee;

select MIN (salary) "최소 월급"
from employee; 

select MAX (salary) "최대 월급"
from employee; 

-- 집계 함수를 처리할때 단일 값이 나오지 않는 다른 컬럼이 오면 오류가 날수 있음. 
select MAX (salary) "최대 월급" , ename  
from employee;

select SUM(salary) 합계 ,  Round (AVG(salary), 2) 평균,  
       MAX(salary) 최대값, Min (salary ) 최소값 , count(*) 계산된레코드수
from employee; 

-- 집계 함수는 NULL을 자동으로 처리함. 
select commission
from employee; 

-- 보너스 (commission)  <== null은 자동으로 처리됨 
select SUM(commission) 합계 ,  Round (AVG(commission), 2) 평균,  MAX(commission) 최대값, 
            Min (commission ) 최소값 , count(commission) 계산된레코드수
from employee; 

-- 직책별로 월급의 합계, 평균, 최대월급 , 최소 월급, 그룹핑된 수를 출력 
select * from employee
order by job asc ; 

select job 부서명, SUM(salary) 부서별월급합계
from employee
group by job;  

-- 부서별로 월급의 합계, 평균, 최대월급 , 최소 월급, 그룹핑된 수를 출력 
select  dno 부서번호, SUM(salary) 합계, Round ( AVG(salary) ) 평균, 
            MAX(salary) 최대값, MIN(salary) 최소값, COUNT(*) 그룹핑된수
from employee
group by dno ;           -- DNO 컬럼의 동일한 값을 그룹핑해서 집계함수를 적용함. 

select * from employee
order by dno asc ; 


select salary, dno 
from employee
order by dno asc; 

-- 직책(job) 별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력 해 보세요.
select  ename, job, salary 
from employee
order by job ; 

select  job 직책 , count(*) 그룹핑된갯수 , SUM (salary ) 합계,
             round(AVG(salary),2) 평균 , MAX(salary) 최대값, MIN(salary) 최소값
from employee
group by job;                 -- job 컬럼의 동일한 값을 그룹핑 

select count(*) 전체레코드수  from employee; 

/*
   group by  절에서 where [조건] vs having [조건] 
        where [조건] : group by 하기전에 조건을 가져옴.         , 별칭이름을 사용할 수 없다. 
        having [조건] : group by 해서 나온 결과에 대한 조건   , 별칭이름을 사용할 수 없다. 
        
        oder by 컬럼명 asc[desc]    :   별칭이름을 사용가능 

*/ 

-- 직급별로 월급의 합계, 평균, 최대값, 최소값, 그룹핑된수를 출력하되, 부서번호 20은 제외하고, 부서별로 평균이 2000이상인 내용만 출력 
        -- 평균을 desc 출력

select * from employee 
order by dno asc; 


-- 직책별로 월급의합계, 평균, 최대값,최소갑을 출력하되 20번 부서는 빼고 가져오되 
-- 월급의 평균이 2000 아상인 사용자 
select job 직급, count(job) , SUM(salary) 월의합계, Round (AVG(salary)) 평균, 
             MAX(salary) 최대값, MIN(salary) 최소값      
from employee 
where dno != 20        -- group by 전의 조건 
group by job 
having Round (AVG(salary)) >= 2000
order by 평균 desc; 


-- group by 절에서 컬럼이 2개 이상 ,   두 컬럼에 걸쳐서 동일한 내용을 그룹핑함. 
      -- job , dno 

select job , dno from employee
order by job asc ; 

select dno, job, sum (salary) 합한값, count(*)
from employee
group by job, dno 

-- 각 직책(job) 에 대해서 월급의 합계, 평균, 최대값, 최소값, 카운트수를 출력하되 입사일이 81년도 입사한 사원들만 적용
-- 월급의 평균이 1500만원 이상인 것만 출력 하되 평균을 내림차순 정렬 
select job 직책,  count(*) , sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대값, 
            min(salary) 최소값
from employee
where hiredate like '81%'
group by job
having round(avg(salary)) >= 1500
order by 평균 desc; 

select * from employee;

/*   group by 절에서 사용되는 키워드 
        rollup  : grouy by 커럼   <== 결과 마지막 라인에 전체 결과도 한번더 출력 
        cube     :  그룹핑 마지막 라인에 결과 출력, 마지막 라인에 전체 결과도 세부적으로 출력 
*/ 

-- 1. rollup , cube 키워드를 사용하지 않는 경우  :  그룹핑한 결과만 출력
    select dno, job, ename,salary 
    from employee
    order by dno asc , job asc; 
    
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by dno, job 
    order by count(*) desc ; 
    
    select dno , job
    from employee
    order by job asc

-- 2. rollup  키워드를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력 
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by rollup ( dno, job )
    order by count(*) desc ; 

-- 3. cube  키워드를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력, 세부 사항까지 출력 
    select dno, job , count(*), SUM(salary), round(avg(salary),2) , max(salary), min(salary) 
    from employee
    group by cube ( dno, job )
    order by count(*) desc ; 
    

-- 문제 : 
 select * from employee;
 
 -- 월급이 1500만원 이상인 사원이고 입사일이 81년 도에 입사안 사원에 대해서 [ where ] 
 -- 부서별 월급의 평균, 합계 , 최대값, 최소값, 카운트 출력하되 
 -- 평균이 1600 이상인 것만 출력 하세요. [group by 한 결과의 조건 : having]
 -- 평균을 내림 차순 정렬 
 
 select dno , round(AVG (salary),2) 평균 ,SUM(salary) 합계,  MAX(salary)최대값, 
        Min(salary)최소값, count(*)
 from employee
 where salary >=1500 and hiredate like '81%' 
 group by dno
 having round(AVG (salary),2) > 1600
 order by 평균 desc; 
 

/*
    SubQuery : select 문내의 select 쿼리 [ sub query ] , 여러번의 작업을 한 구문에서 처리 
            - where 절에서 많이 사용됨 
*/ 

-- ename [사원이름]  이 SCOTT인 사원의 직책과 같은 사원들을 출력  : 2 번 쿼리가 필요함. 

select * from employee; 
-- 1. SCOTT 사원의 직책을 알아오는 쿼리 
    select job, ename 
    from employee 
    where ename = 'SCOTT' 
    
-- 2. 알아온 직책을 조건으로 해서 이름을 출력 
select ename , job 
from employee
where job = 'ANALYST' ; 


-- SubQuery를 사용해서 하나의 쿼리로 처리함. 

select ename, job
from employee
where job = ( select job from employee where ename= 'SCOTT' ); 




select * from employee ; 


-- SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력 

    -- 1. scott의 직책을 출력하는 쿼리 
    -- 2. allen의 직책을 출력하는 쿼리 
    -- 3. where job not in ('scott의직책', 'allen 직책')

    -- 1. scott의 직책을 출력하는 쿼리
    select job from employee where ename = 'SCOTT';     -- ANALYST

    -- 2. allen의 직책을 출력하는 쿼리
    select job from employee where ename = 'ALLEN';      -- SALESMAN 
    
    --3. SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력 
    select ename , job 
    from employee
    where job not in ( 'ANALYST', 'SALESMAN'); 
    
    ---  SubQuery로 한 라인으로 출력 
    
    select ename , job 
    from employee
    where job not in ( 
        (select job from employee where ename = 'SCOTT'), 
        (select job from employee where ename = 'ALLEN')
        ); 
    
    select ename , job 
    from employee
    where job not in ( 
            select job from employee 
            where ename = 'SCOTT' or ename = 'ALLEN'     
        ); 
        
    select ename , job 
    from employee
    where job not in ( 
            select job from employee 
            where ename in ( 'SCOTT' , 'ALLEN' )     
        ); 

-- 단일 값       :    = 
-- 여러개의 값 :   in 
  
-- 'SCOTT' 보다 않은 월급을 받는 사원들 정보, 월급를 출력   

  select ename 사원, salary 월급 
  from employee
  where salary > ( select salary from employee where ename = 'SCOTT')
  
  
  select * from employee
  order by salary desc ; 
  
-- 최소 급여를 받는 사원정의 이름, 담당업무, 급여 출력 
select ename, job, salary 
from employee 
where salary = ( select MIN(salary) from employee ); 

-- subquery를 사용해서 출력 
-- 부서별(dno) 로 최소 급여를 받는 사원정보의 이름, 직책, 월급 을 출력   :    힌트 : group by , dno , min  , in 키워드 

select salary, dno , ename
from employee
order by dno asc , salary desc ; 

-- subquery

-- 각 부서별 최소 월급을 받는 사원들을 출력 
select ename 이름, job 직책, salary 월급 , dno 부서번호
from employee 
where salary in ( 
        -- 각 부서별 최소월급의 select 한 값을 출력 
        select min(salary) 
        from employee 
        group by dno  
    ); 

