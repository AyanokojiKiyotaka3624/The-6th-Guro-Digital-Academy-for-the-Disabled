 -- 한줄 주석 : 주석 뒤에 반드시 공백 필요
  /*
여러줄 주석
  */
  
	-- MySQL Server 에 존재하는 데이터 베이스 확인
show databases ;
   
	-- DataBass 생성 (테이블, 뷰. 계정, 인덱스, 저장프로시져, 함수, 트리거)
create database MyDB ;
    
    -- DataBass 삭제
drop database MyDB ;

	-- DataBass 접속[사용] , 해당 DataBase 의 테이블을 볼려면 DB에 접속
use MyDB ;
use sakila ; -- MySQL 예제 DB

	-- 테이블의 정보 확인 하기 <== 반드시 해당 DB에 접속후
show tables ;

	-- 테이블의 레코드[값을] 출력 , address 테이블의 정보를 출력
select * from address ;

/*
 용어 정리
	- DataBase : SQL Server 하위의 객체 ,
				테이블, 인덱스, 뷰, 저장프로시져, 함수, 트리거, 계정 을 포함
	- 테이블 : 실제 데이터가 저장 되어있는 객체 , 
    - 컬럼[필드] : 테이블에서 열을 컬럼 또는 필드 라고 호칭 , city, name
    - 레코드 : 모든 컬럼에 한라인으로 들어간 값을 레코드 라고 호칭
			 행으로 들어간 한라인의 값
	- 인덱스 : 테이블에 컬럼에 부여되는 객체, 컬럼의 검색을 빠르게 하기 위해 생성
	- 뷰 : 1. 테이블의 특정 컬럼을 숨길수 있다. [ 보안 ]
			2. 복잡한 조인 구문을 단순하게 처리 함. [ 효율성 ]

*/

 -- 자신의 DB에 접속
use MyDB ;
show tables ;

 -- 테이블 생성 [ 회원테이블 생성 ]
 -- null : 비어있는 상태
 -- not null : 반드시 값이 입력이 되어야 한다.
create table member (
id int not null,
name varchar(50) not null ,
phone varchar(50) null ,
addr varchar(100) null
) ;

 -- 테이블의 정보를 출력
desc member ;
 
 -- 테이블의 값을 출력
select * from member ;
 
 -- 테이블의 값을 입력 : insert <== 컬렴명을 명시후 저장 
insert into member ( id, name, phone, addr )
values ( 1, '홍길동', '010-1111-2222', '사용' );

insert into member ( id, name )
values ( 2, '감강참' );

 -- 오류 발생 : id, name 컬럼은 반드시 값이 들어가야 한다.
insert into member ( id, phone )
values ( 3, '010-2222-3333' ) ;

 -- 위의 오류 수정
insert into member ( id, phone, name )
values (4, '010-3333-4444', '세종대왕');

 -- 테이블 삭제 : drop table member ;
drop table member ;



