SELECT *FROM DEPT;
SELECT *FROM PERSON
--Part – A:
--1. Find all persons with their department name & code.
SELECT PERSONNAME,DEPARTMENTNAME,DEPARTMENTCODE FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID;
--2. Find the person's name whose department is in C-Block.
SELECT PERSONNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE Location='C-BLOCK'
--3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PERSONNAME,SALARY,DEPARTMENTNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE CITY='JAMNAGAR'
--4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT PERSONNAME,SALARY,DEPARTMENTNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE CITY<>'RAJKOT'
--5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT PERSONNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DepartmentName='CIVIL' AND JoiningDate>'2001-8-1'
--6. Find details of all persons who belong to the computer department.
SELECT *FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID WHERE DepartmentName='COMPUTER'
--7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT PERSONNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID Where DATEDIFF(YYYY,JOININGDATE,getdate()) > 1
--8. Find department wise person counts.
SELECT COUNT(PERSONNAME),DEPARTMENTNAME FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DepartmentName
--9. Give department wise maximum & minimum salary with department name.
SELECT DEPARTMENTNAME,MAX(SALARY) AS MAXSAL,MIN(SALARY)ASMINSAL FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID GROUP BY DepartmentName
--10. Find city wise total, average, maximum and minimum salary.
SELECT CITY,MAX(SALARY) AS MAXSAL,MIN(SALARY)ASMINSAL ,AVG(SALARY)ASAVGSAL FROM PERSON  GROUP BY CITY
--11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(SALARY) FROM PERSON WHERE CITY='AHMEDABAD'
--12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
SELECT PERSONNAME +' LIVES IN '+CITY +' AND WORKS IN '+ DEPARTMENTNAME+' DEPARTMENT ' FROM PERSON JOIN DEPT ON PERSON.DepartmentID=DEPT.DepartmentID
--PART-B
--1 Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT P.PersonName+' earns '+CAST(P.Salary AS VARCHAR)+' from '+D.departmentName+' department monthly' FROM PERSON AS P JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID

--2 Find city & department wise total, average & maximum salaries.
SELECT P.City,D.DepartmentName,SUM(P.SALARY),AVG(P.SALARY),MAX(P.SALARY) FROM PERSON AS P INNER JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID GROUP BY P.City,D.DepartmentName;

--3  Find all persons who do not belong to any department.
SELECT P.PersonName FROM PERSON AS P LEFT JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID WHERE D.DepartmentID IS NULL;

--4 Find all departments whose total salary is exceeding 100000.
SELECT D.DepartmentName,SUM(P.SALARY) FROM PERSON AS P INNER JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID GROUP BY D.DepartmentName HAVING SUM(P.SALARY)>100000

--PART-C
--1 List all departments who have no person
SELECT D.DepartmentName,COUNT(P.PersonName) FROM PERSON AS P JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID GROUP BY D.DepartmentName HAVING COUNT(P.PersonName)=0;

--2 List out department names in which more than two persons are working.
SELECT D.DepartmentName,COUNT(P.PersonName) FROM PERSON AS P JOIN DEPT AS D ON P.DepartmentID=D.DepartmentID GROUP BY D.DepartmentName HAVING COUNT(P.PersonName)>2

--3 Give a 10% increment in the computer department employee’s salary. (Use Update)
Update P
SET P.SALARY=1.1*P.SALARY
FROM PERSON AS P INNER JOIN DEPT AS D
ON P.DepartmentID=D.DepartmentID
WHERE D.DepartmentName='Computer'
