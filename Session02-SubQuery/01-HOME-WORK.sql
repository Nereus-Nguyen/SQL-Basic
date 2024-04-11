USE NORTHWND

--BTVN
--1. Liệt kê danh sách các công ty vận chuyển hàng
--2. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có mã 1
--3. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express
--4. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express và trọng lượng từ 50-100
--5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Fillo Mix
--6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet 

--												Bài Làm 

--1. Liệt kê danh sách các công ty vận chuyển hàng
SELECT  * FROM Orders

--2. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có mã 1

SELECT * FROM Orders WHERE ShipVia = '1'

--3. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express
SELECT * FROM Orders WHERE  ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express')

--4. Liệt kê danh sách các đơn hàng được vận chuyển bởi công ty giao vận có tên Speedy Express và trọng lượng từ 50-100
SELECT * FROM Orders WHERE  ShipVia = (SELECT ShipperID FROM Shippers WHERE CompanyName = 'Speedy Express') 
AND Freight BETWEEN 50 AND 100
 
--5. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Fillo Mix
SELECT * FROM Categories
SELECT * FROM Products
SELECT * FROM Products WHERE CategoryID = (SELECT CategoryID FROM Products WHERE ProductName = 'Filo mix')


--6. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet 
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE BirthDate > (SELECT BirthDate FROM Employees  WHERE FirstName = 'Janet')