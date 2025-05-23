/*
        JOIN : DataBase 에는 많은 테이블이 존재합니다.  모델링을 통해서 테이블이 분리 되어 있다. ( R-DBMS) 
        employee 테이블과 department 테이블은 하나의 테이블인데 모델링(1,2,3정규화), 을 통해서 테이블을 분리 
        모텔링 :  중복 제거, 성능향상
        
        제약 조건 : 테이블의 컬럼에 들어가는 키 , 데이터의 무결성 (결함없는데이터, 원하는 값만 ) 
            Primary Key :  
                  - 테이블의 컬럼에 1번만 넣을 수 있다.  
                  - 두개 컬럼을 묶어서 PK를 넣을 수 있다. 
                  - 테이블을 생성할때 반드시 PK 이 존재해야 한다.  - Update, Delete 구문에서 PK 컬럼을 where 조건으로 사용함. 
                  - 특정 컬럼에 중복 된 값을 넣지 못하도록 함. 
                  - 반드시 not null 컬럼이어야함.  null을 넣을 수 없다. 
                  - index 가 자동으로 생성 된다. 컬럼의 검색을 빠르게 함. 
                  - JOIN 시 ON 에서 많이 사용하는 키 컬럼. 
            Unique Key : 
                  - 컬럼에 중복된 값을 넣지 못하도록 함. 
                  - null을 넣을 수 있다. 단 1번만 넣을 수 있다.  not null, null 
                  - 하나의 테이블에 여러번 Unique Key 를 넣을 수 있다. 
                  - index 가 자동으로 생성됨.  JOIN 시 ON에 사용됨 
            Foreign Key : 
                  - 다른 테이블(부모 테이블) 의 특정 컬럼을 참조 해서 값을 넣도록 함. 
                  - Foreign Key 가 잠조하는 컬럼은 부모테이블의 Primary Key , Unique Key 를 참조함. 
             NOT NULL 
                   - 컬럼에 NULL을 넣을 수 없도록 하는 제약 조건 
             CHECK 
                    - 컬럼에 조건을 넣어서 내개 원하는 값만 넣을 수 있도록 함. 
                    -  월 컬럼에  1 ~ 12 까지 넣을 수 있도록 
             default  : 제약 조건은 아니지만 제약 조건처럼 사용됨 
                     -  컬럼에 값을 넣지 않으면 default 로 설정된 값이 등록됨. 
*/ 

-- Primary Key Test : 
create table test2 (
    id number(4) not null constraint pk_test2_id primary key,
    name varchar2(10) not null , 
    phone varchar2(50) null , 
    addr varchar2 (50) null
); 

insert into test2 (id, name,phone,addr)
values (2, '홍길동','010-1111-2222', '서울'); 

commit ;       -- 트랜잭션을 완료, RAM => HDD disk 에 영구히 저장 
rollback;      -- 트랜잭션을 완료, RAM 에 적용된것을 취소 

-- MySQL, MariaDB, MSSQL은 자동 커밋 트랜잭션이다. insert, update, delete  트랜잭션이 발생됨, log에 기록 

-- insert , update, delete 구문은 트랜잭션이 발생됨, 트랜잭션을 완료 해야함(commit, rollback) , 
select * from test1; 


select * from employee;               -- employee 테이블의 dno 컬럼은 참조한다 (Foreign Key ) 
                                                        -- department 테이블의 dno 컬럼을 참조한다. 
select * from department; 

// JOIN : 서로 다른 테이블을 연결해서 출력 , employee, department 테이블 원래 하나의 테이블 => 모델링 => 
// employee 테이블의 dno 컬럼이 department 테이블의 dno 컬럼을 참조 한다. 


-- 테이블 복사  : 원본 테이블의 제약 조건은 복사 되어 오지 않는다.  Alter Table 을 사용해서 제약 조건을 부여 

create table emp01 
as 
select * from employee; 

create table dept01
as 
select * from department; 


-- 실습 : 테이블 복사 ,  select 한 테이블의 정보를 새로운 테이블에 복사. 
--  기존 테이블의 정보를 분석 할때 사용 

create table my_tes1
as 
select eno, ename, job, salary
from employee
where dno = 10;

