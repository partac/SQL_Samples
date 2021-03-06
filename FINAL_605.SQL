-- INFO 605 FINAL PROJECT --
-- Dr. Bo Song --

-- PATRICK ARTAC --

-- 13-MAR-2022 --


-- create table CUSTOMER --
create table CUSTOMER(
ACCOUNT_NUMBER CHAR(12) constraint CUSTOMER_AC_PK primary key,
SUB_PLAN varchar(1) constraint CUSTOMER_NN_SUB_PLAN not null,
FIRST_NAME varchar2(12) constraint CUSTOMER_NN_FIRST_NAME not null,
LAST_NAME varchar2(12) constraint CUSTOMER_NN_LAST_NAME not null,
EMAIL varchar2(30) constraint CUSTOMER_NN_EMAIL not null,
PASS varchar2(12) constraint CUSTOMER_NN_PASSWORD not null,
STREET varchar2(20),
CITY varchar2(12),
STATE char(2),
ZIP char(5),
DOB date,
GENDER char(1)
);

-- insert into CUSTOMER --
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (123456789123,'P','Mike','Jones','michaelmyers@icloud.com','12qwaszx1','7400 Jumbo Road','West Chester','PA',16101,'06-Jan-1998','M');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (987654321987,'F','Steven','King','bigtimer1234@gmail.com','qwertyasz','646 Shady Avenue','Greenwich','CT',78954,'09-Nov-1989','M');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (123321456654,'F','Andrea','Smith','andreababy@yahoo.com','!@hello','18th Street Unit 211','New York','NY',16146,'28-Feb-2000','F');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (123456654321,'P','Nicolette','Brown','nb567@drexel.edu','poison%ty','444 High Roller Blvd','Las Vegas','NV',19382,'10-Oct-1996','F');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (798765567890,'P','Tory','Robinson','tmoney54@gmail.com','runnerman','800 Mountain Lane','Zion','UT',87937,'04-Jul-1978','M');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (192837465645,'F','Jess','Avocado','avocados@protonmail','9o8i7u6y5','122 Snowy Road','Boulder','CO',54876,'25-Sep-1999','F');
insert into CUSTOMER(ACCOUNT_NUMBER,SUB_PLAN,FIRST_NAME,LAST_NAME,EMAIL,PASS,STREET,CITY,STATE,ZIP,DOB,GENDER) values (290987876565,'P','Vicky','Gomes','ickyvicky@gmail.com','9o8i7u6y5','750 Bomber Lane','Minot','ND',29756,'19-Apr-1991','F');

-- create table PAYMENT --
create table PAYMENT(
TRANSACTION_ID char(8) constraint PAYMENT_PK primary key,
AMOUNT number constraint PAYMENT_NN_AMOUNT not null,
PAYMENT_METHOD char(1) constraint PAYMENT_NN_PAY_METHOD not null,
TRANSACTION_DATE date,
ACCOUNT_NUMBER CHAR(12) constraint PAYMENT_FK_CUSTOMER REFERENCES CUSTOMER on delete cascade
);

-- insert into PAYMENT --
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (12345678,1019.00,'d','01-Jan-2022',798765567890);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (87654321,54.20,'d','25-Dec-2021',123456789123);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (12344321,19.90,'c','04-Nov-2021',123321456654);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (87655678,57.54,'c','31-Oct-2022',987654321987);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (59876543,121.87,'d','08-Mar-2022',192837465645);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (76859403,89.11,'c','30-May-2021',290987876565);
insert into PAYMENT(TRANSACTION_ID,AMOUNT,PAYMENT_METHOD,TRANSACTION_DATE,ACCOUNT_NUMBER) values (45637281,15.25,'d','19-Jan-2021',123456654321);

-- create table CATEGORY --
create table CATEGORY(
CATEGORY_ID char(9) constraint CATEGORY_ID_PK primary key,
Category_Name varchar2(13),
CATEGORY_TYPE varchar2(5),
ACCOUNT_NUMBER CHAR(12) constraint CATEGORY_FK_CUSTOMER REFERENCES CUSTOMER on delete cascade
);

