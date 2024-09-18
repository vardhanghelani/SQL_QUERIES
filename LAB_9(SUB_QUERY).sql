CREATE TABLE STUDENT_DATA (
    no INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

-- Create the ACADEMIC table
CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    Bklog INT
);

-- Create the DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);
INSERT INTO STUDENT_DATA (no, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

-- Insert data into ACADEMIC
INSERT INTO ACADEMIC (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

-- Insert data into DEPARTMENT
INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');
select *from student_data

--Part – A:
--1. Display details of students who are from computer department.
SELECT NAME FROM STUDENT_DATA WHERE DID =(SELECT DID FROM DEPARTMENT WHERE DName='COMPUTER')
--2. Displays name of students whose SPI is more than 8.
SELECT NAME FROM STUDENT_DATA WHERE NO IN(SELECT RNO FROM ACADEMIC WHERE SPI>8  )
--3. Display details of students of computer department who belongs to Rajkot city.
SELECT *FROM STUDENT_DATA WHERE CITY ='RAJKOT' AND DID=(SELECT DID FROM DEPARTMENT WHERE DName='COMPUTER')
--4. Find total number of students of electrical department.
SELECT COUNT(NAME) FROM STUDENT_DATA WHERE DID =(SELECT DID FROM DEPARTMENT WHERE DNAME='ELECTRICAL')
--5. Display name of student who is having maximum SPI.
SELECT NAME FROM STUDENT_DATA WHERE NO =(SELECT RNO FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC))
--6. Display details of students having more than 1 backlog.
SELECT NAME FROM STUDENT_DATA WHERE NO IN (SELECT RNO FROM ACADEMIC WHERE BKLOG>1)
--Part – B:
--1. Display name of students who are either from computer department or from mechanical department.
SELECT NAME FROM STUDENT_DATA WHERE DID IN(SELECT DID FROM DEPARTMENT WHERE DName IN('Mechanical','COMPUTER'))
--2. Display name of students who are in same department as 102 studying in.
SELECT NAME FROM STUDENT_DATA WHERE DID IN(SELECT DID FROM DEPARTMENT WHERE DNAME IN(SELECT DNAME FROM DEPARTMENT WHERE DID IN(SELECT DID FROM STUDENT_DATA WHERE NO=102)))
--Part – C:
--1. Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT NAME FROM STUDENT_DATA WHERE NO =(SELECT RNO FROM ACADEMIC WHERE SPI>9) AND DID=(SELECT DID FROM DEPARTMENT WHERE DName='ELECTRICAL') 
--2. Display name of student who is having second highest SPI
SELECT NAME FROM STUDENT_DATA WHERE NO=(SELECT RNO FROM ACADEMIC WHERE SPI =(SELECT TOP 1 SPI  FROM (SELECT DISTINCT TOP 2 SPI FROM ACADEMIC ORDER BY SPI DESC) AS RESULT ORDER BY SPI))
--3. Display city names whose students branch wise SPI is 9.2
SELECT DISTINCT City
FROM STUDENT_DATA WHERE no IN (SELECT Rno FROM ACADEMIC WHERE SPI = 9.2);
