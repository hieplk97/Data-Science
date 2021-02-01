SELECT `CountryCode`, COUNT(*)
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
GROUP BY `CountryCode`;

SELECT `CountryCode`, COUNT(*)
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `CountryCode`;

SELECT `CountryCode`, COUNT(*) AS dem
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `CountryCode`
ORDER BY dem DESC;

-- chi hien cac quoc gia co tong so huy chuong vang >=50

SELECT `CountryCode`, COUNT(*) AS dem
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `CountryCode`
HAVING COUNT(*)>=50
ORDER BY dem DESC;

SELECT `Gender`, COUNT(*) AS dem
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `Gender`;

SELECT `CountryCode`,`Gender`, COUNT(*) AS dem
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `CountryCode`,`Gender`
ORDER BY `CountryCode`;

-- cho biet cac quoc gia co tong so huy chuong vang tu 10 den 20
SELECT `CountryCode`, COUNT(*) AS dem
FROM `medals`
WHERE `Year`=2012 AND `CountryCode`!=''
AND `Medal`='Gold'
GROUP BY `CountryCode`
HAVING COUNT(*) BETWEEN 10 AND 20
ORDER BY dem DESC;

-- cho biet cac nhan vien co tham nien >= 10 nam
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
	YEAR(CURRENT_DATE)-YEAR(HIRE_DATE) AS tham_nien
FROM employees
WHERE YEAR(CURRENT_DATE)-YEAR(HIRE_DATE)>=10;

SELECT *
FROM
(
    SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,
        YEAR(CURRENT_DATE)-YEAR(HIRE_DATE) AS 	tham_nien
    FROM employees
) q    
WHERE tham_nien>=10;

SELECT SUM(`saleprice`)
FROM `petsale`;

SELECT SUM(`saleprice`)
FROM `petsale`
WHERE `saledate`='2020-05-29';

-- ban trong thang 6/2020
SELECT SUM(`saleprice`)
FROM `petsale`
WHERE MONTH(`saledate`)=6 AND YEAR(`saledate`)=2020;

-- kieu date
-- ban trong thang 6/2020
SELECT SUM(`saleprice`)
FROM `petsale`
WHERE `saledate` BETWEEN '2020-06-01' AND '2020-06-30';

-- kieu datetime
SELECT SUM(`saleprice`)
FROM `petsale`
WHERE `saledate` BETWEEN '2020-06-01 00:00:00' AND '2020-06-30 23:59:59';

select MIN(QUANTITY), MAX(QUANTITY) 
from PETSALE;

SELECT *
FROM petsale
WHERE `quantity`=(select MAX(QUANTITY) 
from PETSALE);

SELECT *
FROM petsale
WHERE `quantity`=(select MAX(QUANTITY) 
from PETSALE);

SELECT *
FROM petsale
WHERE `quantity`=(select MIN(QUANTITY) 
from PETSALE);

SELECT *
FROM petsale
WHERE `quantity`=(select MAX(QUANTITY) 
from PETSALE)
UNION
SELECT *
FROM petsale
WHERE `quantity`=(select MIN(QUANTITY) 
from PETSALE);

SELECT COUNT(*), SUM(SALARY), AVG(SALARY),
	MAX(SALARY), MIN(SALARY)
FROM employees;

SELECT COUNT(*), SUM(SALARY), AVG(SALARY),
	MAX(SALARY), MIN(SALARY)
FROM employees
WHERE DEPARTMENT_ID=80;

SELECT DEPARTMENT_ID, COUNT(*), SUM(SALARY), AVG(SALARY),
	MAX(SALARY), MIN(SALARY)
FROM employees
WHERE DEPARTMENT_ID !=''
GROUP BY DEPARTMENT_ID;

-- cho biet cac nhan vien nao co ngay vao lam la chu nhat
SELECT *
FROM employees
WHERE DAYOFWEEK(`HIRE_DATE`)=1;

SELECT AVG(saleprice) FROM petsale;
SELECT *
FROM petsale
WHERE saleprice> (SELECT AVG(saleprice) FROM petsale);


SELECT * 
FROM `employees` WHERE `LAST_NAME`='Kochhar';

SELECT * 
FROM `employees` WHERE `LAST_NAME`='King';


-- cho biet cac nhan vien co luong >= luong cua nhan vien co last_name la Kochhar
SELECT *
FROM employees
WHERE SALARY=(SELECT SALARY
FROM `employees` WHERE `LAST_NAME`='Kochhar');

-- cho biet cac nhan vien co luong >= luong cua nhan vien co last_name la King
SELECT *
FROM employees
WHERE SALARY=(SELECT SALARY
FROM `employees` WHERE `LAST_NAME`='King');


SELECT *
FROM employees
WHERE SALARY IN (SELECT SALARY
FROM `employees` WHERE `LAST_NAME`='King');

-- cho biet cac nhan vien co ten bi trung (last_name)
SELECT LAST_NAME, COUNT(*)
FROM employees
GROUP BY LAST_NAME
HAVING COUNT(*)>1
ORDER BY LAST_NAME;

SELECT *
FROM employees
WHERE LAST_NAME IN
(
	SELECT LAST_NAME
	FROM employees
	GROUP BY LAST_NAME
	HAVING COUNT(*)>1    
)    
ORDER BY LAST_NAME;
