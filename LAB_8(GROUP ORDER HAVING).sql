CREATE DATABASE CSE_3B_364
USE CSE_3B_364
create table SALES_DATA(
REGION VARCHAR(50),
PRODUCT VARCHAR(50),
SALES_AMOUNT INT,
YEAR INT
)
TRUNCATE TABLE SALES_DATA
 INSERT INTO SALES_DATA VALUES('North America' ,'Watch' ,1500 ,2023)
  INSERT INTO SALES_DATA VALUES('Europe' ,'Mobile', 1200, 2023)
  INSERT INTO SALES_DATA VALUES('Asia','Watch', 1800 ,2023)
  INSERT INTO SALES_DATA VALUES('North America', 'TV', 900 ,2024)
  INSERT INTO SALES_DATA VALUES('Europe' ,'Watch', 2000 ,2024)
  INSERT INTO SALES_DATA VALUES('Asia', 'Mobile' ,1000 ,2024)
  INSERT INTO SALES_DATA VALUES('North America' ,'MOBILE' ,1600 ,2023)
  INSERT INTO SALES_DATA VALUES('Europe', 'TV', 1500 ,2023)
  INSERT INTO SALES_DATA VALUES('Asia' ,'TV' ,1100 ,2024)
    INSERT INTO SALES_DATA VALUES('North America' ,'Watch' ,1700 ,2024)
	SELECT *FROM SALES_DATA
-- PART A
SELECT SUM(SALES_AMOUNT),REGION FROM SALES_DATA GROUP BY Region
SELECT AVG(SALES_AMOUNT),PRODUCT FROM SALES_DATA GROUP BY Product
SELECT MAX(SALES_AMOUNT),YEAR FROM SALES_DATA GROUP BY Year
SELECT MIN(SALES_AMOUNT),REGION, YEAR FROM SALES_DATA GROUP BY Region,YEAR
SELECT COUNT(PRODUCT),REGION FROM SALES_DATA GROUP BY REGION
SELECT SUM(SALES_AMOUNT),YEAR,PRODUCT FROM SALES_DATA GROUP BY YEAR,PRODUCT
SELECT SUM(SALES_AMOUNT),REGION FROM SALES_DATA GROUP BY Region HAVING SUM(SALES_AMOUNT)>5000
SELECT AVG(SALES_AMOUNT),PRODUCT FROM SALES_DATA GROUP BY Product HAVING AVG(SALES_AMOUNT)<10000
SELECT MAX(SALES_AMOUNT),YEAR FROM SALES_DATA GROUP BY YEAR HAVING MAX(SALES_AMOUNT)>500
SELECT count(DISTINCT product),region FROM SALES_DATA GROUP BY REGION HAVING COUNT(DISTINCT PRODUCT)>=3
SELECT MIN(SALES_AMOUNT),YEAR FROM SALES_DATA GROUP BY YEAR HAVING MIN(Sales_Amount)<1000
SELECT SUM(SALES_AMOUNT),REGION FROM SALES_DATA WHERE YEAR=2023  GROUP BY REGION 
--PART	B
SELECT COUNT(PRODUCT),YEAR,REGION FROM SALES_DATA GROUP BY YEAR,REGION ORDER BY YEAR,REGION 
SELECT MAX(SALES_AMOUNT),REGION FROM SALES_DATA GROUP BY REGION HAVING MAX(SALES_AMOUNT)>100 ORDER BY REGION
SELECT YEAR,SUM(SALES_AMOUNT) FROM SALES_DATA GROUP BY YEAR HAVING SUM(SALES_AMOUNT)<1000 ORDER BY YEAR DESC 
SELECT TOP 3 REGION,SUM(SALES_AMOUNT) FROM SALES_DATA WHERE YEAR=2024  GROUP BY REGION
--PART C
SELECT PRODUCT,AVG(SALES_AMOUNT) FROM SALES_DATA GROUP BY PRODUCT HAVING AVG(SALES_AMOUNT) BETWEEN 1000 and 2000 ORDER BY PRODUCT
SELECT YEAR,REGION,COUNT(PRODUCT) FROM SALES_DATA GROUP BY REGION,YEAR HAVING COUNT(PRODUCT)>5
SELECT REGION,AVG(SALES_AMOUNT) FROM SALES_DATA  WHERE YEAR=2023 GROUP BY REGION HAVING AVG(SALES_AMOUNT)>1500 ORDER BY AVG(SALES_AMOUNT) DESC
SELECT REGION,COUNT(PRODUCT) FROM SALES_DATA  GROUP BY REGION HAVING COUNT(PRODUCT)>1
SELECT REGION,MAX(SALES_AMOUNT) FROM SALES_DATA GROUP BY REGION 