select * from my_tes1; 

create table my_test2
as 
select eno, ename, salary, commission
from employee
where dno=10; 

select * from my_test2;






/* 
        테이블의 제약 조건을 확인 하는 명령어 
        user_constraints   : 데이터 사전  <== 테이블의 각종 정보를 알려주는 테이블 
*/ 
select * from user_constraints ;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT') ; 

-- 테이블을 복사하면 테이블의 컬럼에 부여된 제약 조건은 복사 되어 오지 않는다.  컬럼과 값만 복사되어온다. 
-- alter table 을 사용해서 제약 조건을 부여해야 함.
-- alter table : 생성된 테이블을 수정 
select * from user_constraints
where table_name in ('EMP01', 'DEPT01') ; 

-- dept01 테이블에 dno컬럼에  Primary Key 제약 조건을 추가 
alter table dept01 
add constraint PK_DEPT01_DNO primary key (dno); 

-- emp01 테이블에 eno 컬럼에 Primary Key 제약 조건 추가 
alter table emp01 
add constraint PK_EMP01_ENO primary key (eno); 

-- emp01 테이블의 dno 컬럼에 Foreign Key 부여 , 참조(references)할 테이블의 컬럼은 Dept01 테이블의 dno 컬럼을 참조 
alter table emp01 
add constraint FK_EMP01_DNO foreign key (dno) references dept01(dno); 


select * from emp01; 
select * from dept01; 

-- Foreign Key : emp01 (dno)  referance dept01 (dno) 

insert into emp01 (eno, ename, job, manager,hiredate, salary, commission, dno)
values (8000, '홍길동', '관리자', 7788, '25/04/11', 4000, 400, 40) ; 

commit; 

select * from emp01







--  Primary Key 컬럼을 확인 : 
desc emp01 ; 

select * from emp01 ; 

-- 값을 넣을때 컬럼에 부여된 제약 조건을 잘 확인 하고 값을 insert
-- eno : Primary Key 가 등록, 중복된 값을 넣으면 안됨 
-- dno : Foreign Key 등록 ,  Dept01 테이블의 dno 컬럼에 존재하는 값만 넣어야 한다. 

insert into emp01 ( eno, ename, job, manager, hiredate, salary, commission, dno )
values ( 7977, 'PJW', 'CLERK', 7782 , '23/12/11', 1500 , null , 40 ); 

commit ;     -- DML ( insert, update, delete ) 에서 DB에 영구히 저장되도록 함.   <오라클> 

select * from emp01; 
select * from dept01; 

-- dept 테이블에 값 넣기  : dno 컬럼 : Primary key 가 있음. 
desc dept01 ; 

insert into dept01 ( dno, dname, loc)
values ( 50 , 'HR', 'SEOUL') ; 

commit ;     -- DML ( insert, update, delete) 에서 반드시 적용. 

select * from dept01; 

select * from emp01 ; 

-- JOIN : 여러 테이블의 컬럼을 출력 할때 JOIN을 사용해서 하나의 테이블 처럼 출력함. 
      -- 두 테이블의 공통 키 컬럼을 확인, 
      -- emp01, dept01 테이블의 공통 키 컬럼은 dno   이다. 
      -- EQUI JOIN : 오라클에서만 작동하는 JOIN 구문 
      -- ANSI JOIN :  모든 DBMS에서 공통으로 사용되는 JOIN 구문 
      
-- EQUI JOIN 구문으로 두 테이블 조인 
 -- from 절에서 JOIN 할 테이블을 명시 (,)
 -- 테이블 이름은 별칭이름으로 둠. 
 -- where 절에서 두 테이블의 공통 키 컬럼을 명시 
 -- and 절에서 조건을 처리 
 -- 공통 키 컬럼을 출력시 반드시 테이블명.컴럼명 
 
select e.eno, e.ename, e.job,d.dno , d.dname, d.loc 
from emp01 e , dept01 d 
where e.dno = d.dno

select eno, ename, job, d.dno , dname, loc 
from emp01 e , dept01 d 
where e.dno = d.dno
and d.dno = 10 ; 



