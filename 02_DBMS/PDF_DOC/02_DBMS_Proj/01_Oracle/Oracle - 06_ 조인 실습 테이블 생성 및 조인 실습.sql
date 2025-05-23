
create table zipcode10 (
        zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE Primary key, 
        si_do varchar2(200) not null, 
        gu_gun varchar2(200) not null, 
        bungi varchar2(200) not null
) ; 

create table member10 (
        m_id number(4) not null constraint PK_MEMBER10_M_ID primary key, 
        pass varchar2(200) not null , 
        name varchar2(200) not null, 
        email varchar2(200) not null , 
        zipcode number(6) null , 
        -- Foreign Key 제약 조건 추가함. : member10(zipcode)  ===> zipcode10(zipcode) 
            constraint FK_MEMBER10_ZIPCODE foreign key (zipcode) references ZIPCODE10(zipcode) 
); 

create table product10 (
        pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key , 
        pro_name varchar2(200) not null, 
        pro_price number(7,2) not null , 
        pro_cnt number(4) default 0 not null 
);

create table order10 (
    ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key, 
    m_id  number(4) not null,      -- FK  : MEMBER10(m_id)
    pro_id number(6) not null,    -- FK  : PRODUCT10 (pro_id) 
        -- Foreign Key 2개 
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)   
);

 

INSERT INTO zipcode10 (zipcode, si_do, gu_gun, bungi) VALUES 
(100001, 'Seoul', 'Jongno-gu', '1-1'); 
INSERT INTO zipcode10 (zipcode, si_do, gu_gun, bungi) VALUES
(100002, 'Seoul', 'Gangnam-gu', '2-2');
INSERT INTO zipcode10 (zipcode, si_do, gu_gun, bungi) VALUES
(100003, 'Busan', 'Haeundae-gu', '3-3');
INSERT INTO zipcode10 (zipcode, si_do, gu_gun, bungi) VALUES
(100004, 'Incheon', 'Namdong-gu', '4-4');
INSERT INTO zipcode10 (zipcode, si_do, gu_gun, bungi) VALUES
(100005, 'Daegu', 'Suseong-gu', '5-5');


INSERT INTO member10 (m_id, pass, name, email, zipcode) VALUES 
(1001, 'pass123', 'Alice', 'alice@example.com', 100001);
INSERT INTO member10 (m_id, pass, name, email, zipcode) VALUES 
(1002, 'pass234', 'Bob', 'bob@example.com', 100002);
INSERT INTO member10 (m_id, pass, name, email, zipcode) VALUES 
(1003, 'pass345', 'Charlie', 'charlie@example.com', 100003);
INSERT INTO member10 (m_id, pass, name, email, zipcode) VALUES 
(1004, 'pass456', 'David', 'david@example.com', 100004);
INSERT INTO member10 (m_id, pass, name, email, zipcode) VALUES 
(1005, 'pass567', 'Eva', 'eva@example.com', 100005);


INSERT INTO product10 (pro_id, pro_name, pro_price, pro_cnt) VALUES 
(200001, 'Keyboard', 45.99, 10);
INSERT INTO product10 (pro_id, pro_name, pro_price, pro_cnt) VALUES 
(200002, 'Mouse', 19.99, 25);
INSERT INTO product10 (pro_id, pro_name, pro_price, pro_cnt) VALUES 
(200003, 'Monitor', 199.99, 5);
INSERT INTO product10 (pro_id, pro_name, pro_price, pro_cnt) VALUES 
(200004, 'Webcam', 89.99, 8);
INSERT INTO product10 (pro_id, pro_name, pro_price, pro_cnt) VALUES 
(200005, 'Headset', 59.99, 12);


INSERT INTO order10 (ord_id, m_id, pro_id) VALUES 
(300001, 1001, 200001); 
INSERT INTO order10 (ord_id, m_id, pro_id) VALUES
(300002, 1002, 200002);
INSERT INTO order10 (ord_id, m_id, pro_id) VALUES
(300003, 1003, 200005);
INSERT INTO order10 (ord_id, m_id, pro_id) VALUES
(300004, 1004, 200004);
INSERT INTO order10 (ord_id, m_id, pro_id) VALUES
(300005, 1002, 200005);

commit; 


select * from zipcode10; 
select * from member10; 
select * from product10; 
select * from order10; 

-- delete 테이블명 : 테이블의 모든 레코드를 삭제 , 삭제후 commit; (insert, update, delete)  
-- drop table 테이블명 : 테이블을 삭제
delete order10; 
delete product10; 
delete member10; 
delete zipcode10; 
rollback; 
commit; 


-- ========Join 실습 ==============================================

-- 각 멤버의 주소를 출력 하세요. 
select * from member10 ; 
select * from zipcode10 ; 

select * 
from member10 m
    join zipcode10 z 
    on m.zipcode = z.zipcode ; 
    
--  멤버의  이름,이메일주소, 우편번호, 시도, 구군을 출력하세요
select name, email, m.zipcode,si_do, gu_gun
from member10 m
    join zipcode10 z
    on m.zipcode = z.zipcode ; 

-- Alice가 구매한 물품명, 가격, 이름, 메일주소, 시도, 구군 정보를 출력하세요.(테이블 4개 조인) 
-- seoul, jongno-gu 에 산다. 
-- Keyboard , 45.99 

select * from member10;     -- 회원 정보
select * from zipcode10;    -- 주소 정보
select * from order10;      -- 주문 정보 
select * from product10;    -- 제품 정보

select pro_name 물품명, pro_price 가격, name 이름, email 메일주소, si_do 시도, gu_gun 구군
from member10 m
    join zipcode10 z
        on m.zipcode = z.zipcode
    join order10 o
        on m.m_id = o.m_id
    join product10 p
        on o.pro_id = p.pro_id
where name= 'Alice' ;

-- bob 이 구매한 물품명, 가격, 이름, 메일주소, 시도, 구군 까지만 출력 
select pro_name, pro_price, name, email, si_do, gu_gun
from member10 m
    join zipcode10 z
        on m.zipcode = z.zipcode
    join order10 o 
        on m.m_id = o.m_id 
    join product10 p
        on o.pro_id = p.pro_id 
where name = 'Bob'; 
-- Inner Join : 두 테이블의 교집합 
-- Outer Join : 두 테이블의 합집합 

-- Outer Join : Left Outer Join , Right Outer Join , Full Outer Join 
-- 물품을 구매한 적이 없는 사용자를 출력 할때 사용 , 왼쪽 테이블의 내용은 모두 출력 해라. 

-- Inner Join : 주문한 적이 있는  사용자 정보를 출력 
select * 
from member10 m
    join order10 o
        on m.m_id = o.m_id ; 

-- Left Outer Join : 주문한 적이 없는  사용자 정보를 출력, 왼쪽 테이블의 내용을 모두 출력 
-- order 테이블의 NULL이 들어간 사용자가 주문한 정보가 없는 사용자. 
select * 
from member10 m
   left Outer join order10 o 
        on m.m_id = o.m_id


-- Right Outer Join : 구매한 적이 없는 물품 정보를 출력 
select * 
from order10 o 
  right outer join product10 p 
    on o.pro_id = p.pro_id








