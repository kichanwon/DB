DROP TABLE CATEGORIES CASCADE CONSTRAINT ;
DROP TABLE PRODUCTS CASCADE CONSTRAINT ;
DROP TABLE CUSTOMERS CASCADE CONSTRAINT ;
DROP TABLE ORDERS CASCADE CONSTRAINT ;
DROP TABLE ORDER_DETAILS CASCADE CONSTRAINT ;


CREATE TABLE "CATEGORIES"(
	CATEGORY_ID NUMBER CONSTRAINT CATEGORY_ID_PK PRIMARY KEY ,
	CATEGORY_NAME VARCHAR2(100) ,
	
	CONSTRAINT CATEGORY_NAME_U UNIQUE(CATEGORY_NAME)
);

CREATE TABLE "PRODUCTS"(
	PRODUCT_ID NUMBER CONSTRAINT PRODUCT_ID_PK PRIMARY KEY ,
	PRODUCT_NAME VARCHAR2(100) NOT NULL ,
	CATEGORY NUMBER CONSTRAINT CATEGOTY_FK REFERENCES CATEGORIES ,
	PRICE NUMBER DEFAULT 0 ,
	STOCK_QUANTITY NUMBER DEFAULT 0
);

CREATE TABLE "CUSTOMERS"(
	CUSTOMER_ID NUMBER CONSTRAINT CUSTOMER_ID_PK PRIMARY KEY ,
	NAME VARCHAR2(20) NOT NULL ,
	GENDER CHAR(3) CONSTRAINT GENDER_CHECK CHECK ( GENDER IN ('남', '여') ) ,
	ADDRESS VARCHAR2(100) ,
	PHONE VARCHAR2(30) 
);

CREATE TABLE "ORDERS"(
	ORDER_ID NUMBER CONSTRAINT ORDER_ID_PK PRIMARY KEY ,
	ORDER_DATE DATE DEFAULT SYSDATE ,
	STATUS CHAR(1) DEFAULT 'N' CONSTRAINT STATUS_CHECK CHECK ( STATUS IN ('Y', 'N') ) ,
	CUSTOMER_ID NUMBER CONSTRAINT CUSTOMER_ID_FK REFERENCES CUSTOMERS (CUSTOMER_ID) 
	ON DELETE CASCADE
);

CREATE TABLE "ORDER_DETAILS"(
	ORDER_DETAIL_ID NUMBER CONSTRAINT ORDER_DETAIL_ID_PK PRIMARY KEY ,
	ORDER_ID NUMBER CONSTRAINT ORDER_ID_FK REFERENCES ORDERS
	ON DELETE CASCADE ,
	PRODUCT_ID NUMBER CONSTRAINT PRODUCT_ID_FK REFERENCES PRODUCTS
	ON DELETE SET NULL ,
	QUANTITY NUMBER ,
	PRICE_PER_UNIT NUMBER
);


------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO CATEGORIES VALUES(1, '스마트폰');
INSERT INTO CATEGORIES VALUES(2, 'TV');
INSERT INTO CATEGORIES VALUES(3, 'GAMING');

INSERT INTO PRODUCTS VALUES(101,	'Apple iPhone 12',			1,	1500000,	30);
INSERT INTO PRODUCTS VALUES(102,	'Samsung Galaxy S24',	1,	1800000,	50);
INSERT INTO PRODUCTS VALUES(201,	'LG OLED TV',					2,	3600000,	10);
INSERT INTO PRODUCTS VALUES(301,	'Sony PlayStation 5',		3,	700000,		15);

INSERT INTO CUSTOMERS VALUES(1, '홍길동', '남', '서울시 성동구 왕십리', '010-1111-2222');
INSERT INTO CUSTOMERS VALUES(2, '유관순', '여', '서울시 종로구 안국동', '010-3333-1111');

INSERT INTO ORDERS VALUES(576,	'2024-02-29',		'N',	1);
INSERT INTO ORDERS VALUES(978,	'2024-03-11',		'Y',	2);
INSERT INTO ORDERS VALUES(777,	'2024-03-11',		'N',	2);
INSERT INTO ORDERS VALUES(134,	'2022-12-25',		'Y',	1);
INSERT INTO ORDERS VALUES(499,	'2020-01-03',		'Y',	1);

INSERT INTO ORDER_DETAILS VALUES(111, 576, 101, 1, 1500000);
INSERT INTO ORDER_DETAILS VALUES(222, 978, 201, 2, 3600000);
INSERT INTO ORDER_DETAILS VALUES(333, 978, 102, 1, 1800000);
INSERT INTO ORDER_DETAILS VALUES(444, 777, 301, 5, 700000);
INSERT INTO ORDER_DETAILS VALUES(555, 134, 102, 1, 1800000);
INSERT INTO ORDER_DETAILS VALUES(666, 499, 201, 3, 3600000);


COMMIT ;


------------------------------------------------------------------------------------------------------------------------------------

--1
SELECT c.NAME , o.ORDER_DATE  , o.STATUS
FROM CUSTOMERS c
JOIN ORDERS o ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE o.STATUS = 'N';

--2
SELECT ORDER_ID , o.ORDER_DATE , o.STATUS
FROM ORDER_DETAILS od 
JOIN ORDERS o USING (ORDER_ID)
JOIN CUSTOMERS c ON o.CUSTOMER_ID = c.CUSTOMER_ID
WHERE c.NAME = '홍길동' 
	AND EXTRACT(YEAR FROM o.ORDER_DATE) = '2024';

--3
SELECT 
    o.ORDER_ID, 
    p.PRODUCT_NAME, 
    od.QUANTITY, 
    p.PRICE, 
    (od.QUANTITY * p.PRICE) AS ORDER_TOTAL,
    SUM(od.QUANTITY * p.PRICE) OVER(ORDER BY o.ORDER_ID) AS RUNNING_TOTAL
FROM ORDERS o
JOIN ORDER_DETAILS od USING (ORDER_ID)
JOIN PRODUCTS p USING (PRODUCT_ID)
WHERE o.CUSTOMER_ID = (
    SELECT c.CUSTOMER_ID
    FROM CUSTOMERS c
    WHERE c.NAME = '유관순'
)
ORDER BY o.ORDER_ID;