-- insert into CATEGORY --
insert into CATEGORY(CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ACCOUNT_NUMBER) values (789654123,'Electronics','EC',798765567890);
insert into CATEGORY(CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ACCOUNT_NUMBER) values (896541230,'Homecare','HC',123456789123);
insert into CATEGORY(CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ACCOUNT_NUMBER) values (987456321,'Beauty','BT',123321456654);
insert into CATEGORY(CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ACCOUNT_NUMBER) values (125896312,'Clothing','CG',987654321987);
insert into CATEGORY(CATEGORY_ID,CATEGORY_NAME,CATEGORY_TYPE,ACCOUNT_NUMBER) values (741258936,'Jewelry','JY',290987876565);

-- create table SHOPPING_CART --
create table SHOPPING_CART(
CART_ID CHAR(9) constraint SHOPPING_CART_PK primary key,
ADD_ITEM CHAR(1),
REMOVE_ITEM CHAR(1),
ACCOUNT_NUMBER char(12) constraint SHP_CRT_FK_ACC_NUM references CUSTOMER on delete cascade
);


-- insert into SHOPPING_CART --
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (987654329, 'Y','N',123456789123);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (888876543, 'N','Y',987654321987);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (789876546, 'Y','N',123321456654);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (676789076, 'N','Y',123456654321);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (765789077, 'N','Y',798765567890);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (878999999, 'Y','N',192837465645);
insert into SHOPPING_CART(CART_ID,ADD_ITEM,REMOVE_ITEM,ACCOUNT_NUMBER) values (910834732, 'Y','N',290987876565);


--create table PRODUCT --
create table PRODUCT(
PRODUCT_ID varchar2(10) constraint PRODUCT_ID_PK primary key,
PRICE number,
PRODUCT_NAME varchar2(25),
PRODUCT_BRAND varchar2(25),
QUANTITY int,
PURCHASE_ITEM char(1) constraint PRODUCT_NN_PURCH not null,
CART_ID char(9) constraint PRODUCT_FK_SHOPPING_CART references SHOPPING_CART on delete cascade,
ACCOUNT_NUMBER char(12) constraint PRODUCT_FK_CUSTOMER references CUSTOMER on delete cascade,
CATEGORY_ID char(9) constraint PRODUCT_FK_CATEGORY references CATEGORY on delete cascade
);


-- insert into PRODUCT --
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (9988776655,1.99,'Toothbrush','Colgate',999,'Y',888876543,798765567890,987456321);                  
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (1122334455,5.99,'Wide Tooth Comb','Conair',999,'Y',987654329,987654321987,987456321);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (8767656545,55.00,'Bluetooth Speaker','JBL',567,'N',888876543,123321456654,789654123);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (4354657687,1010.00,'Television','Samsung',15,'Y',789876546,123456654321,789654123);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (3423125686,34.99,'Decorative Plate Set','Pyrex',210,'N',676789076,798765567890,896541230);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (4653832614,7.99,'High Socks','Adidas',305,'Y',765789077,192837465645,125896312);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (8097962345,15.60,'Rubber Phone Case','Apple',2000,'Y',878999999,290987876565,789654123);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (4527658734,.99,'Marker','Sharpie',899,'Y',987654329,290987876565,896541230);
insert into PRODUCT(PRODUCT_ID,PRICE,PRODUCT_NAME,PRODUCT_BRAND,QUANTITY,PURCHASE_ITEM,CART_ID,ACCOUNT_NUMBER,CATEGORY_ID) values (9153287456,60.80,'Queen Sheet Set','Tommy Hilfigger',25,'Y',878999999,987654321987,896541230);

-- create table ORDERS --
create table ORDERS(
ORDER_ID varchar(9) constraint ORDER_PK primary key,
ORDER_DATE date,
ORDER_QUANTITY number,
ORDER_WEIGHT number,
ORDER_CONFORMATION varchar2(8),
TRACKING_ID varchar(9) constraint ORDER_UQ_TRID unique,
ACCOUNT_NUMBER char(12) constraint ORDER_FK_CUSTOMER references CUSTOMER on delete cascade,
CATEGORY_ID char(9) constraint ORDER_FK_CATEGORY references CATEGORY on delete cascade
);

