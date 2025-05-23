
-- 한줄 주석 
/* 
 여러줄 주석 
*/ 


-- HR 계정을 생성 
/*
   은행망, 정부기관, 항공업체 <== 미션 크리티컬 한 환경, 비용이 비싸다.  
   Oracle XE Edtion            : 무료, 하나의 DataBase만 제공, xe  <-- SID(DataBase) 
   Oracle Standard Edtion      : 여러개의 DB를 생성 할 수 있다. 중규모
   Oracle Enterprise Edtion    : 대규모, 클러스터링,
*/ 

-- 테이블 스페이스 : 하나의 DB를 여러 계정이 공간을 분할해서 사용  
-- SYSTEM 계정은 Oracle 의 최고 관리자 계정, Orale 관리를 위한 많은 테이블을 가지고 있다. 
--    계정을 생성할 수 있다. 

select * from help; 
select * from redo_log; 

-- SQL의 주석 : 한줄 주석 
/*
    여러줄 주석 
*/

/*
    일반 계정을 생성후 일반 계정으로 접속  : 계정 생성, 권한 부여 
*/
-- system 계정으로 접속한 쿼리창에서만 계정을 생성 할 수 있다. 

-- 1. HR 계정을 생성 :  Oracle 12 버젼 이상 부터 계정 생성시 C##계정명
       -- 계정명 : HR   암호 : 1234 
/* 인증(Authentication) : 접속 할 계정을 생성, Credentional(ID + Password) 을 확인  */ 
create user C##Cafe_Website identified by 1234
default tablespace USERS
temporary tablespace TEMP; 

/* 허가 (Authorization): 인증된 사용자가 Oracle DB에서 사용 할 수 있는 권한 부여   */
-- 2. 계정에 권한을 부여하기 : connect : 접속 , resource : 객체 생성, 수정, 삭제   
grant resource, connect to C##Cafe_Website; 
grant create view to C##Cafe_Website ; 

--3. 테이블 스페이스에서 사용량 할당. 
alter user C##Cafe_Website quota unlimited on USERS; 


--4. 계정 삭제 
drop user C##HR2 cascade 
