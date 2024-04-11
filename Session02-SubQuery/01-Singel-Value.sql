USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--Cú pháp chuẩn câu lệnh SELECT
-- SELECT * FROM <Table> WHERE...
-- WHERE Cột LIKE PATTERN nào đó '_____'
--WHERE cột BETWEEN RANGE
--WHERE Cột IN (tập giá trị liệt kê)
-- Một câu SELECT tùy cách viết có thể trả về đúng 1 VALUE/CELL
-- Một câu SELECT tùy cách viết có thể trả về đúng 1 tập giá trị / CELL
-- ***
--WHERE Cột = VALUE nào đó - đã học, e.g YEAR(DOB) = 2004
--			= thay VALUE này = 1 câu SQL khác miễn trả về 1 CEll 
-- Kĩ thuật viết SQL theo kiểu hỏi gián tiếp, Lồng nhau, Trong câu SQL chứa câu SQL khác
----------------------------------------------------------
-- THỰC HÀNH
--1. iN RA danh sách nhân viên 
SELECT *FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID =1 --1 cell

SELECT FirstName FROM Employees -- 1 tập giá trị

--2. Liệt kê các nhân viên ở LONDON 
SELECT *FROM Employees WHERE City = 'LonDon'

--3. Liệt kê các nhân viên cùng quê với King Robert
SELECT City FROM Employees WHERE FirstName = 'Robert'

SELECT *FROM Employees WHERE City = (SELECT City FROM Employees WHERE FirstName = 'Robert')

--Trong kết quả cần RoBert 
SELECT *FROM Employees WHERE City = (SELECT City FROM Employees WHERE FirstName = 'Robert') AND FirstName <> 'Robert'

--4. Liệt kê các đơn hàng
SELECT *  FROM Orders    ORDER BY Freight DESC
--4.1 Liệt kê  tất cả cac đon hàng lớn hơn 252kg
SELECT * FROM Orders WHERE Freight >= 252
--4.2 Liệt kê tất cả các đơn hàng có trọng luọnge loend hoưn trọng lượng đơn hàng 10555
SELECT * FROM Orders WHERE Freight >= (SELECT Freight FROM Orders WHERE OrderID = 10555 )

--BTVN
--1. Liệt kê danh sách các công ty vận chuyển hàng
--2. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có mã 1
--3. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express
--4. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express và trọng lượng từ 50-100
--5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Fillo Mix
--6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet 

