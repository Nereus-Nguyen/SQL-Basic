USE NORTHWND
-----------------------------------------------------
--LÝ THUYẾT
-- DB ENGINE hổ trợ 1 loạt nhóm hàm dùng theo tác trên nhóm dòng/ cột, gôm data tính toán trên data này
-- Gom Nhóm (AGGREGATE FUNTIONS)
-- CUONT() SUM() MAX() MIN() AVG()
--* Cú Pháp Chuẩn 
--SELECT Cột..., Hàm Gom nhóm() ... FROM <Table> ...WHERE...GROUP By (Gom theo cụm cột nào)
--SELECT Cột..., Hàm Gom nhóm() ... FROM <Table> ...WHERE...GROUP By (Gom theo cụm cột nào) HAVING 
-----------------------------------------------------
--Thuc Hanh
--1. Liệt kê danh sách nhân viên 
SELECT * FROM Employees
--2, Năm sinh nào là bé nhất
SELECT MIN(BirthDate) From Employees
SELECT MAX(BirthDate) From Employees
--3. Ai sinh năm bé nhất, ai lớn tuổi nhất, in ra info 
SELECT *  FROM Employees WHERE BirthDate = (SELECT MIN(BirthDate) From Employees)
SELECT *  FROM Employees WHERE BirthDate <= ALL (SELECT (BirthDate) From Employees)
SELECT *  FROM Employees WHERE BirthDate <= ALL (SELECT MIN(BirthDate) From Employees)

--4.1 Trọng lượng nào là lớn nhất trong các đơn hàng đã bán
SELECT *FROM Orders ORDER By Freight DESC
SELECT *FROM Orders WHERE Freight = (SELECT Max(Freight) FROM Orders)
--4.2 trong các đơn hàng, đơn hàng nào có trọng lượng nặng nhất/ nhỏ nhất

--5. Tính tổng khối lượng các đơn hàng đã vận chuyển 
SELECT *FROM Orders
SELECT COUNT(*) FROM Orders
SELECT SUM(Freight) AS[Freight in total] FROM Orders

--6 Trung Bình cac đơn hàng nặng bao nhiêu
SELECT AVG(Freight) AS[Freight in total] FROM Orders

--7 Liệt kê các đơn hang có trọng lượng nặng hơn trọng lượng trung bình
SELECT * FROM Orders WHERE Freight >= (SELECT AVG(Freight) FROM Orders)

--8 có bao nhiêu đơn hàng nặng hơn trọng lượng trung bình của tất cả 
SELECT COUNT(*) FROM Orders WHERE Freight >= (SELECT AVG(Freight) FROM Orders)


--Ôn tập Thêm
--1. Đếm xem mỗi khu vực có bao nhiêu nhân viên
SELECT COUNT(*) FROM Employees GROUP BY Region
SELECT COUNT(Region) FROM Employees GROUP BY Region

SELECT Region ,COUNT(Region) FROM Employees GROUP BY Region -- Sai do đếm NULL
SELECT Region ,COUNT(*) FROM Employees GROUP BY Region -- đúng do đếm dòng

--3. Khảo sát đơn hàng
SELECT * FROM Orders
-- Mỗi quốc gia có bao nhiêu đơn hàng 
SELECT ShipCountry ,COUNT(*) FROM Orders GROUP BY ShipCountry
--4. Quốc gia nào từ 100 đơn hàng trở lên
SELECT ShipCountry ,COUNT(*) FROM Orders GROUP BY ShipCountry HAVING COUNT(*) >= 100
--5. Quốc gia nào có nhiều đơn hang nhất
--6. Liệt kê các đơn hàng của K/H mã sô VINET 
SELECT * FROM Orders WHERE CustomerID = 'VINET'

--7. K/H VINET đã mua bao nhiêu lần ?
SELECT CustomerID ,COUNT(*) FROM Orders WHERE CustomerID ='VINET' GROUP BY CustomerID

SELECT CustomerID ,COUNT(*) FROM Orders GROUP BY CustomerID HAVING CustomerID = 'VINET'