-- insert into ORDERS --
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('A56781342','01-Jan-2022',2,4.16,'Recieved',359527891,798765567890,987456321);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('KL9645369','25-Dec-2021',1,5.89,'Recieved','53T7YU421',192837465645,125896312);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('U86P49248','04-Nov-2021',5,6.90,'Canceled','TUY744995',290987876565,789654123);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('HM4321768','31-Oct-2022',50,1.23,'Recieved',588553126,123456789123,789654123);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('911KER123','08-Mar-2022',10,30.89,'Canceled','588553126',987654321987,987456321);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('397R54321','30-May-2021',9,5.68,'Canceled','BRJ000111',123321456654,789654123);
insert into ORDERS(ORDER_ID,ORDER_DATE,ORDER_QUANTITY,ORDER_WEIGHT,ORDER_CONFORMATION,TRACKING_ID,ACCOUNT_NUMBER,CATEGORY_ID) values ('98073Y563','19-Jan-2021',5,1.99,'Recieved','ART744819',123456654321,789654123);

-- create table ORDER_RETURN --
create table ORDER_RETURN(
RETURN_DATE date constraint ORDER_RETURN_PK primary key,
POSTAGE_SERVICE VARCHAR2(12),
RETURN_TRACKING_ID VARCHAR2(12),
ORDER_ID varchar(9) constraint ORDER_RETURN_FK_ORDERS references ORDERS on delete cascade
);

-- insert into ORDER_RETURN --
insert into ORDER_RETURN(RETURN_DATE,POSTAGE_SERVICE,RETURN_TRACKING_ID,ORDER_ID) values ('24-Aug-2022','USPS',722278536,'A56781342');
insert into ORDER_RETURN(RETURN_DATE,POSTAGE_SERVICE,RETURN_TRACKING_ID,ORDER_ID) values ('15-Apr-2022','USPS',123654789,'U86P49248');
insert into ORDER_RETURN(RETURN_DATE,POSTAGE_SERVICE,RETURN_TRACKING_ID,ORDER_ID) values ('12-Apr-2022','FEDX',741074107,'911KER123');
insert into ORDER_RETURN(RETURN_DATE,POSTAGE_SERVICE,RETURN_TRACKING_ID,ORDER_ID) values ('4-Jun-2022','USPS',147896549,'98073Y563');
insert into ORDER_RETURN(RETURN_DATE,POSTAGE_SERVICE,RETURN_TRACKING_ID,ORDER_ID) values ('11-Feb-2022','USPS',226673321,'KL9645369');

-- create table SELLER --
create table SELLER(
  SELLER_ID int constraint SELLER_ID_PK primary key,
  COMPANY_NAME varchar2(20),
  PHONE_NUMBER CHAR(10),
  WEBSITE varchar2(18),
  SELLER_STREET varchar2(20),
  SELLER_STATE char(2),
  SELLER_CITY varchar2(22),
  SELLER_ZIP char(5),
  CATEGORY_ID char(9) constraint SELLER_FK_CATEGORY references CATEGORY on delete cascade
);

-- insert into SELLER --
insert into SELLER(SELLER_ID,COMPANY_NAME,PHONE_NUMBER,WEBSITE,SELLER_STREET,SELLER_STATE,SELLER_CITY,SELLER_ZIP,CATEGORY_ID) values (100002222,'Nifty Products',1007679991,'niftyproducts.com','866 Round About Way','MI','Detroit',90067,789654123);
insert into SELLER(SELLER_ID,COMPANY_NAME,PHONE_NUMBER,WEBSITE,SELLER_STREET,SELLER_STATE,SELLER_CITY,SELLER_ZIP,CATEGORY_ID) values (999964444,'Divine Sellers',7890981234,'divinesellers.com','150 Honey Circle','GA','Athens',32134,896541230);
insert into SELLER(SELLER_ID,COMPANY_NAME,PHONE_NUMBER,WEBSITE,SELLER_STREET,SELLER_STATE,SELLER_CITY,SELLER_ZIP,CATEGORY_ID) values (656574749,'You Buy',5678881111,'youbuywesell.com','8565 Glowing Road','FL','Miami',14896,987456321);
insert into SELLER(SELLER_ID,COMPANY_NAME,PHONE_NUMBER,WEBSITE,SELLER_STREET,SELLER_STATE,SELLER_CITY,SELLER_ZIP,CATEGORY_ID) values (101029298,'Buy It Cheap',9215677890,'buyitcheap.com','7000 Ledger Drive','OH','Cleveland',99900,125896312);
insert into SELLER(SELLER_ID,COMPANY_NAME,PHONE_NUMBER,WEBSITE,SELLER_STREET,SELLER_STATE,SELLER_CITY,SELLER_ZIP,CATEGORY_ID) values (546726518,'Cheap Buys',3334445555,'cheapbuys.com','5832 Marriott Lane','TX','Houston',99900,741258936);

