use MyDB ;

-- 자식 테이블을 먼저 삭제 하고 부모 테이블을 삭제 할 수 있다.
DROP TABLE IF EXISTS order10;
DROP TABLE IF EXISTS product10;
DROP TABLE IF EXISTS member10;
DROP TABLE IF EXISTS zipcode10;	-- 다른 테이블이 참조 하기 때문에 삭제 안됨 , 자식 테이블을 먼저 삭제후 삭제됨


-- ZIPCODE10 테이블 생성
CREATE TABLE zipcode10 (
    zipcode INT(6) NOT NULL PRIMARY KEY,
    si_do VARCHAR(200) NOT NULL,
    gu_gun VARCHAR(200) NOT NULL,
    bungi VARCHAR(200) NOT NULL
);

-- MEMBER10 테이블 생성
CREATE TABLE member10 (
    m_id INT(4) NOT NULL PRIMARY KEY,
    pass VARCHAR(200) NOT NULL,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    zipcode INT(6),
    FOREIGN KEY (zipcode) REFERENCES zipcode10(zipcode)
);

-- PRODUCT10 테이블 생성
CREATE TABLE product10 (
    pro_id INT(6) NOT NULL PRIMARY KEY,
    pro_name VARCHAR(200) NOT NULL,
    pro_price DECIMAL(7,2) NOT NULL,
    pro_cnt INT(4) NOT NULL DEFAULT 0
);

-- ORDER10 테이블 생성
CREATE TABLE order10 (
    ord_id INT(6) NOT NULL PRIMARY KEY,
    m_id INT(4) NOT NULL,
    pro_id INT(6) NOT NULL,
    FOREIGN KEY (m_id) REFERENCES member10(m_id),
    FOREIGN KEY (pro_id) REFERENCES product10(pro_id)
);


-- ZIPCODE10 데이터 삽입
INSERT INTO zipcode10 VALUES (100001, 'Seoul', 'Gangnam-gu', '123-45');
INSERT INTO zipcode10 VALUES (100002, 'Busan', 'Haeundae-gu', '234-56');
INSERT INTO zipcode10 VALUES (100003, 'Incheon', 'Namdong-gu', '345-67');
INSERT INTO zipcode10 VALUES (100004, 'Daegu', 'Suseong-gu', '456-78');
INSERT INTO zipcode10 VALUES (100005, 'Gwangju', 'Buk-gu', '567-89');

-- MEMBER10 데이터 삽입
INSERT INTO member10 VALUES (1, 'pass123', 'Alice', 'alice@example.com', 100001);
INSERT INTO member10 VALUES (2, 'pass234', 'Bob', 'bob@example.com', 100002);
INSERT INTO member10 VALUES (3, 'pass345', 'Charlie', 'charlie@example.com', 100003);
INSERT INTO member10 VALUES (4, 'pass456', 'Diana', 'diana@example.com', 100004);
INSERT INTO member10 VALUES (5, 'pass567', 'Eve', 'eve@example.com', 100005);

-- PRODUCT10 데이터 삽입
INSERT INTO product10 VALUES (101, 'Laptop', 1200.00, 10);
INSERT INTO product10 VALUES (102, 'Smartphone', 800.00, 25);
INSERT INTO product10 VALUES (103, 'Tablet', 450.00, 30);
INSERT INTO product10 VALUES (104, 'Monitor', 300.00, 15);
INSERT INTO product10 VALUES (105, 'Keyboard', 50.00, 100);

-- ORDER10 데이터 삽입
INSERT INTO order10 VALUES (1001, 1, 101);
INSERT INTO order10 VALUES (1002, 2, 102);
INSERT INTO order10 VALUES (1003, 3, 103);
INSERT INTO order10 VALUES (1004, 4, 104);
INSERT INTO order10 VALUES (1005, 5, 105);


-- 각 테이블의 값이 잘 등록 되었는지 확인
select * from member10;
select * from product10;
select * from zipcode10;
select * from order10;












