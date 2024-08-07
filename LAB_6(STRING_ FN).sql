--PART – A:
--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL),LEN('HELLO'),LEN('')
--2. Display your name in lower & upper case.
SELECT UPPER('VARDHAN'),LOWER('VARDHAN')
--3. Display first three characters of your name.
SELECT SUBSTRING('VARDHAN',1,3)
--4. Display 3rd to 10th character of your name.
SELECT SUBSTRING('VARDHAN',3,1) ,SUBSTRING('VARDHAN',10,1)
--5. Write a query to convert ‘abc123efg’ to ‘abcxyzefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg','123','xyz'),REPLACE('abcabcabc','C','5')
--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a'), ASCII('A'), ASCII('z'), ASCII('Z'), ASCII('0'), ASCII('9')
--7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),CHAR(57)
--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
SELECT RTRIM('HELLO WORLD  ')
--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
SELECT LTRIM(' HELLO WORLD')
--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT SUBSTRING('SQL SERVER',1,4),SUBSTRING('SQL SERVER',6,5)
--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
SELECT CAST(1234.56 AS INT)
--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT)
--13. Put 10 space before your name using function.
SELECT CONVERT(INT, 10.58)

SELECT SPACE(10)+'KAVYAM'

SELECT CONCAT('KAVYAM','JOSHI'),'KAVYAM'+'JOSHI'

SELECT REVERSE('DARSHAN')

SELECT REPLICATE('KAVYAM',3)

---PART-B---	

CREATE TABLE STUDENT(
StuID INT,
FirstName  VARCHAR(25),
LastName VARCHAR(25),
Website VARCHAR(50),
City  VARCHAR(25),
Address VARCHAR(100)
);
SELECT *FROM STUDENT

INSERT INTO STUDENT VALUES(1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ‘Vasant Kunj’,Rajkot')
INSERT INTO STUDENT VALUES(1022,'Hardik','Shah','digminecraft.com','Ahmedabad','"Ram Krupa",Raiya Road')
INSERT INTO STUDENT VALUES(1033,'Kajal','Trivedi','bigactivities.com','Baroda','Raj bhavan plot, near garden')
INSERT INTO STUDENT VALUES(1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','“Jig’s Home”, Narol')
INSERT INTO STUDENT VALUES(1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55,Raj Residency')
INSERT INTO STUDENT VALUES(1066,'Ashok','Jani',NULl,'Baroda','A502,Club House Building')


SELECT LEN('FirstName'),LEN('LastName') 

SELECT UPPER(FirstName),LOWER(LastName) from student

SELECT LEFT(FirstName,3) FROM STUDENT

SELECT SUBSTRING(Website,3,8) FROM STUDENT

SELECT LEFT(Website,4),RIGHT(Website,5) from STUDENT

----part-c-----
select space(10)+ FirstName from STUDENT

select CONCAT(FirstName,LastNAME), FirstName+LastNAME FROM STUDENT

SELECT CONCAT(FirstName,LastNAME,Website,City,Address),FirstName+LastNAME+Website+City+Address FROM STUDENT

SELECT REVERSE(Firstname) FROM STUDENT

SELECT Replicate(Firstname,3) FROM STUDENT

select FirstNAME FROM STUDENT WHERE LEN(FirstNAME)=5

SELECT CONCAT(FirstNAME,'LIVES IN','CITY') FROM STUDENT

SELECT CONCAT(FirstNAME,' IS ',STUID) FROM STUDENT
