use  CSE_5A_196
CREATE TABLE PersonInfo (
 PersonID INT PRIMARY KEY,
 PersonName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8,2) NOT NULL,
 JoiningDate DATETIME NULL,
 City VARCHAR(100) NOT NULL,
 Age INT NULL,
 BirthDate DATETIME NOT NULL
);
-- Creating PersonLog Table
CREATE TABLE PersonLog (
 PLogID INT PRIMARY KEY IDENTITY (1,1) ,
 PersonID INT NOT NULL,
 PersonName VARCHAR(250) NOT NULL,
 Operation VARCHAR(50) NOT NULL,
 UpdateDate DATETIME NOT NULL
);
DROP TABLE PersonLog
--Part – A 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
--a message “Record is Affected.”  
Create Trigger Tr_Record_Affected
on PersonInfo
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT'RECORD IS AFFECTED'
END
--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog.
CREATE TRIGGER TR_INSERT_LOG
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM inserted;
	SELECT @PERSONNAME=PersonName FROM inserted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'INSERT',GETDATE());
	END


	CREATE TRIGGER TR_UPDATE_LOG
ON PERSONINFO
AFTER UPDATE
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM inserted;
	SELECT @PERSONNAME=PersonName FROM inserted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'UPDATE',GETDATE());
	END



	CREATE TRIGGER TR_DELETE_LOG
ON PERSONINFO
AFTER DELETE
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM deleted;
	SELECT @PERSONNAME=PersonName FROM deleted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'DELETE',GETDATE());
	END
--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog. 
Create Trigger Tr_Record_Affected
on PersonInfo
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
	PRINT'RECORD IS AFFECTED'
END
--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog.
CREATE TRIGGER TR_INSERT_INSTEAD_LOG
ON PERSONINFO
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM inserted;
	SELECT @PERSONNAME=PersonName FROM inserted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'INSERT',GETDATE());
	END


	CREATE TRIGGER TR_UPDATE_INSTEADOF_LOG
ON PERSONINFO
INSTEAD OF UPDATE
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM inserted;
	SELECT @PERSONNAME=PersonName FROM inserted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'UPDATE',GETDATE());
	END



	CREATE TRIGGER TR_DELETE_INSTEADOF_LOG
ON PERSONINFO
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);

	SELECT @PERSONID=PERSONID FROM deleted;
	SELECT @PERSONNAME=PersonName FROM deleted;

	INSERT INTO PersonLog VALUES(@PERSONID,@PERSONNAME,'DELETE',GETDATE());
	END
--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
--uppercase whenever the record is inserted. 
CREATE TRIGGER TR_INSERT_UPPER_LOG
ON PERSONINFO
AFTER INSERT
AS
BEGIN
	DECLARE @PERSONID INT;
	DECLARE @PERSONNAME VARCHAR(100);
	
	SELECT @PERSONID=PERSONID FROM inserted;
	SELECT @PERSONNAME=PERSONNAME FROM inserted;

		UPDATE PersonInfo SET PersonName=UPPER(@PERSONNAME) WHERE PersonID=@PERSONID;
	END

DROP  TRIGGER Tr_Record_Affected
--5. Create trigger that prevent duplicate entries of person name on PersonInfo table. 
create trigger tr_prevent_duplicate
on personinfo
instead of insert
as
begin
	INSERT INTO PersonInfo(PersonID,PersonName,SALARY,JoiningDate,City,Age,BirthDate)
	SELECT 
	PersonID,PersonName,Salary,JoiningDate,City,Age,BirthDate
	FROM inserted
	WHERE PersonName NOT IN( SELECT PERSONNAME FROM PersonInfo)

END

--6. Create trigger that prevent Age below 18 years.
