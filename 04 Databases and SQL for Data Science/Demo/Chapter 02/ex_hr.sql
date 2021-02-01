SELECT * FROM `departments` ORDER BY `DEPARTMENT_NAME`;

SELECT * 
FROM `employees` 
WHERE department_id IN (50,70,80)
ORDER BY DEPARTMENT_ID;

SELECT * FROM `employees` WHERE employee_id=103;
SELECT * FROM `employees` WHERE MANAGER_ID=103;

SELECT * FROM `employees` WHERE employee_id=103
UNION ALL
SELECT * FROM `employees` WHERE MANAGER_ID=103;

SELECT *
FROM employees
WHERE SALARY BETWEEN 7000 AND 10000
ORDER BY SALARY DESC;

-- cho biet luong lon nhat, nho nhat
SELECT MAX(SALARY), MIN(SALARY)
FROM employees;

-- cho biet nhan vien nao co luong lon nhat
SELECT *
FROM employees
ORDER BY SALARY DESC
LIMIT 1;

-- cho biet nhan vien nao co luong lon nhat
SELECT *
FROM employees
WHERE SALARY = (SELECT MAX(SALARY) FROM employees);

-- cho biet nhan vien nao co luong lon nhat, co luong nho nhat
SELECT *
FROM employees
WHERE SALARY = (SELECT MAX(SALARY) FROM employees)
UNION ALL
SELECT *
FROM employees
WHERE SALARY = (SELECT MIN(SALARY) FROM employees)






