-- 1a 
SELECT orderid AS 'Mã đơn hàng', custid AS 'Mã khách hàng', empid AS 'Mã nhân viên',
orderdate AS 'Ngày đặt hàng',shippeddate AS 'Ngày giao hàng', shipcountry AS 'Quốc gia'
FROM orders 
WHERE orderdate BETWEEN '2008-01-01' AND '2008-07-01'
ORDER BY orderdate DESC;

-- 1b
SELECT orderid AS 'Mã đơn hàng', custid AS 'Mã khách hàng', empid AS 'Mã nhân viên',
orderdate AS 'Ngày đặt hàng', shippeddate AS 'Ngày giao hàng', shipcountry AS 'Quốc gia'
FROM orders 
WHERE shipcountry='Germany' AND (orderdate BETWEEN '2007-05-31' AND '2007-07-01');

-- 1c
SELECT custid AS 'Mã khách hàng', contactname AS 'Tên người liên lạc', city AS 'Thành phố', phone AS 'Điện thoại'
FROM productshipping.customers
WHERE city RLIKE '^[SOR]'
ORDER BY contactname ASC;

-- 1d
SELECT custid AS 'Mã khách hàng', contactname AS 'Tên người liên lạc', city AS 'Thành phố', phone AS 'Điện thoại'
FROM productshipping.customers
WHERE city NOT RLIKE '^[SOR]'
ORDER BY contactname ASC;

-- 1e
SELECT custid AS 'Mã khách hàng', contactname AS 'Tên người liên lạc', city AS 'Thành phố', phone AS 'Điện thoại'
FROM productshipping.customers
WHERE SUBSTR(city, 2, 1) = 'y'
ORDER BY contactname ASC;

-- 1f
SELECT custid AS 'Mã khách hàng', contactname AS 'Tên người liên lạc', city AS 'Thành phố', phone AS 'Điện thoại'
FROM productshipping.customers
WHERE RIGHT(city,1) = 'o'
ORDER BY city ASC;

-- 1g
SELECT custid AS 'Mã khách hàng', contactname AS 'Tên người liên lạc', city AS 'Thành phố', phone AS 'Điện thoại'
FROM productshipping.customers
WHERE RIGHT(city,2) = 'on'
ORDER BY city ASC;

-- 1h
SELECT e.empid AS 'Mã nhân viên', e.lastname AS 'Tên nhân viên', e.mgrid AS 'Mã quản lý' , m.lastname  AS 'Tên quản lý'
FROM productshipping.employees e LEFT JOIN productshipping.employees m ON e.mgrid=m.empid
ORDER BY e.mgrid;

-- 1i
SELECT e.empid AS 'Mã nhân viên', e.lastname AS 'Tên nhân viên', e.mgrid AS 'Mã quản lý' , m.lastname  AS 'Tên quản lý'
FROM productshipping.employees e LEFT JOIN productshipping.employees m ON e.mgrid=m.empid
WHERE e.mgrid IS NOT NULL
ORDER BY e.mgrid;

-- 1j
SELECT * 
FROM productshipping.products 
WHERE productid NOT IN (SELECT DISTINCT productid FROM productshipping.orderdetails);

-- 1k
SELECT * 
FROM productshipping.employees
WHERE empid NOT IN (SELECT DISTINCT empid FROM productshipping.orders);

-- 1l
SELECT custid AS 'Mã khách hàng', orderid AS 'Mã đơn hàng', employees.firstname AS 'Tên nhân viên',
orderdate AS 'Ngày đặt hàng',shippeddate AS 'Ngày giao hàng', shipcountry AS 'Quốc gia'
FROM orders JOIN employees ON orders.empid=employees.empid
WHERE orderdate BETWEEN '2008-01-01' AND '2008-07-01'
ORDER BY orderdate DESC;

-- 2a
SELECT productid, productname, unitprice,
	CASE
    		WHEN Unitprice < 20 THEN 'Thấp'
        	WHEN Unitprice < 40 THEN 'Trung bình'
        	ELSE 'Cao'
    END AS 'Giá'
FROM products;

-- 2b
SELECT productid, SUM(unitprice*qty) AS 'Giá trị'
FROM orderdetails
GROUP BY productid
HAVING SUM(unitprice*qty)>11000;

-- 2c
SELECT d.productid, p.productname, COUNT(*) AS dem
FROM orderdetails d JOIN 	p ON d.productid=p.productid
GROUP BY d.productid, p.productname
ORDER BY dem DESC
LIMIT 1;

-- 3a
SELECT SUM(CASE WHEN YEAR(orders.orderdate)='2005' THEN 1 ELSE 0 END ) AS 'Năm 2005',
SUM(CASE WHEN YEAR(orders.orderdate)='2006' THEN 1 ELSE 0 END ) AS 'Năm 2006',
SUM(CASE WHEN YEAR(orders.orderdate)='2007' THEN 1 ELSE 0 END ) AS 'Năm 2007',
SUM(CASE WHEN YEAR(orders.orderdate)='2008' THEN 1 ELSE 0 END ) AS 'Năm 2008',
SUM(CASE WHEN YEAR(orders.orderdate)>='2005' AND YEAR(orders.orderdate)<='2008' THEN 1 ELSE 0 END) AS 'Tổng'  FROM orders;

-- 3b
SELECT orders.empid AS 'Mã nhân viên', 
SUM(CASE WHEN YEAR(orders.orderdate)='2005' THEN 1 ELSE 0 END ) AS 'Năm 2005',
SUM(CASE WHEN YEAR(orders.orderdate)='2006' THEN 1 ELSE 0 END ) AS 'Năm 2006',
SUM(CASE WHEN YEAR(orders.orderdate)='2007' THEN 1 ELSE 0 END ) AS 'Năm 2007',
SUM(CASE WHEN YEAR(orders.orderdate)='2008' THEN 1 ELSE 0 END ) AS 'Năm 2008',
SUM(CASE WHEN YEAR(orders.orderdate)>='2005' AND YEAR(orders.orderdate)<='2008' THEN 1 ELSE 0 END) AS 'Tổng' 
FROM orders 
GROUP BY orders.empid
ORDER BY orders.empid ASC;

-- 4a
SELECT empid AS 'Mã nhân viên', CONCAT(firstname,' ',lastname) AS 'Họ và tên',
	title AS 'Chức danh', DATE_FORMAT(hiredate, "%d/%m/%Y") AS 'Ngày vào làm'
FROM employees;

-- 4b
SELECT DISTINCT title AS 'Chức danh'
FROM employees;

-- 4c
SELECT productid AS 'Mã hàng hóa', LPAD(productid, 10, 0) AS 'Mã hàng hóa mới'
FROM products;

-- 5a
SELECT *
FROM orders 
WHERE orderdate BETWEEN '2008-01-01' AND '2008-06-30'
ORDER BY `orderdate` DESC;

-- 5b
SELECT *
FROM orders 
WHERE MONTH(orderdate)=6 AND YEAR(orderdate)=2007 AND shipcountry='Germany';
