CREATE TABLE EMP (
EID INT,
ENAME VARCHAR(30),
DEPARTMENT VARCHAR (35),
SALARY INT,
JOININGDATE DATE,
CITY VARCHAR(50))
INSERT INTO EMP VALUES (101,'Rahul', 'Admin', 56000,'1990-1-1','Rajkot')
INSERT INTO EMP VALUES (102,'Hardik','IT', 18000, '1990-9-25','Ahmedabad')
INSERT INTO EMP VALUES (103,'Bhavin', 'HR', 25000, '1991-5-14', 'Baroda')
INSERT INTO EMP VALUES (104 ,'Bhoomi' ,'Admin' ,39000 ,'1991-2-8' ,'Rajkot')
INSERT INTO EMP VALUES (105, 'Rohit', 'IT',17000 ,'1990-7-23', 'Jamnagar')
INSERT INTO EMP VALUES (106 ,'Priya','IT',9000 ,'1990-10-18' ,'Ahmedabad')
INSERT INTO EMP VALUES (107 ,'Bhoomi' ,'HR' ,34000 ,'1991-12-25' ,'Rajkot')
select *from emp
TRUNCATE TABLE EMP

--part A
--SELECT COUNT(EID) AS EMP_COUNT ,CITY FROM EMP GROUP  BY CITY
SELECT MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY FROM EMP
SELECT SUM(SALARY) AS Total_Sal ,AVG(SALARY) AS Average_Sal FROM EMP    
SELECT COUNT(EID)AS TOTAL_EMP FROM EMP  
SELECT MAX(SALARY)AS MAX_SLARY FROM  EMP WHERE CITY='RAJKOT'
SELECT MAX(SALARY)AS MAX_SLARY FROM  EMP WHERE DEPARTMENT='IT'        
SELECT COUNT(EID) AS NO_EID FROM EMP WHERE JOININGDATE>'1991-2-8'
SELECT AVG(SALARY) FROM EMP WHERE DEPARTMENT='ADMIN'
SELECT SUM(SALARY) FROM  EMP WHERE DEPARTMENT='HR'
SELECT   COUNT(DISTINCT CITY) FROM EMP
SELECT  COUNT (DISTINCT DEPARTMENT) FROM EMP
SELECT  MIN(SALARY) FROM EMP WHERE CITY='Ahmedabad'
SELECT MAX(SALARY),CITY FROM EMP GROUP BY CITY
SELECT MIN(SALARY),DEPARTMENT FROM EMP GROUP BY DEPARTMENT
SELECT COUNT(EID),CITY FROM EMP GROUP BY CITY
SELECT SUM(SALARY),DEPARTMENT FROM EMP GROUP BY DEPARTMENT
SELECT AVG(SALARY) FROM EMP GROUP BY DEPARTMENT

--PART B
SELECT COUNT(EID) FROM EMP WHERE CITY='RAJKOT'
SELECT MAX(SALARY) - MIN(SALARY)AS DIFFERENCE FROM EMP
SELECT COUNT(EID) FROM EMP WHERE JOININGDATE<'1991-1-1'

--PART C
SELECT COUNT(EID) FROM EMP WHERE CITY IN ('RAJKOT','BARODA')
SELECT COUNT(EID) FROM EMP WHERE DEPARTMENT='IT' AND JOININGDATE<'1991-1-1'
SELECT SUM(SALARY),JOININGDATE FROM EMP GROUP BY JOININGDATE 
SELECT MAX(SALARY),DEPARTMENT,CITY FROM EMP WHERE CITY LIKE 'R%' GROUP BY DEPARTMENT,CITY