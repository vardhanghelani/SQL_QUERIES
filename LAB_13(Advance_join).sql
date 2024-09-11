---------------------------- LAB 13 -----------------------------------------------------

--Advanced level Joins --



CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

--1. Display all the villages of Rajkot city
select village.Name from Village join city on Village.CityID=City.CityID where city.CityID=1; 
--2. Display city along with their villages & pin code.
select village.Name as village,city.Name as city,city.Pincode from Village join city on Village.CityID=City.CityID; 
--3. Display the city having more than one village.
select city.Name,count(village.vid) from Village join city on Village.CityID=City.CityID group by city.Name having count(Village.VID)>1; 
--4. Display the city having no village.
select city.Name,count(village.vid) from city left outer join village on Village.CityID=City.CityID group by city.Name having count(Village.VID)=0;
--5. Count the total number of villages in each city.
select city.Name,count(village.vid) from city left outer join village on Village.CityID=City.CityID group by city.Name
--6. Count the number of cities having more than one village.
select count(city.CityID) from city  right outer join village on Village.CityID=City.CityID group by city.Name having count(village.CityID)>1;
--Create below table with following constraints
--1. Do not allow SPI more than 10
--2. Do not allow Bklog less than 0.
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.
CREATE TABLE STU_MASTER(
RNO INT  PRIMARY KEY,
NAME VARCHAR(50),
BRANCH VARCHAR(50) DEFAULT'GENERAL',
SPI DECIMAL(8,2) CHECK(SPI<=10),
BKLOG DECIMAL(8,2) CHECK(BKLOG>=0)
)
INSERT INTO STU_MASTER VALUES(101,'Raju' ,'CE' ,8.80,0)
INSERT INTO STU_MASTER VALUES(102, 'Amit', 'CE' ,2.20, 3)
INSERT INTO STU_MASTER VALUES(103, 'Sanjay' ,'ME' ,1.50, 6)
INSERT INTO STU_MASTER VALUES(104, 'Neha' ,'EC', 7.65, 0)
INSERT INTO STU_MASTER VALUES(105, 'Meera' ,'EE', 5.52, 2)
INSERT INTO STU_MASTER VALUES(106, 'Mahesh', DEFAULT,4.50, 3)
SELECT *FROM STU_MASTER
--4. Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER SET SPI=12 WHERE NAME='RAJU' 
--5. Try to update Bklog of Neha from 0 to -1.
UPDATE STU_MASTER SET BKLOG=-1 WHERE NAME='NEHA' 
--Part – B: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_details(Did, Dname)
--City_details(Cid, Cname)
--Part – C: Create table as per following schema with proper validation and try to insert data which violate your
--validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
--2. Insert 5 records in each table.
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all
--employees.

