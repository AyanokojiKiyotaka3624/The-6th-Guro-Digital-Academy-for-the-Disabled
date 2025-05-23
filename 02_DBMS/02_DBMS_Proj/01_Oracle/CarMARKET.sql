drop table car1;
drop table customers;
drop table sales;




CREATE TABLE car1 (
    car_id          NUMBER PRIMARY KEY,               -- 차량 ID (자동 증가할 수 있음)
    make            VARCHAR2(50) NOT NULL,            -- 제조사 (예: 현대, BMW)
    model           VARCHAR2(50) NOT NULL,            -- 모델명 (예: Sonata, X5)
    year            NUMBER(4) NOT NULL,               -- 연식 (예: 2023)
    color           VARCHAR2(30),                     -- 색상
    price           NUMBER(10, 2) NOT NULL           -- 가격
);


CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,               -- 고객 ID
    first_name      VARCHAR2(50) NOT NULL,             -- 고객 이름
    last_name       VARCHAR2(50),                      -- 고객 성
    phone_number    VARCHAR2(20),                      -- 전화번호
    email           VARCHAR2(100),                     -- 이메일
    address         VARCHAR2(255),                     -- 주소
    date_of_birth   DATE,                              -- 생년월일
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 가입 일자
);

CREATE TABLE sales (
    sale_id         NUMBER PRIMARY KEY,               -- 판매 ID
    car_id          NUMBER NOT NULL,                   -- 판매된 차량 ID (car1 테이블의 외래 키)
    customer_id     NUMBER NOT NULL,                   -- 구매 고객 ID (customers 테이블의 외래 키)
    sale_date       TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 판매 일자 (기본값: 현재 시간)
    sale_price      NUMBER(10, 2) NOT NULL,            -- 실제 판매 가격 (할인 등 고려)
    payment_method  VARCHAR2(50),                      -- 결제 방법 (예: 카드, 현금, 할부 등)
    sales_person    VARCHAR2(50),                      -- 판매 담당자
    status          VARCHAR2(20) DEFAULT 'completed',   -- 거래 상태 (완료, 취소 등)
    CONSTRAINT fk_car foreign key(car_id) references car1(car_id),
    CONSTRAINT fk_customer foreign key(customer_id) references customers(customer_id)
);


insert into car1(car_id, make, model, year, color, price)
VALUES(1, '현대','HA-1',2025, '검정', 1000);;
insert into car1(car_id, make, model, year, color, price)
VALUES(2, '현대','HA-2',2027, '파랑', 1500);
insert into car1(car_id, make, model, year, color, price)
VALUES(3, '기아','KB-1',2026, '하양', 1100);
insert into car1(car_id, make, model, year, color, price)
VALUES(4, '기아','KB-2',2031, '빨강', 1750);
insert into car1(car_id, make, model, year, color, price)
VALUES(5, '대우','DC-1',2028, '보라', 1600);
insert into car1(car_id, make, model, year, color, price)
VALUES (6, '대우','DC-2',2033, '노랑', 1900);


INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (1, '하성', '김', '010-1111-1111', 'kim.naver.com', '서울, 강남구, 111-11', 
TO_DATE('2020-01-07', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);
INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (2, '정후', '이', '010-2222-2222', 'lee.naver.com', '서울, 서초구, 222-22', 
TO_DATE('2024-05-01', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);
INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (3, '지만', '최', '010-3333-3333', 'choi.naver.com', '인천, 미추홀구, 333-33', 
TO_DATE('2022-02-05', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);
INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (4, '정호', '강', '010-4444-4444', 'kingkang.naver.com', '광주, 서구, 444-44', 
TO_DATE('2021-09-16', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);
INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (5, '찬호', '박', '010-5555-5555', 'park.naver.com', '공주, 탄천면 , 555-55', 
TO_DATE('2024-06-01', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);
INSERT INTO customers (customer_id, first_name, last_name, phone_number, email, address,
date_of_birth, registration_date)
VALUES (6, '현진', '류', '010-6666-6666', 'ryu.naver.com', '대전, 유성구 , 666-66', 
TO_DATE('2023-09-09', 'YYYY-MM-DD'), CURRENT_TIMESTAMP);




INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (1, 2, 1, CURRENT_TIMESTAMP, 
1500, '카드', '오승환', '완료');
INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (2, 4, 3, CURRENT_TIMESTAMP, 
1750, '현금', '김광현', '완료');
INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (3, 6, 5, CURRENT_TIMESTAMP, 
1900, '할부', '오승환', '취소');
INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (4, 1, 2, CURRENT_TIMESTAMP, 
1000, '카드', '오승환', '취소');
INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (5, 3, 4, CURRENT_TIMESTAMP, 
1100, '카드', '김광현', '완료');
INSERT INTO sales (sale_id, car_id, customer_id, sale_date,
sale_price, payment_method, sales_person, status)
VALUES (6, 5, 6, CURRENT_TIMESTAMP, 
1600, '현금', '오승환', '완료');

rollback;
commit;