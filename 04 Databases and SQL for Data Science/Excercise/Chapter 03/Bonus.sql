-- Cho biet cac nhan vien co luong > trung binh luong cua phong

-- Cach 1: su dung truy van ket hop
SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.SALARY
FROM employees e
WHERE e.SALARY > (SELECT AVG(SALARY) FROM employees WHERE DEPARTMENT_ID=e.DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID, SALARY DESC;

-- Cach 2: su dung truy van con
SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.SALARY, q.`avg_sal`
FROM employees e JOIN (SELECT DEPARTMENT_ID, AVG(SALARY) AS 'avg_sal' FROM employees GROUP BY DEPARTMENT_ID) q
ON e.DEPARTMENT_ID=q.DEPARTMENT_ID
WHERE e.SALARY > q.`avg_sal`
ORDER BY e.DEPARTMENT_ID, e.SALARY DESC;

-- Cach3: su dung bang ao (VIEW)
CREATE VIEW avg_sal_view 
AS SELECT DEPARTMENT_ID, AVG(SALARY) AS 'avg_sal' FROM employees GROUP BY DEPARTMENT_ID;

SELECT e.DEPARTMENT_ID, e.LAST_NAME, e.SALARY, q.`avg_sal`
FROM employees e JOIN avg_sal_view q
ON e.DEPARTMENT_ID=q.DEPARTMENT_ID
WHERE e.SALARY > q.`avg_sal`
ORDER BY e.DEPARTMENT_ID, e.SALARY DESC;