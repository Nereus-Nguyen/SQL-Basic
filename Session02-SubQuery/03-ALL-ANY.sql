USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--Cú pháp chuẩn câu lệnh SELECT
-- SELECT * FROM <Table> WHERE...
--WHERE cột toán tử so sánh với value cần lọc 
--		cột  > >= <= = != 
--							dùng câu sub-query tùy ngữ cảnh 
--		cột					= (sub chỉ có 1 value)
--		Cột					IN(Sub chỉ có 1 cột nhưng nhiều value)
--		Cột					> >= < <= ALL ( 1 Sub 1 cột nhiều value )
--									ALL ( 1 Sub 1 cột nhiều value )
----------------------------------------------------------
--THỰC HÀNH 
--
CREATE TABLE Num  (
Numbr int 
)
SELECT *FROM Num
INSERT INTO Num values (1)
INSERT INTO Num values (1)
INSERT INTO Num values (2)
INSERT INTO Num values (9)
INSERT INTO Num values (5)
INSERT INTO Num values (100)
INSERT INTO Num values (101)

--1. In ra nhung so lon hon 5
SELECT * FROM Num WHERE Numbr >5
--2. In ra sô lớn nhất trong các số đã nhập
SELECT *FROM Num Where Numbr >= ALL(SELECT *FROM Num)
--3. In ra sô nho nhat trong các số đã nhập
SELECT *FROM Num Where Numbr <= ALL(SELECT *FROM Num)

--4. Nhân viên nào lớn tuổi nhất 
SELECT *FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)
--5. Đơn hàng có trọng lượng nặng nhất 
SELECT *FROM Orders WHERE Freight <= ALL (SELECT Freight FROM Orders)

