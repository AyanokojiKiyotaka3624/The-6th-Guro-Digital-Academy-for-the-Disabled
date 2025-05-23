-- USERS
CREATE TABLE USERS (
    USER_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    EMAIL VARCHAR2(100)
);
/*
INSERT INTO USERS VALUES (1, '김철수', 'cs.kim@example.com');
INSERT INTO USERS VALUES (2, '이영희', 'yh.lee@example.com');
*/
-- CATEGORIES
CREATE TABLE CATEGORIES (
    CATEGORY_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100)
);

/*
INSERT INTO CATEGORIES VALUES (1, '전자제품');
INSERT INTO CATEGORIES VALUES (2, '패션');
*/
-- PRODUCTS
CREATE TABLE PRODUCTS (
    PRODUCT_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    PRICE NUMBER,
    CATEGORY_ID NUMBER,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID)
);
/*
INSERT INTO PRODUCTS VALUES (1, '노트북', 1200000, 1);
INSERT INTO PRODUCTS VALUES (2, '청바지', 50000, 2);
INSERT INTO PRODUCTS VALUES (3, '스마트폰', 900000, 1);
*/
-- ORDERS
CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,
    USER_ID NUMBER,
    ORDER_DATE DATE,
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);
/*
INSERT INTO ORDERS VALUES (1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO ORDERS VALUES (2, 2, TO_DATE('2024-04-02', 'YYYY-MM-DD'));
*/
-- ORDER_ITEMS
CREATE TABLE ORDER_ITEMS (
    ORDER_ITEM_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER,
    PRODUCT_ID NUMBER,
    QUANTITY NUMBER,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);
/*
INSERT INTO ORDER_ITEMS VALUES (1, 1, 1, 1);
INSERT INTO ORDER_ITEMS VALUES (2, 1, 2, 2);
INSERT INTO ORDER_ITEMS VALUES (3, 2, 3, 1);
*/
-- PAYMENTS
CREATE TABLE PAYMENTS (
    PAYMENT_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER,
    AMOUNT NUMBER,
    PAYMENT_DATE DATE,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);
/*
INSERT INTO PAYMENTS VALUES (1, 1, 1300000, TO_DATE('2024-04-01', 'YYYY-MM-DD'));
INSERT INTO PAYMENTS VALUES (2, 2, 900000, TO_DATE('2024-04-02', 'YYYY-MM-DD'));
*/
-- SHIPPING
CREATE TABLE SHIPPING (
    SHIPPING_ID NUMBER PRIMARY KEY,
    ORDER_ID NUMBER,
    STATUS VARCHAR2(50),
    SHIP_DATE DATE,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);
/*
INSERT INTO SHIPPING VALUES (1, 1, '배송중', TO_DATE('2024-04-03', 'YYYY-MM-DD'));
INSERT INTO SHIPPING VALUES (2, 2, '배송완료', TO_DATE('2024-04-04', 'YYYY-MM-DD'));
*/ 


/*
SELECT
    u.NAME AS 사용자명,
    u.EMAIL,
    o.ORDER_ID,
    o.ORDER_DATE,
    p.NAME AS 상품명,
    p.PRICE,
    c.NAME AS 카테고리,
    oi.QUANTITY,
    pay.AMOUNT,
    s.STATUS AS 배송상태,
    s.SHIP_DATE
FROM USERS u
JOIN ORDERS o ON u.USER_ID = o.USER_ID
JOIN ORDER_ITEMS oi ON o.ORDER_ID = oi.ORDER_ID
JOIN PRODUCTS p ON oi.PRODUCT_ID = p.PRODUCT_ID
JOIN CATEGORIES c ON p.CATEGORY_ID = c.CATEGORY_ID
JOIN PAYMENTS pay ON o.ORDER_ID = pay.ORDER_ID
JOIN SHIPPING s ON o.ORDER_ID = s.ORDER_ID;




*/




