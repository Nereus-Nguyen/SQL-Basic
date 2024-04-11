USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--Cú pháp chuẩn câu lệnh SELECT
-- SELECT * FROM <Table> WHERE...
--WHERE Cột IN ( Một Tập hợp nào đó )
--VD: City IN('LONDON', 'BERLIN', 'NEWYORK')  -- OR OR 

--Nếu có một câu SQL mà trả về 1 cột nhưng nhiều dòng 
-- Một cột và nhiều dòng thì ta có thể xem nó tương đương một tập hợp
-- SELECT CITY FROM EMLOYEES --> bạn được 1 loạt các thành phố
-- ta có thể nhét/ lồng 1 cột/ nhiều dòng vào trong các mệnh đề in của câu SQL bên ngoài
--* CÚ PHÁP 
-- WHERE cột IN ( Một câu SELECT trả về 1 cột nhiều dòng - Nhiêu value cùng kiểu)
----------------------------------------------------------
-- THỰC HÀNH

--1. Liệt kê các nhóm hàng 
SELECT * FROM Categories
--2. In ra các món hàng thuộc nhóm 1,6,8
SELECT *FROM Products WHERE CategoryID IN ( 1,6,8)
--3. In ra các món hàng thuộc nhóm bia/ rượu , thịt  và hải sản 
SELECT * FROM Products WHERE CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryName IN('Beverages','Meat/Poultry','Seafood'))
--4. Nhân viên quê LONDON phụ trách những đơn hàng nào
SELECT * FROM Orders WHERE EmployeeID IN (SELECT EmployeeID FROM Employees WHERE City = 'LonDon')

-- BTVN
--1. Các nhà cung cấp từ Mỹ cung cấp những măt hàng nào?
--2. Các nhà cung cấp từ Mỹ cung cấp những nhóm hàng nào?
--3. Các đơn hàng vận chuyển tới thành phố Sao Paulo được vận chuyển bởi những hãng nào
-- Các Công ty đã vận chuyển hàng tới Sao Paulo
--4. Khách hàng đến từ thành phố BerLin, LonDon, MadRid có những đơn hàng nào
-- Liệt kê các đơn hàng của khách hàng đến từ BerLin, LonDon, MidRid