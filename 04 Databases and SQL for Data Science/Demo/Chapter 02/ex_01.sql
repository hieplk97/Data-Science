CREATE TABLE NHAN_VIEN
(
  id INT PRIMARY KEY,
  ma CHAR(3),
  ten VARCHAR(50),
  ngaysinh DATE,
  gioitinh BOOLEAN,
  luong DECIMAL(8,2)  
);

INSERT INTO NHAN_VIEN VALUES(1, 'A01', 'Tuan Thanh', '1989-04-30', True, 1200.87);
INSERT INTO NHAN_VIEN VALUES(2, 'A02', 'Thanh Minh', '1987-06-10', True, 1200.87);
INSERT INTO NHAN_VIEN VALUES(3, 'A07', 'Minh Trang', '1988-04-25', False, 1000.00);
INSERT INTO NHAN_VIEN VALUES(4, 'B01', 'Thuy Ngoc', '1988-04-30', False, 1100.25);
INSERT INTO NHAN_VIEN VALUES(5, 'C01', 'Huu Loc', '1996-04-23', True, 2000.00);

-- liet ke tat ca nhan vien
SELECT * FROM NHAN_VIEN;

SELECT ma, ten, ngaysinh, gioitinh, luong
FROM nhan_vien;

SELECT ma, UPPER(ten) AS ten, DATE_FORMAT(ngaysinh,'%d/%m/%Y') AS ngaysinh, gioitinh, 
	CONCAT('$', FORMAT(luong,2)) AS luong
FROM nhan_vien;

-- liet ke cac nhan vien nam
SELECT *
FROM nhan_vien
WHERE gioitinh=True
ORDER BY luong DESC;

CREATE TABLE nv_old
AS
	SELECT * FROM nhan_vien;

-- tang luong 5% cho tat ca nhan vien
UPDATE nhan_vien
SET luong = luong + (5/100)*luong;

DELETE FROM nv_old
WHERE gioitinh=True AND luong<=1300;




