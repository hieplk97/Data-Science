SELECT DISTINCT Medal
FROM medals;

SELECT Medal, COUNT(*)
FROM medals
GROUP BY Medal;

-- 10 quoc gia co so buy chuong nhieu nhat
SELECT CountryCode, COUNT(*) AS so_huy_chuong
FROM medals
GROUP BY CountryCode
ORDER BY so_huy_chuong DESC
LIMIT 10;

SELECT DISTINCT CountryCode
FROM medals
WHERE Medal='Gold' AND CountryCode!=''
ORDER BY CountryCode;

SELECT *
FROM country
WHERE CountryCode IN
(
    SELECT DISTINCT CountryCode
    FROM medals
    WHERE Medal='Gold' AND CountryCode!=''
)
ORDER BY CountryCode;

SELECT DISTINCT m.CountryCode, c.CountryName
FROM medals m JOIN country c ON m.CountryCode=c.CountryCode
WHERE Medal='Gold' AND m.CountryCode!=''
ORDER BY m.CountryCode;

SELECT CountryCode, Athlete
FROM medals
WHERE Medal='Gold' AND CountryCode!=''
ORDER BY CountryCode, Athlete;