-- create table PRODUCT_RECORD --
create table PRODUCT_RECORD(
  FILE_NAME varchar2(10) constraint FILE_NAME_PK primary key,
  QUANTITY_SOLD int,
  PRODUCT_INVENTORY CHAR(13),
  AVERAGE_SALE_PRICE CHAR(13),
  LAST_INVENTORY_ORDER DATE,
  AVERAGE_SHELF_LIFE CHAR(3)
);

-- insert into PRODUCT_RECORD --
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File1',1090,5000,45,'01-Jan-21',8);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File2',1500,4656,20,'19-Feb-22',8);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File3',600,300,8,'30-Apr-21',7);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File4',500,123,19.95,'28-Feb-22',1);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File5',980,547,60,'19-Mar-22',5);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File6',700,19,12,'17-Jan-22',2);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File7',896,566,35,'09-Mar-22',9);
insert into PRODUCT_RECORD(FILE_NAME,QUANTITY_SOLD,PRODUCT_INVENTORY,AVERAGE_SALE_PRICE,LAST_INVENTORY_ORDER,AVERAGE_SHELF_LIFE) values ('File8',1900,1988,50,'28-Feb-22',7);

-- create table STAFF --
create table STAFF(
  STAFF_ID char(6) constraint STAFF_ID_PK primary key,
  STAFF_NAME varchar2(13),
  STAFF_PASSWORD VARCHAR2(12),
  FILE_NAME varchar2(10) constraint STAFF_FK_PRODUCT_RECORD references PRODUCT_RECORD on delete cascade
);

-- insert into STAFF --
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (900056,'Amber','YUPHBD75H','File1');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (100057,'Roger','TEE777YYY','File2');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (200058,'Mary','RUB834LLL','File8');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (300059,'George','DOG100999','File3');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (400060,'Tom','FOOT56764','File4');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (400061,'Kate','CUPBALL32','File6');
insert into STAFF(STAFF_ID,STAFF_NAME,STAFF_PASSWORD,FILE_NAME) values (400062,'Sue','VET693109','File7');


-- create table SHIPPING_DETAILS --
create table SHIPPING_DETAILS(
SHIPPING_ID char(9) constraint SHIPPING_ID_PK primary key,
SHIP_STREET varchar2(25),
SHIP_STATE varchar2(25),
SHIP_ZIP int,
SHIP_DATE DATE,
ORDER_ID varchar(9) constraint SHIPPING_DETAILS_FK_ORDERS references ORDERS on delete cascade
);

-- insert into SHIPPING_DETAILS --
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (754754754,'740 Waverly Place','NJ',19104,'17-Apr-2021','A56781342');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (876876876,'908 Union Ave','GA',18086,'31-Jan-2022','U86P49248');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (999444777,'888 Virtual Road','FL',18054,'15-Feb-2022','HM4321768');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (909089891,'432 Ice Lane','PA',28016,'19-Mar-2022','911KER123');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (865231732,'566 Water Road','OH',18798,'7-Dec-2021','397R54321');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (342342564,'223 Paper Lane','TX',18798,'10-Jun-2021','98073Y563');
insert into SHIPPING_DETAILS(SHIPPING_ID,SHIP_STREET,SHIP_STATE,SHIP_ZIP,SHIP_DATE,ORDER_ID) values (482901384,'777 Tin Cup Drive','TN',15832,'17-Aug-2021','KL9645369');


