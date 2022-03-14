--------------------
-- File : INFO605 SQL PROJECT
-- Role: Lead Dev
-- Author : Patrick Artac 
-- Create Date : 01-MAR-2022
--------------------

-- table creation for customer --
create table CUSTOMER(
    CID char(12) constraint CUSTOMER_PK primary key,
    SSN char(9) constraint CUSTOMER_UQ_SSN unique, 
    FIRST_NAME varchar2(25) constraint CUSTOMER_NN_FNAME not null,
    LAST_NAME varchar2(25) constraint CUSTOMER_NN_LNAME not null,
    TELEPHONE char(10),
    DOB date
);

-- table creation for account --
create table ACCOUNT(
    ACCOUNT_NUMBER char(15) constraint ACCOUNT_PK primary key,
    TYPE char(1) constraint ACCOUNT_CK_TYPE check (type in ('s','c')),
    DATE_CREATED date constraint ACCOUNT_NN_DATECREATED not null,
    STATUS varchar2(10) constraint ACCOUNT_NN_STATUS not null,
    CUSTOMER char(12) constraint CUSTOMER_PK references CUSTOMER_PK on delete cascade
);

-- table creation for transaction --
create table TRANSACTION(
    TRANSACTION_NUMBER char(15) constraint TRANSACTION_PK primary key,
    TYPE char(1) constraint TRANSACTION_CK_TYPE check (type in ('d','c')),
    AMOUNT number constraint TRANSACTION_NN_AMOUNT not null,
    ACCOUNT char(15) constraint ACCOUNT_PK references ACCOUNT_PK on delete set null 
);

-- customer information --
insert into CUSTOMER(CID,SSN,FIRST_NAME,LAST_NAME,TELEPHONE,DOB) values (123456789012,123456789,'wendy','bendy',2155551000,'13-may-1978');
insert into CUSTOMER(CID,SSN,FIRST_NAME,LAST_NAME,TELEPHONE,DOB) values (987654321098,987654321,'Jason','Mason',6105552000,'04-oct-1963');
insert into CUSTOMER(CID,SSN,FIRST_NAME,LAST_NAME,TELEPHONE,DOB) values (456123789123,456123789,'lance','armstrong',4845553000,'23-feb-1967');
insert into CUSTOMER(CID,SSN,FIRST_NAME,LAST_NAME,TELEPHONE,DOB) values (112233445567,112233445,'johnny','bankrupt',2155556000,'18-jan-1973');

-- format for customer columns --
COL FIRST_NAME format a12;
COL LAST_NAME format a12;

-- account informations --
insert into ACCOUNT(ACCOUNT_NUMBER,TYPE,DATE_CREATED,STATUS,CUSTOMER) values (098765432154321,'c','18-aug-04','open',987654321098);
insert into ACCOUNT(ACCOUNT_NUMBER,TYPE,DATE_CREATED,STATUS,CUSTOMER) values (111112222233333,'c','11-aug-04','open',456123789123);
insert into ACCOUNT(ACCOUNT_NUMBER,TYPE,DATE_CREATED,STATUS,CUSTOMER) values (123456789012345,'s','07-aug-04','open',123456789012);
insert into ACCOUNT(ACCOUNT_NUMBER,TYPE,DATE_CREATED,STATUS,CUSTOMER) values (123456789012346,'c','07-aug-04','open',123456789012);

-- transaction informations --
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000001','c',47.18,111112222233333);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000002','c',84.19,098765432154321);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000003','d',27.16,111112222233333);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000004','c',111.13,123456789012345);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000005','c',37.18,098765432154321);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000006','d',94.18,123456789012345);
insert into TRANSACTION(TRANSACTION_NUMBER,TYPE,AMOUNT,ACCOUNT) values ('tn1000000000007','c',37.22,123456789012346);

--  DML --
update CUSTOMER
set TELEPHONE = 2155552000
where CID = 123456789012;

-- DML --
update CUSTOMER
set DOB = '13-jun-1978'
where CID = 123456789012;

-- DML --
update ACCOUNT 
set STATUS = 'closed'
where ACCOUNT_NUMBER = 123456789012346;

-- DML -- 
update TRANSACTION
set AMOUNT = 47.18
where TRANSACTION_NUMBER = 'tn1000000000005';

-- DML --
delete from CUSTOMER
where CID = 112233445567;

-- DML --
select FIRST_NAME, LAST_NAME
from CUSTOMER
where DOB > '01-JAN-1965';

-- DML --
select
AVG(AMOUNT) as AVG_AMOUNT
from TRANSACTION;

-- DML --
select FIRST_NAME
from CUSTOMER
where FIRST_NAME like '%a%';

-- DML --
select A.CUSTOMER as 'cid', sum(T.AMOUNT) as 'total' from TRANSACTION T 
join ACCOUNT A on A.ACCOUNT_NUMBER = T.ACCOUNT -- join tables
where T.TYPE = 'c'
group by A.CUSTOMER;