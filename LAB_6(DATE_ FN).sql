--Part  A:


--1. Write a query to display the current date & time. Label the column Today_Date.
select GETDATE() as Today_Date;

--2. Write a query to find new date after 365 day with reference to today.
select GETDATE() + 365;

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
select convert(varchar, getdate(),105);

--4. Display the current date in a format that appears as 03 Jan 1995.
select convert(varchar, getdate(),7);

--5. Display the current date in a format that appears as Jan 04, 96.
select convert(varchar, getdate(), 107);

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
select DATEDIFF(m, '31-dec-08', '31-mar-09');

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
select DATEDIFF(yyyy, '25-jan-12', '14-sep-10');

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
select DATEDIFF(hh, '25-jan-12 7:00', '26-jan-12 10:30');

--9. Write a query to extract Day, Month, Year from given date 12-May-16.
select DATEPART(day, '12-may-16');
select DATEPART(month, '12-may-16');
select DATEPART(year, '12-may-16');

select DATENAME(day, '12-may-16');
select DATENAME(month, '12-may-16');
select DATENAME(year, '12-may-16');

--10. Write a query that adds 5 years to current date.
select DATEADD(year, 5, getdate());

--11. Write a query to subtract 2 months from current date.
select DATEADD(month, -2, getdate());

--12. Extract month from current date using datename () and datepart () function.
select datepart(mm, getdate());
select datename(mm, getdate());

--13. Write a query to find out last date of current month.
select EOMONTH(getdate());

--14. Calculate your age in years and months.
select datediff(year, '28-jan-2006', getdate()) as years, datediff(month, '28-jan-2024', getdate()) as months;


--Part  B: 

--Create a table EMP_DETAIL and insert the following records in the table.

create table EMP_DETAIL(
	EmpNo int,
	EmpName varchar(50),
	JoiningDate date,
	Salary decimal(12, 2),
	City varchar(20)
);

insert into EMP_DETAIL values
(101, 'Keyur', '02-1-15', 12000, 'Rajkot'),
(102, 'Hardik', '04-2-15', 14000, 'Ahmedabad'),
(103, 'Kajal', '06-3-14', 15000, 'Baroda'),
(104, 'Bhoomi', '05-6-23', 12500, 'Ahmedabad'),
(105, 'Harmit', '04-2-15', 14000, 'Rajkot'),
(106, 'Jay', '07-3-12', 12000, 'Surat');

select * from EMP_DETAIL;

--1. Write a query to find new date after 365 day with reference to JoiningDate.
select dateadd(day, 365, joiningdate)
from EMP_DETAIL;

--2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
select convert(varchar, joiningdate, 100)
from EMP_DETAIL;

--3. Display the JoiningDate in a format that appears as 03 Jan 1995.
select convert(varchar, joiningdate, 106)
from EMP_DETAIL;

--4. Display the JoiningDate in a format that appears as Jan 04, 96.
select convert(varchar, joiningdate, 107)
from EMP_DETAIL;

--5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
select DATEDIFF(mm, '31-mar-09', joiningdate)
from EMP_DETAIL;

--6. Write a query to find out total number of years between JoiningDate and 14-Sep-10.
select datediff(yyyy, '14-sep-10', joiningdate)
from EMP_DETAIL;


--Part  C: 

--1. Write a query to extract Day, Month, Year from JoiningDate.
select datepart(day, joiningdate) as Day, datename(month, joiningdate) as Month, datepart(year, joiningdate) as Year
from EMP_DETAIL;

--2. Write a query that adds 5 years to JoiningDate.
select dateadd(year, 5, joiningdate)
from EMP_DETAIL;

--3. Write a query to subtract 2 months from JoiningDate.
select dateadd(month, -2, joiningdate)
from EMP_DETAIL;

--4. Extract month from JoiningDate using datename () and datepart () function.
select datepart(month, joiningdate), datename(month, joiningdate)
from EMP_DETAIL;

--5. Calculate your age in years and months.
select datediff(year, '28-jan-2006', getdate()) as Years, datediff(month, '28-jan-2024', getdate()) as Month;