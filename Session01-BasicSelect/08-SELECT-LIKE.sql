USE NORTHWND
----------------------------------------------------------
--LÝ THUYẾT :
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
--Trong thực tế có những DATA/ FILTER theo kiểu gần đúng
-- Gần đúng trên kiểu chuổi, ví dụ liệt kê ai đó có tên là AN, khác câu
-- Liệt kê ai đó bắt đầu bằng chữ A
-- Tìm đúng dùng toán tử = 'AN'
-- tìm gần đúng, tìm có sự xuất hiện, không được dùng =, Dùng LIKE
-- LIKE.. 'A...'
-- cần dùng thêm % và _ 
-- % đại diện cho chuỗi bất kì
-- _ đại diện cho kí tự bất kì nào đó
--VD: Name LIKE 'A%' --> Bất kì ai có tên xuất hiện bằng chữ A, còn lại k quan tâm 
--	  Name LIKE 'A_', Bất kì có tên là 2 kí tự, trong đó kí tự đầu phải là A
----------------------------------------------------------
--THỰC HÀNH

--1. In ra danh sách nhân viên 
SELECT *FROM Employees
--2. Nhân viên nào có tên bắt đầu bằng chữ A
SELECT *FROM Employees WHERE FirstName LIKE 'A%'

--3. Nhân viên nào có tên bắt đầu chữ A, In ra màng hình cả full name được ghép đầy đủ
SELECT EmployeeID ,FirstName + ' ' +  LastName AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'
SELECT EmployeeID ,CONCAT(FirstName, ' ',  LastName) AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'

--4 Nhân viên nào có tên chữ A cuối cùng
SELECT EmployeeID ,CONCAT(FirstName, ' ',  LastName) AS [Full Name], Title FROM Employees WHERE FirstName LIKE '%A'

--5 Nhân viên nào có tên 4 kí tự 
-- dùng hàm kiểm tra độ dài tên = 4 hay không /
SELECT * FROM Employees WHERE FirstName LIKE '____'

--6. Xem danh sách các sản phẩm / món đồ đang có - Product 
SELECT * FROM Products
--7. Nhung sản phẩm nào có tên bắt đầu từ CH
SELECT * FROM Products WHERE ProductName LIKE 'Ch%'
SELECT * FROM Products WHERE ProductName LIKE '%Ch%'

--7 Những sản phẩm tên có 5 kí tự 
SELECT * FROM Products WHERE ProductName LIKE '_____'

--8  Những sản phẩm tên sản phẩm từ cuối cùng có 5 kí tự 
SELECT * FROM Products WHERE ProductName LIKE '%_____'
SELECT * FROM Products WHERE ProductName LIKE '% _____'
SELECT * FROM Products WHERE ProductName LIKE '% _____' or  ProductName LIKE '_____'


