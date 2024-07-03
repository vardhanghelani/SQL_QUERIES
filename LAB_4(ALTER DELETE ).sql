-- alter operation
-- part a
ALTER TABLE DEPOSIT ADD CITY VARCHAR(50),PINCODE INT 
SELECT*FROM deposit_detail
ALTER TABLE DEPOSIT ALTER COLUMN CNAME VARCHAR(35);
alter table deposit alter column amount int
alter table deposit alter column amount int
SP_RENAME 'DEPOSI'
sp_rename 'deposit','deposit_detail'
alter table deposit_detail drop column city
--part b
SP_RENAME 'deposit_detail.ADATE','AOPENDATE','COLUMN'
ALTER TABLE deposit_detail DROP COLUMN AOPENDATE
SP_RENAME 'deposit_detail.CNAME','COUSTOMER_NAME'
--PART C
CREATE TABLE STUDENT_DETAIL  (
Enrollment_No VARCHAR(20),
Name VARCHAR(25),
CPI DECIMAL(5,2),Birthdate DATETIME
)
SELECT *FROM STUDENT_DETAIL

ALTER TABLE STUDENT_DETAIL ADD CITY VARCHAR(20)NOT NULL , Backlog INT
ALTER TABLE STUDENT_DETAIL ALTER COLUMN CPI INT
SP_RENAME 'STUDENT_DETAIL.Enrollment_No' ,'ENO'
ALTER TABLE STUDENT_DETAIL DROP COLUMN CITY
SP_RENAME 'STUDENT_DETAIL',' STUDENT_MASTER'