-- Changing the display settings of all the tables --

-- Table CUSTOMER --
COL ACCOUNT_NUMBER FORMAT A14;
COL SUB_PLAN FORMAT A8;
COL FIRST_NAME FORMAT A10;
COL LAST_NAME FORMAT A10;
COL EMAIL FORMAT A25;
COL PASS FORMAT A9;
COL STREET FORMAT A20;
COL CITY FORMAT A18;
COL STATE FORMAT A5;
COL ZIP FORMAT A5;
COL DOB FORMAT A9;
COL GENDER FORMAT A6;
set linesize 160;
set pagesize 100;
SELECT* FROM CUSTOMER;


-- TABLE PAYMENT --
COL TRANSACTION_ID FORMAT A14;
COL PAYMENT_METHOD  FORMAT A14;
COL TRANSACTION_DATE FORMAT A16;
COL ACCOUNT_NUMBER FORMAT A14;
SELECT* FROM PAYMENT;

-- TABLE CATEGORY --
COL CATEGORY_ID  FORMAT A11;
COL CATEGORY_ NAME FORMAT A13;
COL CATEGORY_TYPE FORMAT A13;
COL ACCOUNT_NUMBER FORMAT A14;
set linesize 160;
set pagesize 100;
SELECT* FROM CATEGORY;

--TABLE SHOPPING_CART --
COL CART_ID FORMAT A9;
COL ADD_ITEM FORMAT A8;
COL REMOVE_ITEM FORMAT A11;
set linesize 160;
set pagesize 100;
SELECT* FROM SHOPPING_CART;

--TABLE PRODUCT --
COL PRODUCT_ID FORMAT A10;
--COL PRICE FORMAT A5; --
COL PRODUCT_NAME FORMAT A20;
COL PRODUCT_BRAND FORMAT A15;
-- COL QUANTITY FORMAT A8; --
COL PURCHASE_ITEM FORMAT A13;
COL CART_ID FORMAT A9;
COL ACCOUNT_NUMBER FORMAT A14;
COL CATEGORY_ID FORMAT A11;
set linesize 160;
set pagesize 100;
select* FROM PRODUCT;

--TABLE ORDER_RETURN --
COL RETURN_DATE FORMAT A11;
COL POSTAGE_SERVICE FORMAT A15;
COL RETURN_TRACKING_ID FORMAT A18;
COL ORDER_ID FORMAT A9;
set linesize 160;
set pagesize 100;
SELECT* FROM ORDER_RETURN;

-- TABLE ORDERS --
COL ORDER_ID FORMAT A9;
COL ORDER_DATE FORMAT A10;
-- COL ORDER_QUANTITY FORMAT A14; --
-- COL ORDER_WEIGHT FORMAT A12; --
COL ORDER_CONFORMATION FORMAT A18;
COL TRACKING_ID FORMAT A11;
COL ACCOUNT_NUMBER A14;
COL RETURN_DATE FORMAT A11;
COL CATEGORY_ID FORMAT A11;
set linesize 160;
set pagesize 100;
SELECT* FROM ORDERS;

-- TABLE Seller --
COL COMPANY_NAME FORMAT A16;
COL PHONE_NUMBER FORMAT A12;
COL WEBSITE FORMAT A20;
COL SELLER_STREET FORMAT A20;
COL SELLER_STATE FORMAT A12;
COL SELLER_CITY FORMAT A11;
COL SELLER_ZIP FORMAT A10;
COL CATEGORY_ID FORMAT A11;
set linesize 160;
set pagesize 100;
SELECT* FROM SELLER;

-- TABLE PRODUCT_RECORD --
COL FILE_NAME FORMAT A9;
--COL QUANTITY_SOLD FORMAT A13;--
COL PRODUCT_INVENTORY FORMAT A17;
COL AVERAGE_SALE_PRICE FORMAT A18;
COL LAST_INVENTORY_ORDER FORMAT A20;
COL AVERAGE_SHELF_LIFE FORMAT A18;
set linesize 160;
set pagesize 100;
SELECT* FROM PRODUCT_RECORD;

