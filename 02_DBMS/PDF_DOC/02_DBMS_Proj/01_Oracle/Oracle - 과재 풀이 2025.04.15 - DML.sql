

-- 부서 테이블
CREATE TABLE DEPARTMENTS (
    DEPT_ID     NUMBER PRIMARY KEY,
    DEPT_NAME   VARCHAR2(50)
);

-- 사원 테이블
CREATE TABLE EMPLOYEES (
    EMP_ID      NUMBER PRIMARY KEY,
    EMP_NAME    VARCHAR2(50),
    SALARY      NUMBER,
    DEPT_ID     NUMBER,
    HIRE_DATE   DATE,
    CONSTRAINT fk_dept FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);

-- 프로젝트 테이블
CREATE TABLE PROJECTS (
    PROJ_ID     NUMBER PRIMARY KEY,
    PROJ_NAME   VARCHAR2(100),
    EMP_ID      NUMBER,
    START_DATE  DATE,
    CONSTRAINT fk_proj_emp FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID)
);



-- DEPARTMENTS
INSERT INTO DEPARTMENTS VALUES (10, '개발팀');
INSERT INTO DEPARTMENTS VALUES (20, '영업팀');
INSERT INTO DEPARTMENTS VALUES (30, '디자인팀');

-- EMPLOYEES
INSERT INTO EMPLOYEES VALUES (1001, '김철수', 3500000, 10, TO_DATE('2020-01-10', 'YYYY-MM-DD'));
INSERT INTO EMPLOYEES VALUES (1002, '이영희', 4000000, 10, TO_DATE('2019-03-12', 'YYYY-MM-DD'));
INSERT INTO EMPLOYEES VALUES (1003, '박지민', 2800000, 20, TO_DATE('2021-06-01', 'YYYY-MM-DD'));
INSERT INTO EMPLOYEES VALUES (1004, '정국', 5000000, 30, TO_DATE('2018-09-21', 'YYYY-MM-DD'));
INSERT INTO EMPLOYEES VALUES (1005, '최유리', 3200000, 20, TO_DATE('2022-02-14', 'YYYY-MM-DD'));

