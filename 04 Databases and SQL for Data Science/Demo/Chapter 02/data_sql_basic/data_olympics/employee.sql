Create table `employee` (
	id int primary key,
    ma char(3),
    ten varchar(50),
    ngaysinh date,
    gioitinh bit,
    luong decimal(8,2)
);

INSERT INTO `employee`.`employee` (`id`, `ma`, `ten`, `ngaysinh`, `gioitinh`, `luong`) VALUES (100, 001, 'Steven King', '2003-06-17' ,true,24000.00);
INSERT INTO `employee`.`employee` (`id`, `ma`, `ten`, `ngaysinh`, `gioitinh`, `luong`) VALUES (101, '002', 'Neena Kochhar', '2003-06-17' ,true,17000.00);
INSERT INTO `employee`.`employee` (`id`, `ma`, `ten`, `ngaysinh`, `gioitinh`, `luong`) VALUES (102, '003', 'Lex De Haan', '2003-06-17' ,true,9000.00);
INSERT INTO `employee`.`employee` (`id`, `ma`, `ten`, `ngaysinh`, `gioitinh`, `luong`) VALUES (103, '004', 'Alexander Hunold', '2003-06-17' ,true,6000.00);
INSERT INTO `employee`.`employee` (`id`, `ma`, `ten`, `ngaysinh`, `gioitinh`, `luong`) VALUES (104, '005', 'Bruce Ernst', '2003-06-17' ,true,4800.00);

DELETE FROM `employee`.`employee` WHERE (`gioitinh`=1 AND `luong`<=10000);