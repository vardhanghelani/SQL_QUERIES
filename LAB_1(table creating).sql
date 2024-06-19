CREATE DATABASE CSE_3B_364

CREATE TABLE DEPOSIT(
ACTNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2),
ADATE DATETIME );

CREATE TABLE BRANCH(
BNAME VARCHAR(50),
CITY VARCHAR(50)
);

CREATE TABLE CUSTOMERS(
CANME VARCHAR(50),
CITY VARCHAR(50));

CREATE TABLE BORROW(
LOANNO INT,
CNAME VARCHAR(50),
BNAME VARCHAR(50),
AMOUNT DECIMAL(8,2));

INSERT INTO DEPOSIT VALUES(101,'ANIL','VREC',1000,'1995-3-1')
SELECT *FROM DEPOSIT
INSERT INTO DEPOSIT VALUES(102,'SUNIL','AJNI',5000,'1996-1-4')
INSERT INTO DEPOSIT VALUES(103,'MEHUL','KABOLIBAGH',3500,'1995-11-17')
INSERT INTO DEPOSIT VALUES(104,'MADHURI','CHANDNI',1200,'1995-12-17')
INSERT INTO DEPOSIT VALUES(105,'PRAMOD','M.G ROAD',3000,'1996-3-27')
INSERT INTO DEPOSIT VALUES(106,'SANDEEP','ANDHERI',2000,'1996-3-31')
INSERT INTO DEPOSIT VALUES(107,'SHIVANI','VIRAR',1000,'1995-9-5')
INSERT INTO DEPOSIT VALUES(108,'KRANTI','NEHRU PLACE',5000,'1995-7-2')
INSERT INTO DEPOSIT VALUES(109,'MINU','POWAI',7000,'1995-8-10')

INSERT INTO BRANCH VALUES ('VRCE','NAGPUR')
SELECT *FROM BRANCH
INSERT INTO BRANCH VALUES ('AJNI','NAGPUR')
INSERT INTO BRANCH VALUES ('KAROLIBAUGH','DELHI')
INSERT INTO BRANCH VALUES ('CHANDI','DELHI')
INSERT INTO BRANCH VALUES ('DHARAMPETH','NAGPUR')
INSERT INTO BRANCH VALUES ('M.G ROAD','BANGLORE')
INSERT INTO BRANCH VALUES ('ANDHERI','BOMBAY')
INSERT INTO BRANCH VALUES ('VIRAR','BOMBAY')
INSERT INTO BRANCH VALUES ('NEHRU PLACE','DELHI')
INSERT INTO BRANCH VALUES ('POWAI','BOMBAY')

 SELECT CNAME,ACTNO,AMOUNT FROM   DEPOSIT
 SELECT LOANNO,AMOUNT FROM BORROW