-- ANSI JOIN : 모든 DBMS에서 공통으로 사용되는 JOIN 구문 
    -- INNER JOIN  : 두 테이블에서 키컬럼에 공통 되는 부분만 출력     <=== 80 % 
    -- OUTER JOIN : 
                 -- LEFT OUTER JOIN 
                 -- RIRGHT OUTER JOIN 
                 -- FULL OUTER JOIN 
    -- SELF JOIN 
    -- CLOSS JOIN 

-- INNER JOIN :  ANSI JOIN 
      -- from 절에 JOIN 테이블 이름을 명시 , 
      -- INNER 키는 생략 될 수 있다.   <===  80 % 이상 
      -- on 절에 두 테이블의 공통 키 컬럼을 명시 ,  두 테이블의 공통인 것만 출력  
      -- where 절에서 조건 처리

-- 테이블 이름을 alias (별칭)  시키지 않는 경우 

select * from employee; 
select * from department; 

-- 조인 : 서로 다른 두 테이블을 연결해서 출력
--       두 테이블을 조인시 반드시 on 절이 필요, 
--           on 절은 두 테이블을 연결 해주는 컬럼, 
--            Foreign key => Primary key, Uique
--       테이블의 별칭 이름을 사용함. 

-- 테이블 별칭을 사용해서 JOIN 
select * 
from employee e 
     join department d
    on e.dno = d.dno ; 
 
-- 테이블 별칭을 사용하지 않고 JOIN    
select * 
from employee  
     join department 
    on employee.dno = department.dno ;


-- 'SMITH' 사원의 부서명과 부서 위치정보를 출력 
-- 'SMITH' dno <== employee 
-- dno , 부서명, 부서위치 <== department 

-- INNER JOIN : INNER 키워드는 생략 가능 , 90 % 사용 
--      두 테이블의 교집합을 출력 
select ename , dname, loc 
from employee e
    join department d
    on e.dno = d.dno 
where ename = 'SMITH'; 

-- select 절에 두 테블의 키 컬럼을 명시할때 오류 발생, 테이블명.컴럼명으로 명시해야함.
-- dno 컬럼은  employee, department 에 존재하므로 테이블명.컴럼명으로 명시해야함
select e.dno, ename, dname,loc
from employee e
    join department d
    on e.dno = d.dno 
where ename = 'SMITH' ; 


-- 월급이 2000만원 이상인 사원의 사원번호, 부서번호, 부서명, 월급을 출력하되 
-- 월급이 많은순으로 출력 하세요. 

select eno, e.dno,d.dno, dname, salary
from employee e
    join department d
    on e.dno = d.dno
where salary >= 2000
order by salary desc; 







select eno, ename, salary,dept01.dno, dname, loc 
from emp01  INNER JOIN dept01 
on emp01.dno = dept01.dno 

-- 테이블 이름을 alias (별칭)  사용한 경우 
select eno, ename, salary, d.dno, dname, loc 
from emp01 e  JOIN dept01 d 
on e.dno = d.dno 
where  e.dno = 20 
order by ename desc ; 

-- INNER JOIN : ANSI SQL : 모든 DBMS에서 공통으로 사용되는 SQL 퀄리 ( Oracle, MySQL, MSSQL, DB2, .....)  
           -- ON 절에 두 테이블의 공통분모만 출력 
select * 
from emp01 e JOIN dept01 d
on e.dno = d.dno 

-- OUTER JOIN : 
    -- LEFT OUTER JOIN     : 왼쪽 테이블의 모든 내용을 출력함. 
    -- RIGHT OUTER JOIN   : 오른쪽 테이블의 모든 내용을 출력함. 
    -- FULL OUTER JOIN     : 왼쪽, 오른쪽 테이블의 모든 내용을 출력함. 

select * from dept01; 

insert into dept01 (dno , dname, loc) 
values ( 60 , 'MANAGE', 'PUSAN'); 

commit ; 


-- 가끔 사용 함. 
-- RIGHT OUTER JOIN : 두 테이블의 공통 부분과 오른쪽 (dept01) 테이블의 모든 값을 출력 
select * 
from emp01 e  RIGHT OUTER JOIN dept01 d 
on e.dno = d.dno 

