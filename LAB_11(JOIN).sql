use CSE_3B_364
CREATE TABLE STU_INFO ( Rno INT PRIMARY KEY, Name VARCHAR(50), Branch VARCHAR(2) );
CREATE TABLE RESULT ( Rno INT, SPI DECIMAL(3,1) ); 
CREATE TABLE EMPLOYEE_MASTER ( EmployeeNo VARCHAR(3) PRIMARY KEY, Name VARCHAR(50), ManagerNo VARCHAR(3) ); 
INSERT INTO STU_INFO (Rno, Name, Branch) VALUES (101, 'Raju', 'CE'),
(102, 'Amit', 'CE'), 
(103, 'Sanjay', 'ME'), 
(104, 'Neha', 'EC'), 
(105, 'Meera', 'EE'), (106, 'Mahesh', 'ME'); 
INSERT INTO RESULT (Rno, SPI) VALUES (101, 8.8), (102, 9.2), (103, 7.6), (104, 8.2), (105, 7.0), (107, 8.9); 
INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES ('E01', 'Tarun', NULL), 
('E02', 'Rohan', 'E02'), ('E03', 'Priya', 'E01'), 
('E04', 'Milan', 'E03'), ('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');  
select *from STU_INFO
SELECT *FROM RESULT
SELECT *FROM EMPLOYEE_MASTER


--Part – A:
--1. Combine information from student and result table using cross join or Cartesian product.
SELECT *FROM STU_INFO,RESULT
SELECT *FROM STU_INFO CROSS JOIN  RESULT
--2. Perform inner join on Student and Result tables.
SELECT *FROM STU_INFO JOIN RESULT ON STU_INFO.RNO=RESULT.Rno;
--3. Perform the left outer join on Student and Result tables.
SELECT *FROM STU_INFO LEFT OUTER JOIN RESULT ON STU_INFO.RNO=RESULT.Rno;
--4. Perform the right outer join on Student and Result tables.
SELECT *FROM STU_INFO RIGHT OUTER JOIN RESULT ON STU_INFO.RNO=RESULT.Rno;
--5. Perform the full outer join on Student and Result tables.
SELECT *FROM STU_INFO FULL OUTER JOIN RESULT ON STU_INFO.RNO=RESULT.Rno;
--6. Display Rno, Name, Branch and SPI of all students.
SELECT STU_INFO.RNO,STU_INFO.Name,STU_INFO.Branch,RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.Rno=RESULT.RNO
--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
SELECT STU_INFO.RNO,STU_INFO.Name,STU_INFO.Branch,RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.Rno=RESULT.RNO WHERE Branch='CE'
--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
SELECT STU_INFO.RNO,STU_INFO.Name,STU_INFO.Branch,RESULT.SPI FROM STU_INFO JOIN RESULT ON STU_INFO.Rno=RESULT.RNO WHERE BRANCH <>'EC'
--9. Display average result of each branch.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY Branch
--10. Display average result of CE and ME branch
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO WHERE BRANCH IN('CE','ME') GROUP BY Branch 
--Part – B:
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY Branch ORDER BY AVG(SPI)
--2. Display highest SPI from each branch and sort them in descending order.
SELECT STU_INFO.BRANCH , AVG(RESULT.SPI) FROM STU_INFO JOIN RESULT ON STU_INFO.RNO = RESULT.RNO GROUP BY Branch ORDER BY AVG(SPI) DESC
--Part – C:
--1. Retrieve the names of employee along with their manager’s name from the Employee table
SELECT E1.Name AS EMPLOYEE_NAME,E2.NAME AS MANAGER_NAME FROM EMPLOYEE_MASTER AS E1 LEFT JOIN EMPLOYEE_MASTER AS E2 ON E1.ManagerNo =E2.EmployeeNo 