-- TABLE STAFF --
COL STAFF_ID FORMAT A8;
COL STAFF_NAME FORMAT A10;
COL STAFF_PASSWORD FORMAT A14;
COL PRODUCT_RECORD FORMAT A14;
set linesize 160;
set pagesize 100;
SELECT* FROM STAFF;

-- SHIPPING DETAILS --
COL SHIPPING_ID FORMAT A11;
COL SHIP_STREET FORMAT A20;
COL SHIP_STATE FORMAT A10;
-- COL SHIP_ZIP FORMAT A8; --
COL SHIP_DATE FORMAT A9;
COL ORDER_ID FORMAT A9;
set linesize 160;
set pagesize 150;
SELECT* FROM SHIPPING_DETAILS;

-- JOIN TABLE STATEMENTS --
-- set_linesize for all JOIN STATEMENTS --
set linesize 300;
set pagesize 500;

-- 1 --
SELECT * FROM CUSTOMER c JOIN PAYMENT p ON c.ACCOUNT_NUMBER = p.ACCOUNT_NUMBER;

-- 2 --
SELECT * FROM CUSTOMER c JOIN PRODUCT p ON c.ACCOUNT_NUMBER = p.ACCOUNT_NUMBER;

-- 3 --
SELECT * FROM ORDERS o JOIN SHIPPING_DETAILS s ON o.ORDER_ID = s.ORDER_ID;

-- 4 --
SELECT * FROM SHOPPING_CART s JOIN PRODUCT p ON s.CART_ID =  p.CART_ID;

-- 5 --
SELECT * FROM CUSTOMER c JOIN Payment p ON c.ACCOUNT_NUMBER = p.ACCOUNT_NUMBER WHERE AMOUNT> 34;


-- DATA MANIPULATION QUERIES --

-- UPDATE QUERY --
UPDATE CUSTOMER SET CITY = 'BURLINGTON', DOB = '13-JUN-74' WHERE FIRST_NAME = 'Andrea';
SELECT * FROM CUSTOMER;
-- DELETE QUERY --
DELETE FROM CUSTOMER WHERE LAST_NAME = 'Gomes';
SELECT * FROM Customer;


-- UPDATE QUERY --
UPDATE PAYMENT SET AMOUNT = 6000, PAYMENT_METHOD = 'c' WHERE TRANSACTION_DATE = '01-Jan-2022';
SELECT * FROM PAYMENT;
-- DELETE QUERY --
DELETE FROM PAYMENT WHERE TRANSACTION_DATE = '08-Mar-2022';
SELECT * FROM Customer;


-- UPDATE QUERY --
UPDATE CATEGORY SET CATEGORY_ID = 666666666, CATEGORY_TYPE = 'HC' WHERE CATEGORY_NAME = 'Electronics';
SELECT * FROM CATEGORY;
-- DELETE QUERY --
DELETE FROM CATEGORY  WHERE CATEGORY_ID = 789654123;
SELECT * FROM CATEGORY;


-- UPDATE QUERY --
UPDATE PRODUCT SET PRODUCT_BRAND = 'Pepsodent', PRICE = 2.99 WHERE PRODUCT_NAME = 'Toothbrush';
SELECT * FROM PRODUCT;
-- Delete DML--
DELETE FROM PRODUCT WHERE PRODUCT_NAME = 'Television';
SELECT* FROM PRODUCT;

-- DML -- 
SELECT FIRST_NAME,LAST_NAME
FROM CUSTOMER
WHERE DOB > '01-JAN-1996';

-- DML --
SELECT FIRST_NAME,LAST_NAME
FROM CUSTOMER
WHERE GENDER = 'M';

-- DML --
SELECT PRODUCT_ID,PRODUCT_NAME,PRODUCT_BRAND
FROM PRODUCT
WHERE PRICE > 5.00;

-- DML --
SELECT
AVG(PRICE) AS Avg_Price_Of_Product
FROM PRODUCT;