-- PROJECTS
INSERT INTO PROJECTS VALUES (2001, '홈페이지 리뉴얼', 1001, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO PROJECTS VALUES (2002, '고객관리 시스템', 1002, TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO PROJECTS VALUES (2003, '신제품 마케팅', 1003, TO_DATE('2023-05-10', 'YYYY-MM-DD'));
INSERT INTO PROJECTS VALUES (2004, '브랜드 리디자인', 1004, TO_DATE('2022-11-05', 'YYYY-MM-DD'));
INSERT INTO PROJECTS VALUES (2005, '데이터 분석 시스템', 1005, TO_DATE('2023-07-01', 'YYYY-MM-DD'));

/*

 INSERT 관련
1.	새로운 부서 기획팀(DEPT_ID=40)을 추가하세요.
2.	사원 김민수(EMP_ID=1006)를 기획팀에 추가하세요. (급여 300만원, 입사일: 2024-01-01)
3.	프로젝트 사내 교육 시스템(PROJ_ID=2006)을 김민수에게 배정하세요.
4.	새로운 사원 고유정(1007)을 영업팀에, 급여 310만원으로 추가하세요.
5.	정우성(1008)을 부서 없이 등록해보세요. (DEPT_ID를 NULL로)

 UPDATE 관련
6.	김철수의 급여를 380만원으로 수정하세요.
7.	박지민의 부서를 디자인팀으로 변경하세요.
8.	홈페이지 리뉴얼 프로젝트를 정국에게 재배정하세요.
9.	최유리의 이름을 최윤아로 변경하세요.
10.	모든 영업팀 직원의 급여를 10% 인상하세요.

DELETE 관련
11.	급여가 300만원 이하인 사원을 삭제하세요.
12.	기획팀의 부서를 삭제하려면 어떤 제약 조건을 고려해야 하나요? 삭제를 시도해보세요.
13.	사원 번호가 1008인 사람을 삭제하세요.
14.	김민수의 프로젝트를 삭제하세요.
15.	부서가 없는 사원을 모두 삭제하세요.

*/

/*
select * from departments;
select * from employees; 
select * from projects;

-- 각 사원이 포함된 부서정보를 출력 하세요. (JOIN) , (employees , departments)
select * 
from employees e
    join departments d
        on e.dept_id = d.dept_id

select emp_name,dept_name, e.dept_id 
from employees e
    join departments d
        on e.dept_id = d.dept_id     

-- 각 사원이 담당하는 프로잭트를 출력 하세요. (JOIN) , (employees, projects) 
select * 
from employees e
    join projects p
        on e.emp_id = p.emp_id; 

select e.emp_id , emp_name, proj_name 
from employees e
    join projects p
        on e.emp_id = p.emp_id; 
        

        


=========================문제 풀이=================================
 INSERT 관련
1.	새로운 부서 기획팀(DEPT_ID=40)을 추가하세요.

insert into departments (dept_id, dept_name)
values (40, '기획팀');

select * from departments;

commit;


2.	사원 김민수(EMP_ID=1006)를 기획팀에 추가하세요. (급여 300만원, 입사일: 2024-01-01)

insert into employees (emp_id, emp_name, salary, dept_id, hire_date)
values (1006, '김민수', 3000000, (select dept_id from departments
    where dept_name = '기획팀'), to_date('24/01/01', 'YYYY-MM-DD')
);

select * from employees;

commit;


3.	프로젝트 사내 교육 시스템(PROJ_ID=2006)을 김민수에게 배정하세요.

insert into projects (proj_id, proj_name, emp_id, start_date)
values (2006, '프로젝트 사내 교육 시스템', (select emp_id from employees
where emp_name = '김민수'), sysdate);

select * from projects;

commit;

rollback; 


4.	새로운 사원 고유정(1007)을 영업팀에, 급여 310만원으로 추가하세요.

insert into employees (emp_id, emp_name, salary, dept_id, hire_date)
values (1007, '고유정', 3100000, (select dept_id from departments
where dept_name = '영업팀'), sysdate);

select * from employees;

commit;


5.	정우성(1008)을 부서 없이 등록해보세요. (DEPT_ID를 NULL로)

insert into employees (emp_id, emp_name, salary, dept_id, hire_date)
values (1008, '정우성', null, null, sysdate);

select * from employees;

commit;



 UPDATE 관련
6.	김철수의 급여를 380만원으로 수정하세요.

update employees
set salary = 3800000
    where emp_name = '김철수';

select * from employees;

commit;


7.	박지민의 부서를 디자인팀으로 변경하세요.

select * from employees;
select * from departments;

select emp_name,dept_name 
from employees e
    join departments d
        on e.dept_id = d.dept_id
where emp_name='박지민'; 
      

update employees
set dept_id = (select dept_id from departments
where dept_name = '디자인팀')
    where emp_name = '박지민';
    
commit;



8.	홈페이지 리뉴얼 프로젝트를 정국에게 재배정하세요.

select * from projects;
select * from employees;

update projects
set emp_id = (select emp_id from employees
where emp_name = '정국')
    where proj_name = '홈페이지 리뉴얼';
    
commit;



9.	최유리의 이름을 최윤아로 변경하세요.

select * from employees;

update employees
set emp_name = '최윤아'
    where emp_name = '최유리';
    
commit;


10.	모든 영업팀 직원의 급여를 10% 인상하세요.

select * from departments;
select * from employees;
select * from projects;


update employees
set salary = salary * 1.1
    where dept_id = (select dept_id from departments
where dept_name = '영업팀');

commit;



DELETE 관련
11.	급여가 300만원 이하인 사원을 삭제하세요.

select * from departments;
select * from employees;
select * from projects;

-- projects 가 employee 를 참조 하므로 삭제 오류 발생 
DELETE FROM employees; 
where salary <=3000000 ; 

-- 참조 되는 projects 테이블의 값을 먼저 삭제
DELETE FROM projects
WHERE emp_id IN (
    SELECT emp_id FROM employees WHERE salary <= 3000000
);

delete from employees
where salary <= 3000000;

select * from employees;

commit;



12.	기획팀의 부서를 삭제하려면 어떤 제약 조건을 고려해야 하나요? 삭제를 시도해보세요.
select * from departments;
select * from employees;
select * from projects;

update employees
set dept_id = 40 
where emp_name='정우성' 

-- employees 의 dept_id 가 departments 테이블의 dept_id 을 참조 하므로 참조하는 레코드 먼저 삭제함
DELETE FROM employees
WHERE dept_id = 40;

delete from departments
where dept_name = '기획팀';

commit;


13.	사원 번호가 1008인 사람을 삭제하세요.

select * from departments;
select * from employees;
select * from projects;


delete from employees
where emp_id = 1008;

select * from employees;

commit;



14.	최유아의 프로젝트를 삭제하세요.

select * from departments;
select * from employees;
select * from projects;

select * 
from employees e
    join projects p
        on e.emp_id = p.emp_id
where emp_name='최윤아'; 

update projects p
set emp_id = null 
where proj_name='데이터 분석 시스템'; 

delete projects 
where proj_name='데이터 분석 시스템'; 


delete from projects
where emp_id = (select emp_id from employees
where emp_name = '김민수');

commit;



15.	부서가 없는 사원을 모두 삭제하세요.

delete from employees
where dept_id is null;

commit;

select * from employees; 
select * from departments;
select * from projects; 

-- 테이블 3개 조인해서 출력 ( employees, departments, projects ) 
emp_id, dept_id, emp_name, dept_name, proj_name 을 출력 (3개의 테이블에 존재하는 컬럼) 

select e.emp_id, d.dept_id, emp_name, dept_name, proj_name
from employees e 
    join departments d
        on e.dept_id = d.dept_id 
    join projects p 
        on e.emp_id = p.emp_id ; 
        

-- VIEW : 가상의 테이블을 VIEW , 실제 테이블의 특정 컬럼이나 복잡한 조인 쿼리를 가상으로 생성된 테이블 
/*
    VIEW를 사용하는 목적 : 2가지  
        1. 보안 : 실제 테이블의 특정 컬럼만 VIEW로 만들어서 사용 (예) 고객정보 <== 패스워드, 주민번호.
                영업에 필요한 특정 컬럼만  VIEW를 생성해서 사용하도록 함. 
        2. 복잡한 쿼리를 단순화 할때 사용 :
            복잡한 조인 구문을 VIEW를 생성해서 사용 
            
    1. VIEW를 생성 : 
        create view 뷰명
        as 
        select emp_id, emp_name from employee; 
        
    2. VIEW를 사용 : 테이블 처럼 Select 문으로 사용 
        select * from 테이블명[뷰명]       
        
*/

1. VIEW 생성  [보안을위한 사용] 

create view v_emp 
as 
select emp_id, emp_name,hire_date from employees; 

2. VIEW 사용 

select * from v_emp; 

3. VIEW 생성 [ 복잡한 조인 구분을 VIEW 저장] 

create view v_3join
as 
select e.emp_id, d.dept_id, emp_name, dept_name, proj_name
from employees e 
    join departments d
        on e.dept_id = d.dept_id 
    join projects p 
        on e.emp_id = p.emp_id ;

4. view 사용 
select * from v_3join ; 


select * from employee; 

-- 부서별로 월급의 합계, 평균, 최대값, 초소값 을 자주 쿼리한다. <= 뷰에 저장하고 출력. 
-- 월급이 많은 순으로 출력  : group by dno 

create view v_grouby_dno
as 
select dno 부서번호, SUM(salary) 합계, round(AVG(salary),2) 평균, 
    MAX(salary) 최대값, MIN(salary) 최소값, count(*) 그룹핑된수
from employee
group by dno 
order by SUM(salary) desc; 

-- 뷰 실행 
select * from v_grouby_dno; 










참고: 

-- 부모 테이블
CREATE TABLE departments (
  dept_id     NUMBER PRIMARY KEY,
  dept_name   VARCHAR2(50)
);

--자식테이블
CREATE TABLE employees (
  emp_id    NUMBER PRIMARY KEY,
  emp_name  VARCHAR2(50),
  dept_id   NUMBER,
  CONSTRAINT fk_dept
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
    ON DELETE CASCADE
);




-- 사원 3명이 부서 10번에 소속되어 있다고 가정

DELETE FROM departments WHERE dept_id = 10;

-- 결과:
-- → departments에서 10번 부서가 삭제됨
-- → employees에서 dept_id가 10인 사원들도 자동 삭제됨



#### 이미 만들어진 테이블 에 적용하는 방법

1. 기존의 제약 조건 제거
ALTER TABLE employees DROP CONSTRAINT fk_dept;

2. 기존 테이블의 제약 조건 추가
ALTER TABLE employees
    ADD CONSTRAINT fk_dept
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE CASCADE;






*/