-- FULL OUTER JOIN : 두 테이블(왼쪽, 오른쪽)의 모든 내용을 출력 
select * 
from emp01 e FULL OUTER JOIN dept01 d
on e.dno = d.dno ; 

-- SELF JOIN : 자신의 테이블을 JOIN, 자시의 테이블을 별칭이름으로 가상으로 생성해서 JOIN 
    -- 조직도 출력, 직급 상사를 바로 출력 할때 사용됨 
    
select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명  
from  emp01 e  JOIN emp01 m 
on e.manager = m.eno ; 


-- SELF JOIN으로 사원이름에대한 직속 상관이 누구인지 출력 
-- 직속상관이 없는 사원을 출력 : LEFT OUTER JOIN 
select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명  
from  emp01 e  LEFT OUTER JOIN emp01 m 
on e.manager = m.eno ;

-- 사원번호는 있지만 어떤 사원의 상관이 아닌 사원도 모두 출력 해라 : RIGHT OUTER JOIN 
select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명  
from  emp01 e  RIGHT OUTER JOIN emp01 m 
on e.manager = m.eno ;


-- 직속 상관이 없는것 (왼쪽), 사원번호는 가지지만 어떤사원의 직속 상관이 아닌 사원(오른쪽) : FULL OUTER JOIN 
select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명  
from  emp01 e FULL OUTER JOIN emp01 m 
on e.manager = m.eno ;




select eno , ename , manager,  eno, ename
from employee; 

--1. 사원이름 'SCOTT' 의 부서명(dname), 부서위치(loc)    <=== ename : 'SCOTT'은 emp01,   dept01 : dname, loc
-- ANSI JOIN    
select * from emp01 ; 
select * from dept01; 

-- emp01 , dept01 을 JOIN 해서 출력 
select ename, dname,loc ,e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where ename = 'SCOTT'; 


--2. 월급이 2000만원 이상인 사원의 이름, 월급, 부서명, 부서위치, 을 출력 : ANSI JOIN 

select ename, salary, dname, loc , e.dno
from emp01 e JOIN dept01 d
on e.dno = d.dno 
where salary >= 2000 
order by d.dno desc; 

-- ANSI JOIN 
--3 .   직책(job) 이 'MANAGER' 인 사원이름(ename), 부서번호(dno), 부서명(dname), 부서위치(loc) 출력하되 사원이름 내림차순 정렬   
select job 직책, ename 사원이름, e.dno 부서번호, dname 부서명, loc 부서위치
from emp01 e JOIN dept01 d 
on e.dno = d.dno
where job = 'MANAGER'; 


-- VIEW ( 뷰 ) :  가상의 테이블 ,  값은 가지지 않고, 코드 만 가진다. 
    -- 1. 실제 테이블의 특정 컬럼만 출력 할때 <== 보안 
    -- 2. 복잡한 쿼리를 한번 만들어서 실행  <== 복잡한 JOIN 쿼리를 단순화 할 수 있다. 

-- view 를 실습하기위한 샘플테이블 : emp02 
drop table EMP02 cascade constraints ; 

create table EMP02 
as 
select eno, ename , salary , commission, job, hiredate , dno 
from employee 
where salary > 1500; 


select * from emp02; 

create table dept02 
as 
select * from department; 

-- 기존의 원본테이블 : employee, department ===> emp01, dept01 
    -- 필드명, 값 만 복사됨 
    -- 컬럼에 부여된 제약 조건을 복사되지 않음. <== Alter Table 을 사용해서 제약 조건 추가 
    
    select * from user_constraints where table_name in ('EMPLOYEE', 'DEPARTMENT'); 
    select * from user_constraints where table_name in ('EMP02', 'DEPT02'); 

--1.  DEPT02 테이블의 dno (Primary Key) 
--2. EMP02 테이블의 eno (Primary Key), dno (FK) ==> dept02(dno) 

alter table DEPT02 
add constraints PK_DEPT02_DNO primary key (dno) ; 

alter table EMP02
add constraints PK_EMP02_ENO primary key (eno); 

alter table EMP02 
add constraints FK_EMP02_DNO foreign key (dno) references dept02(dno); 


-- VIEW 생성  1. 실제 테이블의 중요 정보를 감추고 출력 , 보안을 향상할 수 있다. 
        -- as 다음에 select 코드를 가지고 있음. 

select * from emp02 ;   -- 실제 테이블 : emp02 


-- 뷰 생성 : 실제 테이블의 값을 가지는 것이 아니라 실행 코드만 가진다. 
create view v_emp02
as 
select ename, job, dno 
from emp02 ; 

-- 뷰 실행 : 
select 컴럼명 from 테이블명[뷰명]

select * from v_emp02; 

-- 데이터 사전 : user_테이블     <== 시스템의 정보을 저장되어있는 테이블 

select * from user_views; 

-- 2. 사용의 편의성 , 복잡한 구문을 view를 생성해서 저장시켜 두고 실행, <== JOIN 

-- 두 테이블을 조인해서 월급이 2500 이상인 사원 정보를 출력 
create view v_join 
as 
select ename, job, salary, dname, loc 
from emp02 e 
    join dept02 d 
        on e.dno = d.dno
where salary >= 2500 ; 


select * from v_join ; 

-- employee, department 테이블의 부서별로 최소 월급을 받는 사원이름, 사원의 직책, 부서명, 부서위치 를 출력되 최소월급이 900이상 
    -- 사원 정보를 출력 , 부서번호 20번은 제외하고 
    -- 뷰안에 쿼리를 저장하고 뷰를 실행해서 출력          <== JOIN, group by, where, having , subquery 
   
-- 부서별로 최소 월급을 받는 사원 정보를 출력하는 view , 20 부서는 제외됨     
create view v_join2 
as 
select ename 사원이름, job 직책, dname 부서명, loc 부서위치, d.dno 부서번호
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- 부서별로 최소 월급 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
) 

-- 뷰 실행 
select * from v_join2;

-- view 에 정렬 컬럼 까지 적용됨 
create view v_join3 
as 
select ename 사원이름, job 직책, dname 부서명, loc 부서위치, d.dno 부서번호
from employee e 
    join department d 
        on e.dno  = d.dno 
where salary in (
    -- 부서별로 최소 월급 
    select min(salary) from employee 
    where dno <> 20 
    group by dno 
    having min(salary) > 900 
) 
order by ename desc


select * from v_join3

-- view 에 as 블락에 select 문이 옴 
    -- 실제 값을 가지고 있지 않음. select 코드만 들어 있음. 
    -- 실제 테이블의 컬럼에 잘 매칭 될경우 
    -- insert, update, delete를 view 통해서 할 수 있다. 단 실제 테이블에 각 컬럼의 제약 조건에 맞을때 가능 

select * from emp02 ; 

-- view 생성
drop view v_test01 ; 

create view v_test01 
as 
select eno, ename , dno 
from emp02;  

-- view 실행 
select * from v_test01; 

--view 에 값을 넣을 수 있다 ==> 실제 테이블에 값이 들어감. 
insert into v_test01 (eno, ename, dno) 
values ( 8080, 'HONG', 30); 

commit; 

-- view 를 사용해서 값을 수정 : update   <== where 조건을 반드시 사용해야하고 컬럼명은 Primary Key 가 들어가 컬럼 
update v_test01 
set ename = 'KIM'
where eno = 8080 ; 

commit ; 

-- view 를 사용해서 값을 삭제 : delete   <== where 조건을 반드시 사용해야하고 컬럼명은 Primary Key 가 들어가 컬럼 

delete v_test01 
where eno = 8080 ; 

commit ; 


select * from emp02 

-- v_test02 : insert (안됨) , update (가능), delete( 가능) ==> 실제 테이블의 제약 조건에 잘 맞아야 한다. 
create view v_test02 
as 
select eno, ename, salary
from emp02 ; 

insert into v_test02 (eno, ename , salary) 
values ( 9090 , 'SIM', 3500); 

-- 테이블의 특정 컬럼에 not null  제약 조건 추가 
alter table emp02 
modify dno NOT NULL ; 

delete v_test02
where eno = 9090; 
commit; 
